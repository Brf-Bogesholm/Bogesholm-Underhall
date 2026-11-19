# Radiatorsystem – injustering 2019

Historiskt projekt med **EBmetoden AB** som huvudentreprenör och **A.G. Malmströms Rör AB** som underentreprenör. Underlaget innehåller radiator-/dimensioneringslista, temperaturkontroller, driftinformation, byggmötesprotokoll och 31 skannade VS-ritningssidor. Registret omfattar **78 lägenheter och kvartershuset på Högalidsvägen 69**.

## Sökbara data

- [578 radiatorposter](radiatorlista-2019.yaml): typ, ventil, Kv, flöde, effekt, tryckfall samt ursprungliga cellvärden. Poster är historiska dimensionerings-/injusteringsuppgifter, inte ett säkert antal installerade EB-don eller dagens radiatorbestånd.
- [584 temperatur-/kontrollrader](temperaturkontroll-2019.yaml): rum, temperaturskillnad över radiator, rumstemperatur, kommentarer och datumkoppling. Tomma värden är inte noll. Antalet rader är inte antalet lyckade mätningar.
- [Projekt, försättsblad, avvikelser och ritningsindex](injustering-2019.yaml).
- [Källförteckning och importkontroll](../../inventering/importer/injustering-radiatorer-2019-2026-11-19.yaml).

Ursprungliga rumsbeteckningar bevaras. Lägenhetsadresser har kopplats till befintliga stabila lägenhets-ID:n. Kvartershusets gamla rumsnamn används inte som en automatisk aktuell rumsinventering.

## Tider och kontroll

Byggstart planerades till veckorna 10–12, **2019-03-04–2019-03-22**, i ordning från 79-huset ned till 51-huset. Det är en plan, inte individuellt verifierade installationsdagar. Byggmötesprotokollet hänvisar till kontrakt 2019-01-28. Mötesdatum anges huvudsakligen 2019-02-05, men mötesförteckningen har även 2019-02-06; avvikelsen bevaras.

Funktionskontroll efter montering av EB-don dokumenterades:

| Datum | Husgrupp | Sekundär tillopp/retur | Utetemperatur enligt försättsblad |
|---|---|---|---|
| 2019-12-02 | 77, 79 | 41/37 °C | +4 °C kl 08 |
| 2019-12-03 | 71, 73, 75 | 48/42 °C kl 08 | −3 °C kl 08 |
| 2019-12-03 | 65, 67 | 42/38 °C kl 12 | +2 °C kl 12 |
| 2019-12-04 | 51, 53, 55, 57, 59, 61, 63 | 37/34 °C | +7 °C kl 08 |

Datum kopplas från husgruppen, med uttryckligt undantag **59A kontrollerad 3/12**. Kvartershusets individuella mätdatum har inte kunnat fastställas. Temperaturbladets gemensamma huvuddatum 4/12 har inte felaktigt lagts på alla rader. Produktionsvärden står på raden ”Annan”; den har inte omtolkats till gas eller värmepump. Oifyllda värmekurvor, reglercentral och nattsänkning förblir okända.

## Fem uppföljningar med okänt utfall

**71H, 75E, 67G, 63A och 57D** hade noteringen låst vid temperaturkontrollen, med saknade mätvärden. Beställaren bekräftar 2026-11-19 att inga senare genomförandedatum är kända. Eventuell senare kontroll har därför **status okänd**. Det är inte ett påstående att all tidigare injustering i dessa lägenheter uteblev. Projekthistoriken är länkad från samtliga lägenheter, med särskild markering på dessa fem.

## Anmärkningar och utförda åtgärder i kontrollistan

| Lägenhet | Rum | Historisk anmärkning | Senare status |
|---|---|---|---|
| 67H | 217 S | Inbyggd/oåtkomlig radiator; EB-don inte monterat | Okänd |
| 61C | 207 S | Tillopp och retur skiftade, bör åtgärdas | Okänd |
| 59D | 114 ENT | Tillopp och retur skiftade, bör åtgärdas | Okänd |

Det finns **11 renspolningsnoteringar** i 79A, 79D, 77D, 75A, 73A, 73E, 65A, 67F, 63E, 57C och 55A. Dessa är åtgärdsnoteringar, inte fakturor eller belägg för byte av radiator. Kontrollistan innehåller också öppna fönster, avstängda/demonterade radiatorer, extra elvärme, matlagning och torktumlare. Sådana förhållanden bevaras som kontext till mätvärdena, inte som dagens lägenhetsskick.

Den generella boendeinformationen säger att alla radiatorer har EB-don, men den särskilda avvikelsen i 67H har företräde som individuell observation. Inget automatiskt antal nya termostater härleds ur dessa listor.

## Pump och dimensioneringsuppgifter

EBD-listan anger **GRUNDFOS MAGNA 3 50-120, inställning 80 kPa**, totalt flöde **14 337 l/h** och effekt **254 kW**. Dessa är historiska list-/dimensioneringsuppgifter; de bevisar inte dagens verkliga flöde, effekt eller inställning. Modelluppgiften kan jämföras med det befintliga modellobjektet för MAGNA3 50-120 F, men listan fastställer inte ett nytt individuellt serienummer eller att det är samma fysiska pump.

Dimensioneringsrubrikerna anger radiator/luft-ΔT 50 och radiator-ΔT 20; dessa ska inte blandas med uppmätta ΔT i temperaturlistan. RPM-fältets 0 är inte belägg för avstängd pump. Kolumner E/F saknar egen tydlig rubrik och sparas därför utan antagen dimensionsenhet. Tryckfallet 0,00 återges från listan utan att betecknas som verifierat mätresultat.

## Bestående driftinformation från projektet

EBmetodens driftblad anger att nya eller ersatta radiatorer i tvårörssystemet ska förses med EB-don. Vid cirkulationspumpbyte ska EBmetoden kontaktas för rätt flöde och tryck. Detta är historiska anvisningar att bevara inför förändringar av systemet; inga nya driftinställningar har införts.

Byggmöte 1.1 förtydligar att en handdukstork som ersätter badrumsradiator behöver motsvarande effekt, annars kan badrumstemperaturen påverkas. Version 1.0 hade ett annat råd; det har inte lagts in som en likvärdig aktuell rekommendation. Protokollet säger också att läckande befintliga SR-ventiler ska ersättas med motsvarande kvalitet i metall. Det är en instruktion vid läckage, inte bevis för att alla sådana ventiler byttes. Egenkontroller skulle överlämnas enligt kontrollplan; ett krav är inte ett utfärdat slutintyg.

## Ritningar

EBR VS-ritning.pdf innehåller 31 skannade sidor med EBmetodens stämpel och röda radiator-/lägenhetsmarkeringar. Sida 1 visar områdeskulvert, sida 2 sektioner och detaljer, sida 3 kvartershusets installationer. På sida 3 är äldre centraldiagram överstrukna; de används inte som aktuellt kopplingsschema. Sidorna 4–31 visar lägenhetshusen, normalt botten-/övervåning i varierande sidordning.

| Ritningens husbokstav | Adressnummer | PDF-sidor |
|---|---:|---|
| A | 79 | 4–5 |
| B | 77 | 6–7 |
| C | 71 | 8–9 |
| D | 75 | 10–11 |
| E | 73 | 12–13 |
| F | 65 | 14–15 |
| G | 67 | 16–17 |
| H | 63 | 18–19 |
| I | 61 | 20–21 |
| J | 59 | 22–23 |
| K | 57 | 24–25 |
| L | 55 | 26–27 |
| M | 53 | 28–29 |
| N | 51 | 30–31 |

Samtliga sidor är visuellt granskade i översikt. Alla små dimensionsangivelser, rörsträckningar och handskrivna markeringar är **inte fullständigt transkriberade**; vid detaljfrågor ska rätt originalsida läsas. Ritningarnas äldre grundinformation intygar inte senare ombyggnaders utförande.

## Versionshantering

De två Excel-filerna skiljer sig som binärfiler men har samma sparade cellvärden i samtliga fem blad. Data har importerats en gång; inga formler har omräknats. Kopior av ritningen och de två drift-/boendeinformationen är byte-identiska och har inte dubbelräknats. Originalfiler, privata kontaktuppgifter och interna datorsökvägar har inte lagts i repot. Inga nya faktura- eller kostnadsposter har skapats.
