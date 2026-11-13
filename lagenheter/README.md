# Lägenheter

Detta avsnitt innehåller dokumentation av föreningens lägenheter och de byggnadsdelar och installationer som kan knytas till respektive lägenhet.

## Struktur

Lägenheterna organiseras under respektive hus.

Exempel:

`Hus 57 → Lägenhet 57-01`

Det verifierade registret omfattar 78 lägenheter och finns i [`register.yaml`](register.yaml).

## Komplettering från lägenhetsutdrag

Den 13 november 2026 kompletterades samtliga lägenheter med fastighetsbeteckning, våningsuppgift, insats i SEK och andelstal enligt utdraget daterat **12 december 2025**. [Källor och kontroller](../inventering/importer/lagenhetsutdrag-2026-11-13.yaml). Adresser, antal rum och ytor överensstämmer med tidigare register. Befintliga objekt-ID:n och kopplingar har bevarats.

- **Kävlinge Bågen 1:** 35 lägenheter i hus 51–63.
- **Kävlinge Bågen 2:** 43 lägenheter i hus 65, 67 och 71–79. Föreningslokalen i hus 69 omfattas inte av lägenhetsutdraget.
- Våningsuppgifterna återges som **1 TR** (58 lägenheter) och **2 TR** (20 lägenheter), utan egen tolkning av våningsnumreringen.
- Skatteverkets lägenhetsnummer **1001** är bekräftat av beställaren för samtliga lägenheter; alla har enskild ingång. Numret identifierar därför inte ensamt en lägenhet i föreningen.

`ekonomi.insats` är insatsbeloppet i SEK. `ekonomi.andelstal_procent` innehåller separata fält för källans **Andelstal K**, **Andelsvärde** och **Insats**. Procenttalen lagras som decimalsträngar med fem decimaler. Rubrikernas användning tolkas inte om, och små differenser mot 100 procent behålls. Uppgifterna avser underlaget från 2025-12-12 och är inte en bekräftelse på att alla värden är oförändrade idag.

Riksbyggens gamla lägenhetsnummer, ekonomiska planens registreringsdatum och övriga ekonomiska uppgifter har utelämnats enligt beställarens anvisning. Originalet med boende- och pantuppgifter publiceras inte.

## Dokumentationsprincip

En lägenhet ska kunna identifieras entydigt och kopplas till rätt hus.

Lägenheten kan i sin tur kopplas till individuella objekt, exempelvis:

- Dörrar
- Fönster
- Andra byggnadsdelar
- Installationer som är specifika för lägenheten
- Underhållsåtgärder som avser lägenheten

Lägenhetens dokumentation kan innehålla:

- Objekt-ID
- Lägenhetsnummer
- Hus
- Placering
- Aktuell status
- Underhållshistorik
- Relaterade objekt
- Hänvisningar till originaldokument

Personuppgifter om boende ska inte lagras här. Dokumentationen ska beskriva fastigheten och dess underhåll, inte de personer som bor i den.

Uppgifter som ännu inte är verifierade ska inte presenteras som fakta.

## Gemensamma besiktningar

[Besiktningskopplingar 2026](besiktningskopplingar-2026.yaml) knyter varje lägenhet till gemensam besiktningshändelse, faktura och rapportreferens. [Vattenledningsbesiktningen](../besiktningar/2026/vattenledningar.yaml) på faktura 7594 omfattar samtliga 78 lägenheter enligt beställaren. Utförandedatum 2026-10-22 används enligt beställarens anvisning. Rapporten inväntas och inga individuella resultat har registrerats.

Kostnaden för en gemensam besiktning summeras en gång från fakturan, inte per lägenhetskoppling. När rapporten kommer kompletteras samma rapportreferens och resultat kopplas till respektive lägenhet.

## Ansökningar och dokumentuppföljning

[Lägenhetsärenden](arenden/README.md) skiljer på ansökan, beslut, utförande och slutdokumentation, med källreferenser och uttrycklig markering av saknade uppgifter.
