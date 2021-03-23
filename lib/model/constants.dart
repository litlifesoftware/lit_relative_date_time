import 'package:lit_relative_date_time/model/relative_date_localization.dart';

/// The miliseconds per second `1000`.
const double msPerSecond = 1000.0;

/// The milliseconds per minute `60000`.
const double msPerMinute = 60000.0;

/// The milliseconds per hour `3.6e+6`.
const double msPerHour = 3.6e+6;

/// The miliseconds per day `8.64e+7`.
const double msPerDay = 8.64e+7;

/// The miliseconds per month `2.628e+9`.
const double msPerMonth = 2.628e+9;

/// The miliseconds per year `3.154e+10`.
const double msPerYear = 3.154e+10;

/// English localization
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

/// German localization
const RelativeDateLocalization localizationsGER = RelativeDateLocalization(
  languageCode: 'de',
  timeUnitsSingular: ['Sekunde', 'Minute', 'Stunde', 'Tag', 'Jahr'],
  timeUnitsPlural: ['Sekunden', 'Minuten', 'Stunden', 'Tagen', 'Jahren'],
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

/// Russian localization
const RelativeDateLocalization localizationsRU = RelativeDateLocalization(
  languageCode: 'ru',
  timeUnitsSingular: ['секунду', 'минуту', 'час', 'день', 'год'],
  timeUnitsPlural: ['секунды', 'минуты', 'часа', 'дня', 'года'],
  prepositionPast: 'назад',
  prepositionFuture: 'через',
  atTheMoment: 'Сейчас же',
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

/// Default localizations for formatting.
const List<RelativeDateLocalization> formatLocalizations = [
  localizationsEN,
  localizationsGER,
  localizationsRU,
];
