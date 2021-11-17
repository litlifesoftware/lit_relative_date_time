import 'package:lit_relative_date_time/models.dart';

/// `English` localization
const RelativeDateLocalization LOC_EN = RelativeDateLocalization(
  languageCode: 'en',
  timeUnitsSingular: [
    'second',
    'minute',
    'hour',
    'day',
    'week',
    'month',
    'year',
  ],
  timeUnitsPlural: [
    'seconds',
    'minutes',
    'hours',
    'days',
    'weeks',
    'months',
    'years',
  ],
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
