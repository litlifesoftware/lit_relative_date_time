import 'package:flutter/foundation.dart';
import 'package:lit_relative_date_time/lit_relative_date_time.dart';

/// Model class to describe all required data required for localizing the formatted
/// [RelativeDateTime].
class RelativeDateLocalization {
  final String languageCode;
  final List<String> timeUnitsSingular;
  final List<String> timeUnitsPlural;
  final String prepositionPast;
  final String prepositionFuture;
  final String atTheMoment;
  final List<FormatComponent> formatOrderPast;
  final List<FormatComponent> formatOrderFuture;

  /// Creates a [RelativeDateLocalization].
  ///
  /// * [languageCode] is the language code of the current locale. The English localization
  /// will be set to:
  /// ```dart
  /// languageCode: 'en'
  /// ```
  ///
  /// * [timeUnitsSingular] are the localized time units (singular form). The default English
  /// localization will be set to:
  /// ```dart
  /// timeUnitsSingular: ['second', 'minute', 'hour', 'day', 'year'],
  /// ```
  ///
  /// * [timeUnitsPlural] are the localized time units (plural form). The default English
  /// localization  will be set to:
  /// ```dart
  /// timeUnitsPlural: ['seconds', 'minutes', 'hours', 'days', 'years'],
  /// ```
  const RelativeDateLocalization({
    @required this.languageCode,
    @required this.timeUnitsSingular,
    @required this.timeUnitsPlural,
    @required this.prepositionPast,
    @required this.prepositionFuture,
    @required this.atTheMoment,
    @required this.formatOrderPast,
    @required this.formatOrderFuture,
  });
}

enum FormatComponent {
  preposition,
  value,
  unit,
}
