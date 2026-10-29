#!/bin/bash
#
# refresh.sh – håller kioskskärmen vid liv
#
# Bevakar nätverket på två sätt: att NetworkManager har rätt WiFi-profil
# aktiv, och att gatewayen faktiskt svarar på ping. Raspberryn kan nämligen
# se ansluten ut (och synas som online i UniFi) fast ingen trafik går fram.
# Saknas profilen återansluter skriptet direkt; svarar gatewayen inte på
# GATEWAY_FAIL_LIMIT kontroller i rad startas anslutningen om. Försöken görs
# högst en gång per RECONNECT_INTERVAL.
#
# När nätverket fungerar laddas sidan i Chromium om var REFRESH_INTERVAL:e
# sekund, och direkt när nätverket kommit tillbaka – men bara om webbplatsen
# svarar, så att en fungerande sida aldrig byts mot en felsida. Ligger
# webbplatsen nere väntar skriptet bara; WiFi rörs aldrig för det.
#
# Kräver nmcli, ping, curl, wtype (Wayland), logger och flock, samt en
# sudoers-regel som låter användaren köra /usr/bin/nmcli utan lösenord.
# Loggen läses med:  journalctl -t kiosk-wifi -f

set -u

# Inställningar – kan överstyras med miljövariabler, t.ex. vid test
PROFILE="${KIOSK_PROFILE:-netplan-wlan0-Bogesholm_Closed}"
IFACE="${KIOSK_IFACE:-wlan0}"
GATEWAY="${KIOSK_GATEWAY:-10.70.20.1}"
URL="${KIOSK_URL:-https://www.bogesholm.se/nyheter/}"

STARTUP_DELAY="${KIOSK_STARTUP_DELAY:-60}"            # ge Chromium tid att starta
CHECK_INTERVAL="${KIOSK_CHECK_INTERVAL:-30}"          # hur ofta läget kontrolleras
REFRESH_INTERVAL="${KIOSK_REFRESH_INTERVAL:-900}"     # omladdning var 15:e minut
RECONNECT_INTERVAL="${KIOSK_RECONNECT_INTERVAL:-120}" # minst 2 min mellan försöken
GATEWAY_FAIL_LIMIT="${KIOSK_GATEWAY_FAIL_LIMIT:-3}"   # missade kontroller före omstart

TAG="kiosk-wifi"

log() {
    logger -t "$TAG" -- "$*"
    # Körs skriptet i en terminal? Visa det där också.
    if [[ -t 2 ]]; then
        printf '%(%T)T  %s\n' -1 "$*" >&2
    fi
}

for cmd in nmcli ping curl wtype logger flock sudo; do
    if ! command -v "$cmd" >/dev/null; then
        echo "$TAG: hittar inte '$cmd', avslutar" >&2
        exit 1
    fi
done

# Bara en instans åt gången – två skulle ladda om sidan dubbelt
exec 9>"${XDG_RUNTIME_DIR:-/tmp}/$TAG.lock"
if ! flock -n 9; then
    log "Körs redan, avslutar"
    exit 0
fi

trap 'log "Stoppas"; exit 0' INT TERM

last_reconnect=-$RECONNECT_INTERVAL  # första försöket får ske direkt
next_refresh=0
needs_refresh=1                      # ladda om så fort allt fungerar
gateway_failures=0                   # missade kontroller sedan senaste försöket

# Senast kända läge, så att bara ändringar loggas
network_problem=""                   # tom när nätverket fungerar
site_up=1
keys_ok=1

# Svarar gatewayen på minst ett av tre ping?
gateway_answers() {
    ping -c 3 -W 2 -q "$GATEWAY" >/dev/null 2>&1
}

# Nätverket fungerar inte – sidan visar troligen en felsida nu
network_down() {
    needs_refresh=1
    if [[ $1 != "$network_problem" ]]; then
        log "$1"
        network_problem=$1
    fi
}

network_ok() {
    gateway_failures=0
    if [[ -n $network_problem ]]; then
        log "Nätverket fungerar igen"
        network_problem=""
    fi
}

# Försök återansluta, dock inte oftare än RECONNECT_INTERVAL.
# Med "restart" kopplas en aktiv men död anslutning ner först.
try_reconnect() {
    (( SECONDS - last_reconnect >= RECONNECT_INTERVAL )) || return 0
    last_reconnect=$SECONDS
    gateway_failures=0

    local output
    if [[ ${1:-} == restart ]]; then
        log "Startar om WiFi-anslutningen $PROFILE"
        # Efter "down" ansluter NetworkManager inte själv till profilen igen,
        # så det är "up" nedan (eller nästa försök) som måste få upp den
        if ! output=$(sudo -n /usr/bin/nmcli -w 10 connection down "$PROFILE" 2>&1); then
            log "Nedkoppling misslyckades: ${output//$'\n'/ }"
        fi
        sleep 2
    else
        log "Försöker återansluta till $PROFILE"
    fi

    if output=$(sudo -n /usr/bin/nmcli -w 15 connection up "$PROFILE" ifname "$IFACE" 2>&1); then
        log "Återansluten"
    else
        log "Återanslutning misslyckades: ${output//$'\n'/ }"
    fi
}

# Ladda om sidan, men bara om webbplatsen faktiskt svarar
reload_page() {
    local error
    if ! error=$(curl -fsSL -o /dev/null --max-time 10 "$URL" 2>&1); then
        if (( site_up )); then
            log "Webbplatsen svarar inte, väntar med omladdning: $error"
            site_up=0
        fi
        return
    fi
    if (( ! site_up )); then
        log "Webbplatsen svarar igen"
        site_up=1
    fi

    # Misslyckas Ctrl+R görs ett nytt försök vid nästa kontroll
    if ! error=$(wtype -M ctrl -k r -m ctrl 2>&1); then
        if (( keys_ok )); then
            log "Kunde inte skicka Ctrl+R, försöker igen: $error"
            keys_ok=0
        fi
        return
    fi
    if (( ! keys_ok )); then
        log "Ctrl+R fungerar igen"
        keys_ok=1
    fi

    if (( needs_refresh )); then
        log "Sidan har laddats om"
    fi
    needs_refresh=0
    next_refresh=$((SECONDS + REFRESH_INTERVAL))
}

sleep "$STARTUP_DELAY"
log "Bevakar $IFACE ($PROFILE), gateway $GATEWAY och $URL"

while true; do
    active=$(nmcli -g GENERAL.CONNECTION device show "$IFACE" 2>/dev/null)

    if [[ $active != "$PROFILE" ]]; then
        network_down "WiFi nere (aktiv profil: ${active:-ingen})"
        try_reconnect
    elif ! gateway_answers; then
        # WiFi ser anslutet ut men ingen trafik går fram
        gateway_failures=$((gateway_failures + 1))
        network_down "Ansluten till WiFi men gatewayen $GATEWAY svarar inte"
        if (( gateway_failures >= GATEWAY_FAIL_LIMIT )); then
            try_reconnect restart
        fi
    else
        network_ok
        if (( needs_refresh || SECONDS >= next_refresh )); then
            reload_page
        fi
    fi

    sleep "$CHECK_INTERVAL"
done
