import 'package:lit_relative_date_time/models.dart';

/// `English` localization
const RelativeDateLocalization localizationsEN = RelativeDateLocalization(
  languageCode: 'en',
  timeUnitsSingular: ['second', 'minute', 'hour', 'day', 'year'],
  timeUnitsPlural: ['seconds', 'minutes', 'hours', 'days', 'years'],
  prepositionPast: 'ago',
  prepositionFuture: 'in',
  atTheMoment: 'now',
  formatOrderPast: [
    FormatComponent.value,
    FormatComponent.unit,
    FormatComponent.preposition
  ],
  formatOrderFuture: [
    FormatComponent.preposition,
    FormatComponent.value,
    FormatComponent.unit,
  ],
);
