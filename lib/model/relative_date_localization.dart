/// Model class to describe all data required for localizing the formatted
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
  ///
  /// * [prepositionPast] is the preposition to be displayed on relative dates in the past.
  /// The default English localization will be set to:
  /// ```dart
  /// prepositionPast: 'ago',
  /// ```
  ///
  /// * [prepositionFuture] is the preposition to be displayed on relative dates in the future.
  /// The default English localization will be set to:
  /// ```dart
  /// prepositionFuture: 'in',
  /// ```
  ///
  /// * [atTheMoment] is the localized string displayed if no difference in time can be measured.
  /// The default English localization will be set to:
  /// ```dart
  /// atTheMoment: 'now',
  /// ```
  ///
  /// * [formatOrderPast] describes the order in which the preposition, the value and the unit
  /// shall be displayed on the formatted string describing a date in the past.
  /// The default English localization will be set to:
  /// ```dart
  /// formatOrderPast: [
  ///    FormatComponent.value,
  ///    FormatComponent.unit,
  ///    FormatComponent.preposition
  /// ],
  /// ```
  ///
  /// * [formatOrderFuture] describes the order in which the preposition, the value and the unit
  /// shall be displayed on the formatted string describing a date in the future.
  /// The default English localization will be set to:
  /// ```dart
  /// formatOrderFuture: [
  ///    FormatComponent.preposition,
  ///    FormatComponent.value,
  ///    FormatComponent.unit,
  /// ],
  /// ```
  const RelativeDateLocalization({
    required this.languageCode,
    required this.timeUnitsSingular,
    required this.timeUnitsPlural,
    required this.prepositionPast,
    required this.prepositionFuture,
    required this.atTheMoment,
    required this.formatOrderPast,
    required this.formatOrderFuture,
  });
}

/// The sections of the formatted string
enum FormatComponent {
  // The preposition to indicate whether the date is in the past or the future.
  preposition,
  // The time value.
  value,
  // The time unit.
  unit,
}
