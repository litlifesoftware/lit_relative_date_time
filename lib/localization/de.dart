import 'package:lit_relative_date_time/models.dart';

/// `German` localization
const RelativeDateLocalization LOC_DE = RelativeDateLocalization(
  languageCode: 'de',
  timeUnitsSingular: [
    'Sekunde',
    'Minute',
    'Stunde',
    'Tag',
    'Woche',
    'Monat',
    'Jahr',
  ],
  timeUnitsPlural: [
    'Sekunden',
    'Minuten',
    'Stunden',
    'Tagen',
    'Wochen',
    'Monaten',
    'Jahren',
  ],
  prepositionPast: 'vor',
  prepositionFuture: 'in',
  atTheMoment: 'jetzt',
  formatOrderPast: [
    FormatComponent.preposition,
    FormatComponent.value,
    FormatComponent.unit
  ],
  formatOrderFuture: [
    FormatComponent.preposition,
    FormatComponent.value,
    FormatComponent.unit,
  ],
);
