# Bogesholm – Raspberry Pi-kiosk

**Konfigurationsöversikt**  
**Senast dokumenterad:** 2026-10-17  

## Enhet och syfte

| Egenskap | Konfiguration |
|---|---|
| Enhet | Raspberry Pi 4 Model B |
| RAM | 4 GB |
| Värdnamn | `bogesholm-kiosk01` |
| Användare | `bogesholm` |
| Operativsystem | Raspberry Pi OS 64-bit med skrivbordsmiljö |
| Skrivbord/kompositor | labwc (Wayland), enligt den konfiguration som satts upp |
| Webbläsare | Chromium |
| Startsida | https://www.bogesholm.se/nyheter/ |
| Visningsläge | Kiosk/helskärm |
| Inloggning | Automatisk skrivbordsinloggning (fungerar enligt test) |

Kiosken ska starta när strömmen kommer tillbaka, logga in automatiskt, öppna nyhetssidan i helskärm och hålla den uppdaterad utan handpåläggning.

## Filer och deras funktion

| Fil | Funktion |
|---|---|
| `/home/bogesholm/kiosk.sh` | Startar Chromium i kioskläge och kontrollerar var femte sekund om Chromium behöver startas igen. |
| `/home/bogesholm/refresh.sh` | Laddar om sidan med Ctrl+R var 15:e minut. |
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

```bash
#!/bin/bash

sleep 60

while true; do
    wtype -M ctrl -k r -m ctrl
    sleep 900
done
```

**Beteende:** Väntar 60 sekunder efter att skriptet startats, skickar Ctrl+R och upprepar därefter omladdningen **var 15:e minut** (`900` sekunder).

**Förutsättning:** Chromium måste vara det aktiva fönstret när tangentkombinationen skickas. Skriptet laddar inte om en webbläsarflik via något internt API.

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
5. `refresh.sh` väntar en minut och gör sedan omladdningar med 15 minuters intervall.
6. Om Chromium avslutas startar `kiosk.sh` webbläsaren igen vid en senare femsekunderskontroll.

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

Ändra intervall för omladdning genom att redigera `~/refresh.sh` och ändra `sleep 900` till önskat antal sekunder. Starta därefter om **refresh-skriptet eller den grafiska sessionen** så att ändringen används.

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
- **OverlayFS/skrivskyddat filsystem:** avstängt. Kan aktiveras som extra skydd för filsystemet vid strömavbrott. Behöver dock stängas av vid uppdateringar etc i så fall. 
- **Cookieval:** kan sparas eftersom Chromium inte körs i inkognitoläge, men webbplatsens egen samtyckeshantering avgör om dialogen dyker upp igen.

> **Obs:** Detta dokument är en ögonblicksbild av den senast överenskomna konfigurationen, inte en ändringshistorik. För att verifiera exakta filinnehåll och inställningar på den fysiska enheten används kommandona ovan.
