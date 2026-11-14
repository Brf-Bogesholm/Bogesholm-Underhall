# Elbilsladdare – teknisk dokumentation

Föreningens laddpark består av **8 Compleo NEO 2x22kW Online**, totalt **16 laddpunkter**, uppdelade i två kluster på parkeringsplatsens **rad 1 och rad 2**. Varje kluster omfattar fyra dubbelladdare och åtta laddpunkter enligt avtalsunderlaget. Ursprungliga klusternummer har inte säkert översatts till radnummer.

**Driftsatt 2023-04-28 enligt beställarens bekräftelse.** Ett separat driftsättningsprotokoll har inte granskats. Entreprenör enligt avtalet: Compleo CS Nordic AB, med MW Group som underentreprenör.

## Utrustning och effekt

- AC-laddning med två Typ 2-uttag per laddbox. [Monta listar modellens kompatibilitet](https://monta.com/en/supported-charging-stations/compleo-neo/) (kontrollerat 2026-11-14). Detta innebär inte att föreningen använder Monta.
- Modellbeteckningen är 2x22 kW. **Varje kluster matas med 32 A och lastbalanseras mot fastigheten enligt avtalet.** Modellens maxeffekt är därför inte en utfästelse om samtidig tillgänglig effekt vid varje uttag.
- Tekniskt underlag omfattar Garo-stativ/montageboxar, Compleo Local IPC, tre strömtransformatorer och kommunikationsbox med 4G-router/modem. Nuvarande nätverkskonfiguration och exakt fysisk placering av kringutrustningen är inte verifierade.
- Serienummer, individuella laddar-ID:n och koppling till parkeringsplatsnummer saknas. Anläggning och kluster är gruppobjekt tills dessa uppgifter finns.
- Integrerat personskydd, DC-felströmsövervakning och OCPP-version för exakt levererad variant behöver verifieras mot rätt produktblad eller installationsunderlag. Ingen garantiperiod härleds här.

## Drift och support

**Caiflow AB** administrerar laddarna och sammanställer fakturaunderlag enligt beställaren. Befintligt abonnemang `AB-CAIFLOW-SILVER-001` och faktura 1180 är kopplade till anläggningen; ingen ny kostnad har skapats. Datumet för leverantörsbytet är okänt.

Compleo avslutade föreningens avtal enligt beställaren. Uppgiften att support för dessa laddare har upphört är inte verifierad som ett generellt supportstopp i Sverige. [Compleos officiella supportsida](https://www.compleocharging.se/support/kundsupport) beskriver fortfarande hårdvarusupport (kontrollerat 2026-11-14), utan att detta fastställer stöd för just NEO eller föreningens tidigare avtal.

Se [tekniskt register](register.yaml) och [importmanifest](../../inventering/importer/laddpark-teknik-2026-11-14.yaml). Priser och ekonomiska avtalsvillkor ingår inte i denna registrering. Originalet finns i föreningens dokumentarkiv.
