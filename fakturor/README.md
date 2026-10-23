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
