import 'package:lit_relative_date_time/models.dart';

/// `Russian` localization
const RelativeDateLocalization localizationsRU = RelativeDateLocalization(
  languageCode: 'ru',
  timeUnitsSingular: ['секунду', 'минуту', 'час', 'день', 'год'],
  timeUnitsPlural: ['секунды', 'минуты', 'часа', 'дня', 'года'],
  prepositionPast: 'назад',
  prepositionFuture: 'через',
  atTheMoment: 'Сейчас',
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
