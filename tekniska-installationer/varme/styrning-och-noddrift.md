# Styrning av värmepumpar och reservvärme — undersökningsjournal

Status: **utkast med dokumenterade källbegränsningar**, 2026-11-02.
Detta är ett arbetsminne, inte en godkänd driftinstruktion. Inga driftinställningar har ändrats i dokumentationsarbetet.

## Syfte och placering

Bevara undersökningen av SMO 40, fyra uppgivna F2120-20, BAS2/Modbus, gasreservvärme, Sigenergy och generatorbaserad nöddrift. Målen enligt användaren är att minska gasanvändningen, utnyttja billig el och begränsa elbehovet vid ödrift så att batterierna och datornätverket kan hållas igång.

Bogesholm-Underhall är enligt [repots README](../../README) föreningens långsiktiga tekniska minne. Därför ligger anläggningshistorik och denna undersökningsjournal här. Serverintegrationer och deras framtida konfiguration hör enligt samma README till Bogesholm-Server. Ingen parallell driftkonfiguration införs här.

## Källor och bevisnivåer

- **V-DOK**: direkt kontrollerat dokumentinnehåll. Bevisar vad dokumentet säger, inte att anläggningen följer dokumentet.
- **U**: användaruppgift eller funktionsbeskrivning återgiven av användaren.
- **A**: tidigare assistentpåstående, inklusive dess tolkningar av bilder som inte finns tillgängliga här.
- **H**: hypotes eller nytt undersökningsförslag.
- **V-DRIFT**: kräver daterat testprotokoll eller direkt kontrollerad driftobservation. Inga nya sådana verifieringar har utförts här.

| Källa | Omfattning och begränsning |
| --- | --- |
| K1: [Styrning av värmepumparna](https://chatgpt.com/c/6ae8c6b3-8890-83ed-ac9f-492944f5aed8) | Historikverktyget gav 2026-11-02 bara fem sena användarinlägg, inga läsbara assistentsvar, inga bilagor och ingen fortsatt sidmarkör. Referenskoderna är inte sakunderlag. |
| K2: användarens inklistrade historik i dokumentationschatten 2026-11-02 | Innehåller både användartext och assistenttext fram till förslag om att öppna BAS2-manöverbilder. Ursprungliga bilder saknas. Användaren uppger att detta var hela historiken. Rollindelningen har bedömts utifrån textens samtalsföljd. |
| K3: [tekniska-installationer/register.yaml](../register.yaml) | Kontrollerad på main vid commit bd0dabb415dddf245a38ae412907cc205e9b9add. Blob 6a7730a2050e4da82b71dc882eb8b28d464f3a83. Inte en ny fysisk inventering. |
| K4: [NIBE SMO 40 registerlista](https://headless.nibe.eu/download/18.9a97aba184a9b5f272c79/1669796426064/Modbus%2040%20NIBE%20SMO%2040.pdf) | Direkt läst 2026-11-02: ModbusManager 1.0.9, 20210827, Product SMO40, Database 8310, 31 sidor. Installerad programvaruversion är okänd. |
| K5: [MODBUS 40 installatörshandbok 031725-9](https://www.nibe.eu/assets/documents/21149/031725-9.pdf) | Identifierad på officiell webbplats; direkt öppning misslyckades med timeout. Protokoll- och installationspåståenden räknas därför inte som färdigkontrollerade här. |
| K6: lokal kopia av Bogesholm-Server, documentation/services/bastec.md | Säger att Bastec övervakar men inte styr luftvärmepumparna. Aktualitet mot GitHub kunde inte verifieras; filhämtningar gav 404. Motsäger K2:s återgivna styrbeskrivning och behöver utredas. |

## Anläggningsuppgifter och rättelser

| Uppgift | Nivå, källa och slutsats |
| --- | --- |
| SMO 40 i pannrummet | U, K2 och aktuell beställning. Tidiga stavningar SM40/smo4 behandlas inte som separata modeller. Typskylt och firmware återstår. |
| Fyra NIBE F2120-20 | U, K2. K3 har bara tre individuella objekt: TI-VP-06414119101020, TI-VP-06414119101018 och TI-VP-06414119101011. K3 uppger F2120-20 3X400V och installationsdatum 2019-06-11. Registret är uttryckligen ofullständigt; tre registrerade objekt motbevisar inte fyra installerade. Fjärde identiteten saknas. |
| 2 000 liter i värmepumpssystemet och 1 000 liter i varmvattenkretsen | U, K2, uttrycklig rättelse. Mellanliggande uppgift 200 liter är rättad till 2 000. Behandla volymerna separat; hydraulik och användbar lagring är inte verifierade. |
| Värmepumparna kopplade på radiatorkretsens retur | U, K2. Inte verifierat kopplingsschema. |
| Tre Vaillant-gaspannor, tidigare enda uppvärmningen, numera spets/reserv | U, K2 och K1. Modellbeteckningar saknas. Användaren uppger att gasen kan bära värmen utan märkbar komfortförlust så länge gas finns. Detta är inte ett dokumenterat ödriftsprov. |
| 5601-P1 är radiatorkretsens cirkulationspump | U, uttrycklig rättelse i K2. Tidigare assistenttolkning som separat värmepumpspump ska inte återanvändas. |
| Modbus mellan SMO 40 och BAS2 | U, K2. Återgiven BAS2-text anger Modbus RTU. Master, modul, adress, kabelväg och skrivbehörigheter är inte direkt kontrollerade. |
| myUplink används men användaren kan inte styra därifrån | U, K2. Bevisar inte att produkten generellt saknar styrstöd. |
| Generatorn kan både ladda batterier och försörja laster | U, K1, inlägg a32a601f-f4a7-4f4b-8a50-4d09de336498. Modell, koppling, kapacitet och prov saknas. Sigenergy ingår enligt beställningen; samspelet är inte verifierat. |
| Styrelsen har använt arbetsbrytarna och vet inte hur mjukvarublockering görs | U, K1, inlägg 1dacc5ff-556e-4253-a28d-f88c6bfb53d8. Användarens antagande att service blockerar mjukvarustyrt är H, inte konstaterad serviceprocedur. |

## BAS2-funktion enligt användarens återgivna text

Följande är **U/K2**, inte en avläsning av aktuell DUC-kod eller inställningar:

- DUC1 sitter i AS1 i pannrummet.
- 5600-GT11 regleras efter utetemperaturkurva GT41 med gaspannor 1–3. Vid varmvattenladdning anges ett manuellt börvärde 65 °C; efter uppnådd beredartemperatur över 59 °C återgår normalt börvärde.
- Laddningen styrs enligt texten av maxvärdet av 5201-VVB-GT11 och GT12. P2 anges starta under 54 °C och stoppa över 59 °C.
- 5601-GT11 regleras mot utetemperaturkurva GT10 med 5601-SV11 när spets behövs.
- 5601-P1 går vid låg utetemperatur med hysteres och motionering enligt schema.
- KVP01 får starttillstånd när 5601-P1 är i drift. Start sker när gradminuter understiger startgränsen; drift anges fortsätta till +30 gradminuter eller tills P1 stoppar.
- Formuleringen för spets är: ”Då värmepumpen är i drift eller om det finns larm på värmepumpen och gradminuterna är under -500 tillåts 5601-SV11 att gå in och reglera”. Den logiska grupperingen av ”eller” och ”och” är inte entydig i prosa. Kontrollera DUC-logiken innan slutsats dras.
- Katastrofskyddsreläet anges lösa ut vid strömavbrott, gasbrännaromkopplaren vid dörren eller utlöst högtrycksvakt och bryta matningen till samtliga gaspannor. Återställning och beteende vid reservkraft är okända.
- Textens avsnitt 5201-PUMPSTYRNING nämner också P1(Värme) och ett temperaturvillkor. Det får inte utan kontroll likställas med 5601-P1:s kompletta funktion.

KVP01 förekommer som BAS2-beteckning för värmepumpsfunktionen. Tidigare assistents förklaring av förkortningen och att objektet säkert omfattar alla fyra pumpar är A, inte verifierad objektmappning.

## Tidigare bildtolkningar — inte direkt verifierade här

K2 innehåller assistentens avskrift av bilder, men inga tillgängliga originalbilder. Bevara värdena som **A**, utan känd mättid:

| Visat objekt enligt assistenten | Frekvens | BT12 | BT3 |
| --- | --- | --- | --- |
| VP1-VS | 57 Hz | 31,2 °C | 26,6 °C |
| VP2-VS | 57 Hz | 31,9 °C | 26,6 °C |
| VP3-VV | 58 Hz | 31,5 °C | 31,5 °C |
| VP4-VV | 57 Hz | 32,0 °C | 26,6 °C |

Andra återgivna värden: ute 9,4 °C; 5601-GT11 29,1 °C; börvärde 28,4 °C; SV11 0 %; 5600-GT11-börvärde 65 °C.

Hypotesen om VP3 (avfrostning/driftsekvens, givare, flöde eller felaktig visning) är öppen. Värdena bevisar varken fel eller utebliven värmeproduktion. Slutsatsen att ingen spets tillfördes och att aktiva gaspannor berodde på varmvatten är assistenttolkningar, inte verifierad energibalans. Etiketterna VS/VV bevisar inte hydraulisk tilldelning.

Användaren anger att VVM-knappen bara ger en statistikruta. Assistentens tolkning att den gäller vattenvolymmätning är A. Den ska inte användas som väg till värmepumpsstyrning utan ny evidens.

## Register: tidigare påståenden och kontroll mot NIBE

**V-DOK/K4, inte V-DRIFT.** ID är NIBE-listans register-ID, inte verifierade BAS2-adresser eller färdiga PDU-offsetar. Ingen skrivning följer av tabellen. Factor är återgiven från listan; klientens skalning och teckenhantering ska kontrolleras.

| ID | Tidigare assistentpåstående | Kontroll i K4 |
| --- | --- | --- |
| 40004 | BT1 ute, läs | BT1, °C, s16, factor 10, R; PDF s. 1 |
| 40008 | BT2 framledning, läs | Ingen träff i den kontrollerade listan. Ej godkänd mappning. |
| 40012 | BT3 retur, läs | EB100-EP14-BT3, °C, s16, factor 10, R; s. 1. Får inte antas avse varje pump. |
| 43005 | Gradminuter, läs | s16, factor 10, R/W; s. 11. Tidigare åtkomstbeskrivning var ofullständig. |
| 47027 | Utetemperatur för punktförskjutning, läs/skriv | °C, s8, factor 1, -40…30, R/W; s. 19 |
| 47028 | Punktförskjutning, läs/skriv | °C, s8, factor 1, -10…10, R/W; s. 19 |

Dessa sex kandidater är nu dokumentkontrollerade med ovanstående avvikelse. Börja inte om samma sökning utan skäl; nästa fråga är versionsmatchning och lokal signalmappning. För 40008 behövs en annan officiell versionsspecifik källa eller en korrigerad mappning.

Tidigare uppgifter om funktionskod 03/16, RS485-parametrar, maximal framledning 65 °C och BAS2 som master är **A** tills relevant officiell handbok och installerad version har jämförts. Dokumentets R/W anger inte att BAS2 faktiskt skriver eller att styrning är lämplig i denna hydraulik. Nominella ”80 kW” är assistentens summering av modellstorlekar, inte uppmätt eller garanterad värmeeffekt.

## Beslut, förslag och förkastade vägar

| Punkt | Status och skäl |
| --- | --- |
| Dokumentera källor, kontroller och resonemang i GitHub | Användarbeslut, K1 och aktuell beställning. |
| Ingen ändring av driftkonfiguration inom denna uppgift | Användargräns, aktuell beställning. |
| Minimera gas och skydda batterireserv/nätverk vid avbrott | Användarmål. Slutlig styrstrategi är inte beslutad. |
| Börja i befintlig BAS2 och kartlägga läsning före styrning | Tidigare assistentförslag. Inget belagt integrationsbeslut eller genomfört test. |
| Hålla prisoptimering och nöddrift som skilda strategier | Tidigare assistentförslag med olika mål; inte belagt styrelsebeslut. |
| Ny direkt master på befintlig RTU-buss | Avrådd av tidigare assistent på grund av möjlig masterkonflikt. Topologin är inte verifierad; inget belagt slutligt användarbeslut. |
| Återkommande start/stopp som vanlig effektreglering | Avrått assistentförslag för att undvika ryckig drift och kompressorstarter. Ingen verifierad styrmetod vald. |
| Höja till högsta möjliga temperatur eller ändra -500 direkt | Avrått före driftanalys. Temperaturkrav, COP, kapacitet och ekonomi saknas. |
| Räkna ihop alla tankar som ett tillgängligt värmepumpslager | Avvisat i assistentresonemanget: skilda kretsar/funktioner. Hydraulik återstår. |
| Fortsätta via VVM-knappen | Spåret lades åt sidan efter användarens besked om statistikrutan. |
| Mjukvarublockering i stället för arbetsbrytare vid nöddrift | Undersökningsspår, inte etablerad rutin. Skydd och cirkulation måste klarläggas. |

Det finns inget underlag för att kalla ovanstående assistentförslag formella föreningsbeslut eller fullständigt förkastade tekniska alternativ. Ytterligare historiska beslut, registerändringar eller testutfall får inte rekonstrueras genom gissning.

## Genomförda kontroller och ändringar

| ID | Datum | Kontroll/resultat | Vad återstår |
| --- | --- | --- | --- |
| DOK-01 | 2026-11-02 | Läste tillgänglig chatthistorik och användarens komplettering. Källluckan dokumenterad. | Originalbilder och eventuella ytterligare protokoll |
| DOK-02 | 2026-11-02 | Läste repostruktur, README och installationsregister på main. Tre identifierade pumpar. Ingen separat värmestyrningsjournal fanns i trädet. | Fjärde pumpens identitet |
| DOK-03 | 2026-11-02 | Kontrollerade sex tidigare registerkandidater mot K4; avvikelser för 40008 och 43005. | Installerad firmware och BAS2-mappning |
| DOK-04 | 2026-11-02 | Identifierade lokal Bastec-text med motstridig styrbeskrivning. | Aktuell serverdokumentation och faktisk DUC-funktion |
| DOK-05 | 2026-11-02 | Identifierade K5; direkt hämtning misslyckades. | Handbokskontroll av kommunikationsprotokoll |

**Inga belagda historiska registerändringar finns i det tillgängliga materialet.** Inga tidigare Modbus-läsningar eller skrivningar kan här redovisas med råvärde, tid och svar. Bildtolkningar ersätter inte sådana prov. Inga tester har körts mot BAS2, SMO, Sigenergy, generator eller pannor i detta arbete.

## Nästa steg utan att upprepa kända kontroller

1. **T-01, återfinn underlag:** arkivera originalbilder och eventuella befintliga service-/testprotokoll i ordinarie dokumentarkiv. Länka beständigt hit. Återskapa inte äldre tester innan underlagen eftersökts.
2. **T-02, inventera utan ändring:** läs typskylt, SMO-/MODBUS-version, fyra pumpidentiteter och aktuell hydraulik. Knyt VP1–VP4 till serienummer. Bekräfta tankvolymer och användningsområden.
3. **T-03, BAS2 endast läsning:** hämta aktuell punktlista och funktionsbeskrivning med rätt behörighet. Fastställ master, gateway/API, adresskonvention, registermappning, skalning, återkommande skrivningar och vem som äger börvärden. Red ut K6-motsägelsen.
4. **T-04, korrelera befintliga värden:** jämför BAS2, SMO-display och dokumenterad registermappning vid samma tid. Logga GM, bör-/ärtemperaturer, per-pump frekvens, larm, driftläge, P1, SV11 och varmvattenladdning. Kontrollera VP3 över flera driftfaser. Skriv inte till registren.
5. **T-05, kapacitet och ekonomi:** använd flöde, temperaturdifferens, uppmätt el och gas samt tidsstämplar för att bedöma gasorsak och eventuell optimering. Hz är inte elektrisk kW. Högre börvärde garanterar inte mer nyttig värme.
6. **T-06, reservkraftens förutsättningar:** dokumentera installerade Sigenergy-/generatorprodukter, övergångar, batterigränser, ödriftsindikering, tillgänglig effekt per fas, startförlopp och övriga kritiska laster. Verifiera särskilt gasens katastrofskydd/återställning med ansvarig installatör.
7. **T-07, framtida godkänt funktionsprov:** först när officiella driftgränser, ansvar, återställning och stoppvillkor är dokumenterade kan ett separat övervakat prov av mjukvarublockering föreslås. Inga skrivtest eller strömavbrottsprov ingår i denna uppgift.

## Säkerhetsgränser för fortsatt arbete

Detta är föreslagna arbetsgränser, inte tillverkarens kompletta säkerhetsinstruktioner:

- Behåll befintliga skydd och reservfunktioner. Kringgå inte katastrofskydd, högtrycksvakt eller gasbrännaromkopplare.
- Använd inte arbetsbrytarna som automatisk reglerstrategi. Den rapporterade historiska användningen är ingen godkänd nöddriftsrutin.
- Fastställ hur frostskydd, cirkulation och avfrostning fungerar vid blockering/effektbegränsning innan något sådant prov.
- Ingen extra RTU-master, registerskrivning, ändring av GM/spetsgräns, temperatur, varmvattenhygien eller återstart utan separat verifierad plan.
- Registerlistans intervall är inte säkra driftgränser för denna installation. Sätt inga numeriska styrgränser utifrån dem.
- Reservkraftsplanen måste ha kontrollerade villkor för utebliven kommunikation, för gamla mätvärden, låg batterireserv, gasbortfall, generatorfel och återgång till nät. Automatik är inte beslutad.
- Ett framtida aktivt prov ska avbrytas vid oväntat larm, förlorad cirkulation, instabil reglering eller bortfall av erforderliga mätvärden; återställning ska vara förberedd och ansvarig person utsedd.

## Fortsättningsmall

Lägg till en daterad rad per kontroll; ersätt inte gamla slutsatser utan ange vad som rättats och varför:

| Test-ID/datum/utförare | Fråga och förutsättningar | Modell/firmware och källversion/sida | Signal/register-ID samt faktisk adresskonvention | Före/råvärde/skalning/svar/tid | Resultat och bevislänk | Ändring och återställning | Status/nästa steg |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Nästa post | Ej genomförd | Saknas | Saknas | Saknas | Saknas | Ingen | Öppen |

För ett ändrat register behövs dessutom gammalt och nytt värde, enhet, kommando-/svarskod, beslutsansvarig, återläsning och observerad fysisk effekt. En lyckad skrivkvittens ensam räcker inte.

När en källa motsägs: behåll den gamla uppgiften som historik, länka den nya evidensen och ändra bevisnivå uttryckligen. Upprepa en kontroll bara vid versions-/konfigurationsändring, motstridig evidens eller otillräckligt tidigare protokoll.
