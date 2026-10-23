# Import: Förråd, garage och lägenheter

**Källa:** `Förråd_garagelista 2026-02-25.xlsx`

**Underlagets uppdateringsdatum:** 2026-02-25

## Importerade uppgifter

- 78 lägenheter
- 78 lägenhetsanknutna förråd
- 70 garage kopplade till lägenheter
- 8 parkeringsplatser kopplade till lägenheter
- 1 parkeringsplats markerad som BRF (771)
- 15 byggnadsobjekt enligt föreningens befintliga byggnadslista, med koppling till lägenheterna där sådan finns

## Objektkoppling

Varje lägenhet har kopplats till:

- hus
- förråd
- garage eller parkeringsplats
- föreningens befintliga Objekt-ID

Inga personuppgifter om boende har importerats.

## Datakvalitet

Förråd 610 och 611 förekommer i källunderlaget endast som `N/A`. De ingår inte som aktiva objekt i förrådsregistret. Osäkerheten är dokumenterad som en historisk notering och får bara leda till egna objekt om framtida underlag visar att de faktiskt funnits.

Parkeringsplats 771 är markerad som `BRF` i underlaget och har därför lagts in som föreningsanknuten parkeringsplats.

## Registerfiler

- `lagenheter/register.yaml`
- `byggnader/register.yaml`
- `gemensamma-anlaggningar/forrad/register.yaml`
- `gemensamma-anlaggningar/garage-och-parkering/register.yaml`


## Rättelse 2026-10-23

Beställaren har förtydligat att samtliga nummer 701–771 avser garage och nummer som börjar på 9 avser parkeringsplatser. Den ursprungliga tolkningen ovan av plats 771 som parkeringsplats är därmed korrigerad. Registret innehåller efter rättelsen 71 garage och 8 parkeringsplatser. Objekt-ID P-771 behålls men typ och namn har ändrats till garage respektive Garage 771. Saknade parkeringsnummer skapas inte utan underlag.
