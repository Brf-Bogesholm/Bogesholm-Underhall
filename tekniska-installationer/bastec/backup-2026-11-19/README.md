# BAS2 – DUC-backup 19 november 2026

**Backup från DUC 2026-11-19 kl. 20.40**, enligt Bup.htm och beställarens uttryckliga bekräftelse att backupen gjordes precis då. Tidszonen är Europe/Stockholm. Dokumentationen är en ögonblicksbild av den hämtade konfigurationen, inte en kontinuerlig liveavläsning eller ett nytt funktionsprov.

Den färska backupens .bup-filer används framför det tidigare paketerade BAS2_Brf Bogesholm.txt-arkivet när filerna skiljer sig. Driftbilder och funktionstexter kommer från den daterade undermappen 261119 204048. Äldre 2015-dokumentation bevaras som historik.

Detta är en **dokumenterad och avgränsad kopia**, inte en återställningsbar BAS2-backup. Komplett original med alla filer ska behållas i föreningens dokumentarkiv. Inga ändringar i anläggningen har gjorts vid dokumentationen.

## Innehåll

- [Funktionstabeller](funktionstabeller.yaml): analoga/digitala ingångar och utgångar, minnen, regulatorer, fördröjningar, PLC, pumpar, tidkanaler, pulser, loggdefinitioner, larmdefinitioner och bussobjekt.
- [Modbus-karta, 41 konfigurerade objekt](modbus.yaml): objektnummer, namn, registeradress och ursprungliga kod-/skalningsfält.
- [Sparade versioner och skillnader](versionsskillnader.yaml): ALARM1, CONTR1, DIGIN1, MODBUS1 och MBUS1 där numrerade versioner finns.
- [Jämförelse med 2015](jamforelse-2015.yaml): antal numrerade objekt och skillnader i tabellrader.
- [Driftbildernas etiketter och objektkopplingar](driftbilder.yaml): strukturellt index för sex XML-bilder.
- [Funktionsbeskrivning och värmepumparnas larmlista](funktionsbeskrivningar.yaml).
- [Källförteckning med kontrollsummor](../../../inventering/importer/bastec-duc-backup-2026-11-19.yaml): även filer vars innehåll inte publiceras.

IP-adresser, TCP-portar, användare/inloggningsuppgifter, larmmottagarnas kontaktuppgifter och operatörsloggen har utelämnats. Modbus-objekt med samma nätanslutning har fått en anonym anslutningsgrupp för att bevara sambandet. Larmtabellen innehåller definitioner, inte kvitterande användare eller larmlogg.

## Viktiga skillnader mot 2015

| Funktion/objekttabell | Historisk export 2015 | DUC-backup 2026-11-19 |
|---|---:|---:|
| Modbus-objekt | 0 | 41 |
| M-Bus-objekt | 0 | 2 |
| Analoga ingångar | 9 | 10 |
| Analoga minnen | 33 | 38 |
| Regulatorobjekt, inklusive reserver | 6 | 8 |
| Digitala minnen | 26 | 35 |
| Digitala utgångsobjekt, inklusive reserv | 4 | 5 |
| Larmdefinitioner, inklusive systemlarm | 26 | 33 |

2015 års utskrivna larmlista visar 20 anläggningslarm; exportens 26 inkluderar dessutom systemlarm 94–99. Dessa två räknesätt får inte blandas. Antal konfigurerade objekt betyder inte att alla är i aktiv drift eller att kommunikation fungerar. Loggdefinitionstabellens 128 platser innebär inte 128 aktiva mätserier. PLC-programrader räknas inte som numrerade objekt.

Följande funktioner framgår av backupen:

- Värmepumpssignaler och börvärdestilldelningar via Modbus, inklusive gradminuter, temperaturer, larm, kompressorfrekvenser och fläkt-/kompressorstatus.
- Regulator 7 **5600-Fläkt UC**, med rumsgivare AS1-GT31 på AI21 och AO6 i PLC. Den får inte sammanblandas med föreningslokalens OVK-aggregat FF1 enbart på grund av samma lokala benämning FF1.
- Regulator 8 **VS1-Påfyllning**, digital utgång DO5 benämnd **5601-VS1 Påfyllning** samt nya analoga minnen för magnetventil/gränsvärde. Full reglerfunktion ska bedömas från PLC och objektsamband, inte bara regulatorns namn.
- M-Bus-objekt för **VS1-påfyllning volym** och **VVM Volym**. Enhets-/exponentfält och lagrade mätarvärden återges som exportdata, inte validerad debitering eller nytagen fysisk mätning.

## Modbus-kartan

BAS2-objekt 1–40 innehåller bland annat följande grupper; objekt 41 gäller avgasning:

| BAS2-objekt | Signalgrupp | Exempel på Dataadress i källan |
|---|---|---|
| 1–3 | Beräknade börvärden och gradminuter | 47016, 7020, 43006 |
| 4–7, 9–12 | Värmepumps-/systemtemperaturer, larm och gränser | 45002, 40072, 40153, 40014, 40005, 43010, 47207, 47376 |
| 14–35, 39–40 | EB101–EB104 temperaturer och driftstatus | Exakt per objekt i Modbus-kartan |
| 36–38 | Systemtryck, varningskod och önskat systemtryck | 102, 103, 206 |
| 41 | Degassing | 101, bitmask 0010 |

Objekt 8 heter endast ett apostroftecken och objekt 13 heter Test. De har inte döpts om eller tagits som verifierade produktionssignaler. Statusobjekt 33–35 har enheten °C i källan; det bevaras som en källavvikelse och innebär inte att kompressorstatus är temperatur. Bitmasker och numeriska koder är strängar så att inledande nollor inte försvinner.

**BAS2:s Dataadress bevaras exakt.** Ingen automatisk förskjutning mellan 0-/1-baserade adresser eller mellan registertyper har gjorts. Datatyp, talområde, multiplikator, skaloffset, bitmask och alternativ skrivning behöver förstås tillsammans innan de används i en ny klient. Befintlig PLC tilldelar MB(1), MB(2) och MB(12); det dokumenterar redan konfigurerad styrning men är ingen instruktion att införa nya skrivningar.

EB101–EB104 är kommunikationsbeteckningar. Backupen fastställer inte deras koppling till föreningens fysiska VP1–VP4 eller serienummer. Den tidigare bekräftade VP-numreringen i utrustningsregistret är därför bevarad och har inte skrivits över. Namnet VP1 i en Modbus-signal kan avse systemets styrenhet/signalkonvention och är inte ensam bevis för ett visst pumpserienummer.

## Funktionsbeskrivning och PLC måste skiljas åt

Undercentral.txt innehåller historisk funktionstext med tillägg om värmepumpsdrift och värmespets. Det finns skillnader mellan text, namn och faktisk programkod:

- Funktionstexten beskriver maxvärdet av beredargivarna för laddningsstart/stopp. PLC beräknar **AM34 = min(AI16, AI19)** och **AM33 = max(AI16, AI19)**; startvillkor använder AM34/AM29 och stoppvillkor AM33/AM30. Texten har inte skrivits om så att motsägelsen döljs.
- Programmet använder gradminutvillkor MB3 < −5000 och MB3 > −2400. Kommentaren anger −500 respektive −240. Skalan måste beaktas; råa programtal får inte behandlas direkt som fysiska gradminuter utan verifiering.
- Larmkod 183 jämförs särskilt och kommenteras som avfrostning som inte ska ge summalarm. Det är den befintliga kodens kommentar, inte en ny generell tolkning av alla värmepumpslarm.
- DO5 tilldelas från **NMB(41)**. Objekt 41 heter Degassing och har bitmask 0010. Detta samband bevaras exakt och ska granskas innan logiken för påfyllning/avgasning ändras; full funktion kan inte härledas enbart från signalnamn.

PLC använder arbetsminnen på flera ställen och tilldelningsordningen har betydelse. Dokumentationen är ingen fullständig programsimulering. Övriga pannsekvenser, laddning, pumpar och larmlogik finns sökbart i tabellen PLC1.bup med ursprunglig radordning.

Katastrofförreglingens fysiska säkerhetskedja från installationsdokumentationen hålls åtskild från Modbus-funktioner. Backupen ersätter inte elritning, säkerhetsprov eller fysisk inventering.

## Driftbilder, reservversioner och övriga filer

Sex driftbilder ingår i bildindexet: Flödesbild Undercentral, Manöverbild Undercentral, Spirovent S400, start, VVM och Värmepumpar. XML-filerna beskriver gränssnitt, värdesymboler och manöverobjekt. Indexet bevarar etiketter, DUC-/objektnummer och BAS2 connectionType, men är inte en fullständig bildrendering eller en fysisk rör-/plintlista.

Spirovent S400-bilden kopplar till Modbus-objekt 36, 37, 38 och 41. Övriga anslutnings- och kopplingskoder behöver tolkas i BAS2:s format. Bildreferensens namn ändrar inte utrustningsregistrets identitet. Värmesystemets stora expansionskärl och avgasarens lilla expansionskärl hålls fortsatt separata.

Numrerade filer (.001, .002 osv.) bevaras som versionsreferenser med egna tidsstämplar och skillnader. Vissa skiljer bara i tidsstämpel, andra även i data. De läggs inte ihop till ett nytt styrprogram och filändelsens nummer bestämmer inte vilken som är aktuell. Senast hämtade .bup används som dokumenterad huvudversion.

Energi.txt är i sig ett ZIP med **Energi.mdb**. Databasens innehåll har inte tolkats eller publicerats. Riksbyggen.txt och logotyper är stödmaterial, inte PLC-konfiguration. Logotypfilerna listas med kontrollsummor men kopieras inte till repot.

## Modell och framtida jämförelser

DUC1:s dokumenterade hårdvarureferens är fortsatt **BAS2 XE16-COM med två E16-moduler** enligt äldre relationshandlingar. Den nya backupen bevisar inte individuella serienummer eller att hårdvaran aldrig bytts. Utrustningsobjekt TI-BASTEC-69-DUC1 har fått hänvisning till denna backup, utan ändring av modellhistorik, serienummer eller pumpnumrering.

Denna backup är nu utgångspunkt för kommande dokumentationsjämförelser. Vid senare ändring sparas ny daterad ögonblicksbild och skillnader; 2015 och denna version skrivs inte över. För faktisk återställning används föreningens kompletta originalbackup.
