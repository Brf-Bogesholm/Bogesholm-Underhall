# Driftkostnader och abonnemang

- [Energiperioder](energi/register.yaml) knyter samman handel och nät för samma anläggning och förbrukning.
- [Abonnemang](abonnemang/register.yaml) beskriver tjänstens innehåll och vilka fakturaperioder som dokumenterats.
- [Fakturor 2026](../fakturor/2026/register.yaml) innehåller belopp, moms, avrundning och samtliga fakturarader.

Kostnader summeras endast från unika fakturor. En driftpost är en hänvisning och skapar ingen ytterligare kostnad. Fakturor för elhandel och elnät respektive gashandel och gasnät delar förbrukningspost: deras kWh får inte summeras två gånger. Inmatning på elnätet är inte total solelproduktion.

En fakturerad energiperiod eller administrationstjänst är inte en utförd underhållsåtgärd. Fakturaperioden bevisar inte betalning eller automatisk förnyelse av abonnemanget. Okända kopplingar till individuella laddare lämnas öppna.
