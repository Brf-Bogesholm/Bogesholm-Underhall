# Dörrar

## Inventering 2026

`inventering-2026.csv` är arbetsunderlaget för inventering av dörrarna till föreningens 78 lägenheter.

Inventeringen följer den gemensamma [`objektmodellen`](../../modell/objektmodell.yaml). Varje rad har ett stabilt dörr-ID, men blir ett permanent objekt först när inventeringsuppgifterna har kvalitetssäkrats.

Det finns tre inventeringspunkter per lägenhet:

- Entrédörr
- Balkongdörr
- Förrådsdörr

Totalt: 234 dörrar.

### Klassning av dörrmodell

Vid inventeringen används följande princip:

- **Gammal** → installationsår `1984`
- **Ny** → installationsår `2020-2026`

Installationsåret/perioden ska inte fyllas i utifrån antaganden utöver denna klassning. Om dörrmodellen inte kan bedömas ska fältet lämnas tomt och detta anges i kommentaren.

### Inventeringsdatum

Inventeringsdatumet anger när dörren faktiskt observerades. Det är inte ett uppskattat installationsdatum.

### Syfte

Inventeringsfilen är ett arbetsunderlag. När inventeringen är genomförd och kvalitetssäkrad förs uppgifterna över till det permanenta dörrregistret.

Originaldokument och eventuell kompletterande historik hör fortsatt hemma i föreningens dokumentarkiv. Historiska uppgifter ska inte skapas eller skärpas utan underlag.

## Registrerade monteringar

[register.yaml](register.yaml) innehåller de dörrar vars montering verifierats genom faktura och beställarens kompletteringar. Inventeringspunkt kopplar till lägenhetens dörrplats, inte till en tidigare fysisk dörr. Dörrinköp sker separat i batch; inköpskostnad och inköpsfaktura kompletteras först när underlaget finns. Inventeringsfilens observationsdatum och skick ändras inte utifrån fakturauppgifter.
