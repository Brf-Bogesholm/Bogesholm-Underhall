# Bogesholm – Raspberry Pi-kiosk

**Konfigurationsöversikt**  
**Senast dokumenterad:** 2026-10-29  

## Enhet och syfte

| Egenskap | Konfiguration |
|---|---|
| Enhet | Raspberry Pi 4 Model B |
| RAM | 4 GB |
| Värdnamn | `bogesholm-kiosk01` |
| Användare | `bogesholm` |
| Operativsystem | Raspberry Pi OS 64-bit med skrivbordsmiljö |
| Skrivbord/kompositor | labwc (Wayland), enligt den konfiguration som satts upp |
| Nätverk | WiFi på `wlan0` med NetworkManager-profilen `netplan-wlan0-Bogesholm_Closed`, gateway `10.70.20.1` |
| Webbläsare | Chromium |
| Startsida | https://www.bogesholm.se/nyheter/ |
| Visningsläge | Kiosk/helskärm |
| Inloggning | Automatisk skrivbordsinloggning (fungerar enligt test) |

Kiosken ska starta när strömmen kommer tillbaka, logga in automatiskt, öppna nyhetssidan i helskärm och hålla den uppdaterad utan handpåläggning.

## Filer och deras funktion

| Fil | Funktion |
|---|---|
| `/home/bogesholm/kiosk.sh` | Startar Chromium i kioskläge och kontrollerar var femte sekund om Chromium behöver startas igen. |
| `/home/bogesholm/refresh.sh` | Bevakar WiFi-anslutningen och återansluter vid avbrott. Laddar om sidan med Ctrl+R var 15:e minut och när nätverket kommit tillbaka, men bara om webbplatsen svarar. Källfil: [refresh.sh](refresh.sh) i denna mapp. |
| `/home/bogesholm/.config/labwc/autostart` | Startar båda skripten vid inloggning på skrivbordet. |

### `/home/bogesholm/kiosk.sh`

```bash
#!/bin/bash

URL="https://www.bogesholm.se/nyheter/"

while true; do
    if ! pgrep -u "$(id -u)" -x chromium >/dev/null; then
        chromium \
            --kiosk \
            --noerrdialogs \
            --disable-infobars \
            --no-first-run \
            --password-store=basic \
            "$URL" &
    fi

    sleep 5
done
```

**Beteende:** Chromium startas om ingen Chromium-process med det namnet körs för användaren. Kontroll sker med fem sekunders mellanrum. Om Chromium redan körs öppnas ingen extra flik av skriptet.

**Webbläsarinställningar:**

- `--kiosk`: helskärmsläge utan normal webbläsarkrom.
- `--noerrdialogs`: undertrycker vissa feldialoger.
- `--disable-infobars`: undertrycker vissa informationsfält.
- `--no-first-run`: hoppar över förstakörningsflöden.
- `--password-store=basic`: undviker beroendet av systemets lösenordsnyckelring för Chromiums lösenordslagring.
- **Ingen `--incognito`**: vanliga cookies och webbplatsinställningar kan finnas kvar mellan omstarter, exempelvis val i cookie-bannern.

**Begränsning:** Kontrollen ser om Chromium körs, inte om rätt sida visas eller om sidan svarar. En Chromium-process som hänger sig kan därför lämnas igång.

### `/home/bogesholm/refresh.sh`

Skriptet finns i sin helhet som [refresh.sh](refresh.sh) bredvid detta dokument. Filen på enheten ska vara en kopia av den.

**Beteende:** Skriptet väntar 60 sekunder efter start så att Chromium hinner öppnas. Därefter kontrollerar det läget **var 30:e sekund**:

1. **Är rätt WiFi-profil aktiv?** Om NetworkManager inte har `netplan-wlan0-Bogesholm_Closed` aktiv på `wlan0` försöker skriptet återansluta direkt med `nmcli connection up`.
2. **Svarar gatewayen?** Om profilen är aktiv pingas gatewayen `10.70.20.1` tre gånger. Kontrollen räknas som misslyckad bara om inget av dem besvaras. Efter **tre misslyckade kontroller i rad** (cirka 1,5 minut) startas anslutningen om med `nmcli connection down` följt av `connection up`. Det fångar fallet där enheten ser ansluten ut, och visas som online i UniFi, men ingen trafik går fram.
3. **Ska sidan laddas om?** När nätverket fungerar laddas sidan om **var 15:e minut**, och direkt när nätverket kommit tillbaka efter ett avbrott. Först kontrolleras att webbplatsen svarar (`curl`, 10 sekunders gräns). Svarar den inte väntar skriptet till nästa kontroll, så att en fungerande sida aldrig byts mot Chromiums felsida. Ligger webbplatsen nere rör skriptet aldrig WiFi-anslutningen.

Återanslutningsförsök görs **högst en gång per 2 minuter**. Misslyckas Ctrl+R görs ett nytt försök vid nästa kontroll i stället för först efter 15 minuter. Bara en kopia av skriptet kan köras åt gången; startas en till avslutas den direkt.

**Inställningar** finns samlade överst i skriptet:

| Variabel | Värde | Betydelse |
|---|---|---|
| `PROFILE` | `netplan-wlan0-Bogesholm_Closed` | WiFi-profilen i NetworkManager |
| `IFACE` | `wlan0` | Nätverkskortet |
| `GATEWAY` | `10.70.20.1` | Adressen som pingas för att kontrollera nätverket |
| `URL` | https://www.bogesholm.se/nyheter/ | Sidan som kontrolleras före omladdning |
| `STARTUP_DELAY` | `60` | Sekunder att vänta efter start |
| `CHECK_INTERVAL` | `30` | Sekunder mellan kontrollerna |
| `REFRESH_INTERVAL` | `900` | Sekunder mellan omladdningarna |
| `RECONNECT_INTERVAL` | `120` | Minsta antal sekunder mellan återanslutningsförsök |
| `GATEWAY_FAIL_LIMIT` | `3` | Missade gatewaykontroller i rad före omstart av WiFi |

**Loggning:** Skriptet skriver till systemloggen (journald) under namnet `kiosk-wifi`, och bara när något ändras: WiFi nere eller uppe igen, gatewayen svarar inte, återanslutningsförsök och om de lyckades, webbplatsen nere eller uppe, och misslyckad Ctrl+R. Ingenting visas på skärmen.

**Förutsättningar:**

- Chromium måste vara det aktiva fönstret när Ctrl+R skickas. Skriptet laddar inte om en webbläsarflik via något internt API.
- Skriptet måste startas från den grafiska sessionen (labwc:s autostart). Annars hittar `wtype` inte skärmen.
- `nmcli`, `ping`, `curl`, `wtype`, `logger` och `flock` måste finnas. Saknas något avslutas skriptet direkt.
- Användaren `bogesholm` måste kunna köra `/usr/bin/nmcli` med `sudo` utan lösenord. Annars misslyckas återanslutningen och loggen visar `a password is required`.
- Gatewayen `10.70.20.1` måste svara på ping. Gör den inte det tolkar skriptet nätverket som trasigt och startar om WiFi varannan minut.

**Begränsningar:**

- Fungerar WiFi och gatewayen men inte internet bortom den, väntar skriptet bara på att webbplatsen ska svara. Från kiosken går det inte att skilja det från att webbplatsen ligger nere, och en ny WiFi-anslutning hjälper inte i något av fallen.
- Efter `nmcli connection down` ansluter NetworkManager inte själv till profilen igen förrän någon aktiverar den eller enheten startas om. Misslyckas `connection up` direkt efteråt är det skriptets nästa försök, cirka 2 minuter senare, som tar upp anslutningen.
- En omstart av WiFi bryter pågående SSH-anslutningar.
- Raspberry Pi saknar batteridriven klocka. Direkt efter en kallstart kan webbplatskontrollen misslyckas med ett certifikatfel tills klockan synkats. Skriptet försöker igen var 30:e sekund, så raden i loggen kan ignoreras.

### `/home/bogesholm/.config/labwc/autostart`

De kioskrelaterade raderna är:

```bash
~/kiosk.sh &
~/refresh.sh &
```

Båda körs i bakgrunden vid användarens grafiska inloggning. Om filen innehåller andra rader bör de behållas.

## Startförlopp och återhämtning

1. Strömmen återkommer och Raspberry Pi startar automatiskt.
2. Raspberry Pi OS loggar in användaren `bogesholm` på skrivbordet.
3. `labwc` kör autostartfilen.
4. `kiosk.sh` öppnar Chromium på nyhetssidan i helskärm.
5. `refresh.sh` väntar en minut, laddar om sidan så fort nätverk och webbplats svarar, och gör sedan omladdningar med 15 minuters intervall.
6. Om Chromium avslutas startar `kiosk.sh` webbläsaren igen vid en senare femsekunderskontroll.
7. Om WiFi-anslutningen faller bort, eller gatewayen slutar svara, återansluter `refresh.sh` och laddar om sidan när nätverket och webbplatsen fungerar igen.

## Administration

Visa skripten och autostarten:

```bash
cat ~/kiosk.sh
cat ~/refresh.sh
cat ~/.config/labwc/autostart
```

Kontrollera att skripten är körbara:

```bash
ls -l ~/kiosk.sh ~/refresh.sh
```

Sätt körbehörighet om det behövs (litet `x`):

```bash
chmod +x ~/kiosk.sh ~/refresh.sh
```

Kontrollera om Chromium körs:

```bash
pgrep -a -u "$(id -u)" chromium
```

Läs loggen från `refresh.sh`:

```bash
journalctl -t kiosk-wifi          # allt
journalctl -t kiosk-wifi -b       # sedan senaste start
journalctl -t kiosk-wifi -f       # följ löpande
```

Om loggen är tom efter en omstart sparas systemloggen bara i minnet. Med `sudo mkdir -p /var/log/journal` och en omstart sparas den även över omstarter, så att det går att se vad som hände före ett strömavbrott.

Kontrollera förutsättningarna för `refresh.sh` (gatewayen ska svara och `sudo` ska inte fråga efter lösenord):

```bash
ping -c 3 10.70.20.1
sudo -n /usr/bin/nmcli general status
```

Installera eller uppdatera `refresh.sh` från [refresh.sh](refresh.sh), till exempel med kommandona nedan körda i denna mapp på en annan dator (ersätt värdnamnet med enhetens IP-adress om det inte går att nå):

```bash
scp refresh.sh bogesholm@bogesholm-kiosk01:~/refresh.sh
ssh bogesholm@bogesholm-kiosk01 'chmod +x ~/refresh.sh && sudo reboot'
```

Starta om enheten efter bytet. Annars kan den gamla kopian fortsätta köras, och den nya avslutas direkt om den gamla redan håller låset. Efter ett par minuter ska loggen visa en rad som börjar med `Bevakar wlan0` följd av `Sidan har laddats om`.

Ändra intervall och andra inställningar i variablerna överst i `refresh.sh` (se tabellen ovan), helst i filen i denna mapp så att den och enheten förblir lika. Installera den sedan enligt ovan.

Starta om enheten:

```bash
sudo reboot
```

## Skärmrotation – valfri inställning

Rotation diskuterades, men det är **inte bekräftat att någon rotation har aktiverats**. Därför ingår ingen rotationsrad i den dokumenterade aktiva autostarten.

För att identifiera skärmutgången:

```bash
wlr-randr
```

Exempel på 90° rotation (ersätt `HDMI-A-1` om skärmen har ett annat utgångsnamn):

```bash
wlr-randr --output HDMI-A-1 --transform 90
```

Om rotation ska ske vid varje inloggning kan samma kommando placeras före skripten i `~/.config/labwc/autostart`, eller rotationen konfigureras i skrivbordets skärminställningar.

## Övriga inställningar gjorda

- **Screen blanking/skärmsläckning:** avstängd.
- **SSH:** ska vara aktiverat.
- **WiFi-energisparläge:** avstängt (`iw wlan0 get power_save` visar `Power save: off`). Energisparläget är alltså inte orsaken till de avbrott som setts. Skulle kontrollen någon gång visa `on` stängs det av med filen `/etc/NetworkManager/conf.d/wifi-powersave-off.conf` med innehållet `[connection]` och `wifi.powersave = 2` på varsin rad, följt av en omstart.
- **OverlayFS/skrivskyddat filsystem:** avstängt. Kan aktiveras som extra skydd för filsystemet vid strömavbrott. Behöver dock stängas av vid uppdateringar etc i så fall. 
- **Cookieval:** kan sparas eftersom Chromium inte körs i inkognitoläge, men webbplatsens egen samtyckeshantering avgör om dialogen dyker upp igen.

> **Obs:** Detta dokument är en ögonblicksbild av den senast överenskomna konfigurationen, inte en ändringshistorik. För att verifiera exakta filinnehåll och inställningar på den fysiska enheten används kommandona ovan.
