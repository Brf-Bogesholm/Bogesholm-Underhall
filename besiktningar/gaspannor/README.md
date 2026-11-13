# Gaspannor och undercentral – kontrollhistorik

[Kontrollregistret](register.yaml) innehåller **30 kontrollposter** ur arkivet Gaspannorna: 25 drifts-/funktionskontroller, två gasbesiktningar och tre pannvisa brandskyddskontroller. [Källförteckning och avgränsningar](../../inventering/importer/gaspannor-2026-11-13.yaml) omfattar samtliga 45 dokument. Åtta PDF-/Excelpar räknas som samma kontroll, inte som ytterligare besök. De tre brandskyddsprotokollen gäller samma kontrolldag men olika pannor.

## Objekt och pannornas ordning

Objekten finns i [installationsregistret](../../tekniska-installationer/register.yaml).

| Objekt | Beteckning |
| --- | --- |
| TI-UC-69-001 | Undercentralen på Högalidsvägen 69 |
| TI-GASANLAGGNING-69-001 | Gasanläggningen |
| TI-GASPANNA-69-001 | Panna 1, vänster sett framifrån |
| TI-GASPANNA-69-002 | Panna 2, mitten sett framifrån |
| TI-GASPANNA-69-003 | Panna 3, höger sett framifrån |
| TI-GASKANAL-LUCKA-69-001 | Lucka vid väggen vid gemensamma kanalen |
| TI-EXPANSIONSKARL-69-VARME-001 | Värmesystemets stora expansionskärl |

Ordningen är bekräftad av beställaren den 13 november 2026. Pannobjekten följer nummer/position. Serienummer och eventuell utbyteshistorik saknas; det är inte verifierat att samma fysiska pannor funnits under hela historiken. Brandskyddsprotokollen från 2024 anger Vaillant ECO TEC för panna 1 och ECO TEC PLUS för pannorna 2 och 3. Fullständiga modellvarianter är inte fastställda.

## Senaste kontroller och uppföljning

| Datum | Kontroll | Dokumenterat resultat |
| --- | --- | --- |
| 2026-01-09 | Weum gasbesiktning | Besiktning godkänd. Pannvisa värden för CO, O2, CO2 och tillförd effekt vid min-/maxlast. |
| 2025-12-11 | Riksbyggen funktionskontroll | Kontrollpunkter och mätvärden enligt protokollet. Avgasare markeras n/a, vilket enligt formuläret betyder ej tillgänglig. |
| 2024-06-05 | Brandskyddskontroll, panna 1 | Luckan vid väggen vid den gemensamma kanalen ej öppningsbar. **Åtgärdsstatus okänd**, bekräftat av beställaren 2026-11-13. |
| 2024-06-05 | Brandskyddskontroll, panna 2 och 3 | Kontrollerna föranledde inga anmärkningar. |
| 2023-02-21 | Weum gasbesiktning | Gasanläggningen godkänd. Övertrycksvakter kontrollerade = Ok enligt notering. |

Brandskyddsprotokollens filnamn anger 2024-07-02, men kontrollernas datum är **2024-06-05**. Kontrollfristen 6 år återges som en uppgift i protokollen, inte som en ny beräkning av nästa bokade kontroll.

Weums senare godkännande avser en annan kontrolltyp och bevisar inte att luckan har åtgärdats. Den historiska anmärkningen hålls därför kvar med okänd åtgärdsstatus, utan antaget föreläggande eller sista åtgärdsdag.

## Vad historiken visar

De äldre funktionskontrollerna innehåller bland annat noteringar om otäta ventiler, expansionskärl, rost på högra gaspannan, ventilation i undercentralen och larmkedjans uppkoppling. Noteringarna är historiska observationer, inte automatiskt aktuella fel eller nya reparationsbeställningar. Utfört arbete hålls skilt från förslag och kontrollnoteringar.

**Beställarens komplettering 2026-11-13:** Rapporternas referenser till expansionskärl avser **värmesystemets stora expansionskärl**, med eget objekt-ID `TI-EXPANSIONSKARL-69-VARME-001`. Kontrollpunkter, förtryck, äldre läckagenoteringar och påfyllning kopplas till detta objekt. Fysiska byten av stora kärlet över perioden är inte fastställda. [Komplettering och berörda kontrollposter](../../inventering/importer/expansionskarl-koppling-2026-11-13.yaml).

Det lilla expansionskärlet till Spirotech S400 har det separata ID:t `TI-EXPANSIONSKARL-69-S400-001` och behåller sina två fakturerade luftpåfyllningar 2026. Rapporternas stora kärl tillför ingen servicehändelse till det lilla kärlet. Separata kontrollpunkter för avgasare identifierar inte automatiskt dagens Spirotech S400. Mätarställningar är inte förbrukning under en period.

Äldre Excelprotokoll bevarar tekniska tabellceller och koordinater. Nyare protokoll har separata kontrollpunkter, mätvärden och noteringar med källceller. `Ok` gäller vid respektive kontroll; `n/a` följer formulärets betydelse **ej tillgänglig**. Ingen sammanfattande godkännandestatus har lagts till där den inte uttryckligen finns.

## Avvikelser och övriga dokument

- Protokollen från 2010 anger **Högalidsvägen 73D**. De registreras som äldre kontrollunderlag utan automatisk koppling till dagens undercentral på 69. För januari finns även en avvikelse: filnamnet anger 20 januari, medan handskrivet datum tolkas som 21 januari. Tolkningen är markerad för kontroll.
- Protokollet under **2016/besök 2** är daterat **2017-10-01** i både PDF och Excel. Handlingsdatum bevaras med uttrycklig konfliktmarkering.
- Wordmallen är ingen kontroll. Aviseringar om filterbyte är inte bevis på utfört arbete; aviseringen från 2019 har dessutom motstridiga årtal.
- Lägenhetsaggregatens kontrollsammanställning från april 2020 är källförtecknad men ingår inte i denna pannimport. Samma ventilationsunderlag finns på sidorna 2–4 i 2020 års kombinerade PDF; pann-/UC-kontrollen är sida 1. Lägenhetsvis registrering återstår separat.
- Felkodsförteckningen är referensmaterial och innebär inte att felen har inträffat.
- Anläggningskortet från 2014 har i huvudsak tomma tekniska tabeller. Inga saknade kapaciteter eller serienummer har antagits.

Originalen lagras i föreningens dokumentarkiv. Här finns strukturerade uppgifter och filreferenser, utan teknikernas person-/kontaktuppgifter. Kontrollerna har åtgärdshänvisningar i respektive årsregister. Inga fakturor, kostnader eller betalningar har skapats från dessa protokoll.
