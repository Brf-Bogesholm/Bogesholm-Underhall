# Garage och parkering

Register över garage och parkeringsplatser.

## Register

- [`register.yaml`](register.yaml) – maskinläsbart register över garage och parkeringsplatser.

## Källa

Uppgifterna är importerade från `Förråd_garagelista 2026-02-25.xlsx`, uppdaterad 2026-02-25.

Registret omfattar 71 garage (701–771) och 8 parkeringsplatser med nummer som börjar på 9. Garage 771 är markerat som tillhörande BRF. De övriga 70 garagen och de 8 parkeringsplatserna är kopplade till lägenheter.

Klassificeringen rättades 2026-10-23 enligt beställaren: samtliga nummer 701–771 är garage och nummer som börjar på 9 är parkeringsplatser. Befintliga objekt-ID:n behålls för att bevara historik och hänvisningar; `P-771` betecknar därför nu Garage 771. Typfält och platsnummer avgör klassificeringen.

Parkeringsplatserna är 904, 905, 906, 909, 910, 911, 912 och 913. Beställaren har 2026-10-23 bekräftat att 907 och 908 inte finns. De utgör därför inga luckor att komplettera.

Tilldelningen är kopplad till respektive lägenhets objekt-ID.

Föreningens garage, tidigare benämnt garage 71, är Garage 771 (`P-771`). Det tillfälliga objekt-ID:t `G-FORENING-71` i utrustningsregistret behålls som historiskt alias och räknas inte som ytterligare garage. Släpvagnens förvaring hänvisar nu till `P-771`.

[Garagelängor](garagelangor.yaml) registreras separat från enskilda garage. Garagelänga 4 har belysning på områdesskylten på gaveln; vilka garage som ingår är inte fastställt.

## Portbyte 2016

Garage 1–70 (G-701–G-770) fick nya vita automatiska portar 2016. Garage 71 (771, stabilt ID P-771) undantogs eftersom det redan hade elport av annan modell. Se [portprojektet](../../byggnadsdelar/garageportar/README.md).

## Handikapparkeringar

[Handikapparkeringar](handikapparkeringar.yaml) saknar platsnummer. Ytan breddades 2024 och befintlig laddare blev åtkomlig med rullstol från båda sidor av bilen enligt beställaren. Faktura 10205 från Selvers Trädgård och Bygg AB: 14 438 kr inklusive moms och avrundning. Datum 2024-02-08 enligt stående fakturadatumregel. Exakt laddbox/kluster är inte fastställt.
