# Fakturor, tillgångar och genomförda åtgärder

Fakturan är det ekonomiska underlaget. Tillgången beskriver det fysiska objektet och åtgärden beskriver en genomförd händelse. En faktura kan ha flera rader, tillgångar och åtgärder.

- [Fakturor 2026](2026/register.yaml)
- [Åtgärder 2026](../atgarder/2026/register.yaml)
- [Gemensam utrustning och föreningens garage](../gemensamma-anlaggningar/utrustning/register.yaml)
- [Tekniska installationer](../tekniska-installationer/register.yaml)
- [Källor och godkända kompletteringar för första omgången](../inventering/importer/fakturor-2026-10-23.yaml)

- [Besiktningsprotokoll och anmärkningar för lekplatser 2026](../besiktningar/2026/lekplatser.yaml)
- [Lekplatser och lekredskap](../gemensamma-anlaggningar/lekplatser/register.yaml)
- [Dörrar med verifierad montering](../byggnadsdelar/dorrar/register.yaml)
- [Källor och godkända kompletteringar för andra omgången](../inventering/importer/fakturor-2026-10-23-02.yaml)

## Registreringsregler

Fakturor har stabilt ID, leverantör, fakturanummer, fakturadatum, belopp och flera fakturarader. Dubbletter kontrolleras med leverantörens organisationsnummer och fakturanummer. Belopp anges i SEK om inget annat anges. Radbelopp och à-priser är exklusive moms; fakturasumman har separat moms och öresavrundning.

Objekten följer [objektmodellen](../modell/objektmodell.yaml). I dessa register innehåller `underhållshistorik` åtgärds-ID:n som slås upp i det gemensamma åtgärdsregistret. Relationer skrivs med `typ` och `objekt`. Aktuell driftstatus sätts endast när den är känd; historisk installation innebär inte verifierad aktuell driftstatus.

Åtgärder hänvisar till faktura, fakturarader, objekt och källor. En hänvisning till en fakturarad innebär inte att hela radkostnaden tillhör just den åtgärden. Kostnader summeras endast från unika fakturor, aldrig genom att lägga ihop faktura, tillgång och åtgärd. För faktura 7313 är radlistan gemensamt underlag för tre åtgärder; kostnadsfördelningen är okänd.

Fakturadatum, leveransdatum och utförandedatum hålls isär. Datum som beställaren anvisat, såsom utförandedatum för 10382, har särskild källmarkering. Ursprunglig projekttext bevaras men ersätter inte verifierat faktiskt utfall.

**Stående datumregel från 2026-11-13:** För tidigare och kommande fakturor används fakturadatum som leverans-, installations- eller monteringsdatum där det är relevant och fakturan inte anger något annat datum. Särskilt angivna datum och tidigare verifierade datum behålls. Datum enligt regeln markeras med `K-DATUMREGEL-2026-11-13` och är administrativa registreringsdatum, inte observerade händelsedatum. Regeln kräver ingen ny kompletteringsfråga vid varje faktura. Reservmateriel får inte ett installationsdatum, och ett framtida angivet leveransdatum bevisar inte att montering har skett. Se [regel och retroaktiva kompletteringar](../inventering/importer/datumregel-2026-11-13.yaml).

`null` betyder okänd uppgift, inte noll eller frånvaro av garanti. `datastatus: verifierad` avser de registrerade sakuppgifterna och betyder inte att alla uppgifter är kompletta. Modell-/artikelbeteckningar är inte serienummer. En tidigare komponent får inte markeras som ersatt utan identifiering.

Originalfakturor lagras i föreningens dokumentarkiv, inte här. Filnamn identifierar underlagen tills beständiga SharePoint-länkar har kompletterats. Arkivering har inte verifierats. Betalningsstatus kan inte utläsas av fakturan och registreras därför inte.

Inköp, kostnad, garanti och underhållshistorik för server- och nätverksutrustning hör också hemma i underhållsregistret. Teknisk konfiguration och drift dokumenteras i Bogesholm-Server med hänvisning till samma objekt där det är möjligt.

## Besiktningar och identiteter

Besiktningsprotokoll lagras som strukturerade observationer med ursprungligt besiktningsdatum, protokollets utfärdandedatum, lokal objektsnumrering och felklassning. Nummer i protokollen är inte globala objekt-ID:n. IFI betyder inga fel identifierade vid besiktningen. Felklassningen är protokollets bedömning, inte en ny riskbedömning. Datumavvikelser mellan faktura och protokoll dokumenteras. Historiska anmärkningar blir inte automatiskt avhjälpta när arbete faktureras; verifierad koppling till respektive anmärkning krävs.

Fältet `kanoniskt_objekt` anger att en bevarad historisk beteckning är ett alias, inte ytterligare ett fysiskt objekt. `G-FORENING-71` hänvisar till Garage 771, vars befintliga ID `P-771` behålls trots rättad klassificering.

## Tredje registreringsomgången

- [Elarbeten utförda 2025](../atgarder/2025/register.yaml), fakturerade 2026.
- [Förnyade värmepumpsförsäkringar](../forsakringar/2026/register.yaml), separat från fakturor.
- [Källor, kompletteringar och dubblettkontroll](../inventering/importer/fakturor-2026-10-23-03.yaml).

När fakturan anger en gemensam lista med arbetsdatum utan fördelning mellan delåtgärderna lämnas respektive åtgärds datum okänt och de angivna arbetsdatumen bevaras separat. Rabatter lagras per rad; à-priset är före rabatt och radbeloppet efter rabatt.

## Fjärde registreringsomgången

- [Nätverks- och lagringsutrustning](../tekniska-installationer/natverk/register.yaml), med individuella diskobjekt och relationer till UNVR respektive UPS.
- [Källor och godkända kompletteringar](../inventering/importer/fakturor-2026-10-23-04.yaml).

Installationsdatum för denna omgång är fakturadatum enligt beställarens uttryckliga anvisning. Det är inte ett verifierat observationsdatum. Befintliga föräldraobjekt (UNVR och UPS) får inte automatiskt tillbehörens installationsdatum eller inköpskostnad. Två diskar delar en fakturarad, som bara summeras en gång. Värdeskåpet finns i utrustningsregistret.

## Femte registreringsomgången

[Källor och kompletteringar](../inventering/importer/fakturor-2026-10-23-05.yaml) dokumenterar sex fakturor för rackutrustning, kameror, switchar, reservmateriel och byte av portmotor i garage 740. Reservmateriel har inköpsdatum men inget installationsdatum. Enskilda enheter kan dela fakturarad utan att radkostnaden räknas flera gånger.

På faktura 1005437 summerar ursprungliga radbelopp till 7373,75 kr och beställaren bekräftar 0,25 kr öresavrundning till 7374 kr. Fakturans angivna netto och moms summerar samtidigt redan till 7374 kr. Båda representationerna bevaras; avrundningen enligt beställaren adderas inte igen till fakturans totalsummor och radbeloppen normaliseras inte till exklusive moms.

## Vattenledningsbesiktning, faktura 7594

[Besiktning](../besiktningar/2026/vattenledningar.yaml), [78 lägenhetskopplingar](../lagenheter/besiktningskopplingar-2026.yaml) och [källor](../inventering/importer/faktura-7594-2026-10-27.yaml). En gemensam händelse omfattar samtliga lägenheter, utan antagen kostnadsfördelning. Rapport inväntas. Fakturans arbetsdatum 15, 16 och 19 oktober bevaras; registrerat utförandedatum 22 oktober 2026 är enligt beställarens uttryckliga anvisning.

## Sjunde registreringsomgången, 13 november 2026

[Källor och kompletteringar](../inventering/importer/fakturor-2026-11-13-07.yaml) omfattar sju fakturor om totalt **74 715 kr inklusive moms och avrundning**:

| Faktura | Innehåll | Att betala, kr |
| --- | --- | ---: |
| Net Consulting 20180400 | Motorlås och kabel till Mellangångens dörr mot skyddsrummet | 6 419 |
| Öresundskraft 3612811400 | Biogashandel, oktober | 23 134 |
| Weum 3006729507 | Gasnät, oktober | 8 121 |
| Skånska Energi 3224954200 | Elnät och avdrag för nätersättning, oktober | 10 384 |
| Bixia 26110853503743 | Elhandel, oktober | 20 133 |
| Alex Rörtjänst 7634 | Termostat i kontoret och luft i avgasarens expansionskärl, utfört 4 november | 1 784 |
| Caiflow 1180 | Administration av elbilsladdare inklusive fakturaunderlag, november–januari | 4 740 |

Net Consultings fakturadatum är **2026-11-05**, bekräftat av beställaren efter felaktig initial läsning av skanningen. Separat datum för reparation och installation anges inte i fakturan; datumet har senare satts till 2026-11-05 enligt beställarens stående datumregel. Utläggsblanketten avser samma kostnad och skapar ingen extra faktura. Personuppgifter och privata kontouppgifter från blanketten publiceras inte.

Alex-fakturan kopplas till kontorets termostat och det befintliga lilla expansionskärlet till Spirotech S400. Arbete och servicebil är gemensamma för de två åtgärderna; de har inte kostnadsfördelats. Själva avgasaren får ingen antagen servicehändelse.

De fyra energifakturorna är driftkostnader, inte servicehändelser. [Energiregistret](../drift/energi/register.yaml) har en gemensam förbrukning per energislag och period så att handel och nät inte ger dubbelräknad förbrukning. Inmatad el är inte samma sak som total solelproduktion. [Caiflow-abonnemanget](../drift/abonnemang/register.yaml) bevarar tre fakturarader utan att anta vilka individuella laddare eller månader respektive rad avser.

## Toalettskylt, faktura 57551

[Källor och godkänd extraktion](../inventering/importer/faktura-57551-2026-11-13.yaml) för inköp av en taktil skylt med text **Toalett RWC**, avsedd för toalettdörren i föreningslokalen på Högalidsvägen 69. Fakturan från JC Kontakter AB / JC Gravyr & Tryck AB är daterad 12 november 2026: skylt 345 kr och frakt 36 kr exklusive moms, moms 95,25 kr, totalt **476,25 kr**. Leveransdatum enligt fakturan är 16 november 2026; faktisk leverans och montering är inte bekräftade. Händelsen registreras som inköp, utan antaget monteringsdatum.

## Låsreparation, faktura 2747

Christer o Magnus Bygg AB:s faktura 2747, daterad 2026-11-15, avser Mellangångens ståldörr mot skyddsrummet på Högalidsvägen 69, enligt beställarens bekräftelse. Samtliga sju fakturarader bevaras, inklusive CoM-arbete, två servicebilsposter samt Heras material och låstekniker. 4 422,50 kr exklusive moms, moms 1 105,63 kr, avrundning −0,13 kr, totalt 5 528 kr. Utförandedatum enligt stående regel är fakturadatum. Befintligt motorlås och dörr har fått en reparationshändelse, utan antaget nytt låsbyte. Betalningsstatus okänd. Låneavin är registrerad separat under [ekonomi](../ekonomi/README.md).
