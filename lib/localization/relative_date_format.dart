import 'package:flutter/cupertino.dart';
import 'package:lit_relative_date_time/lit_relative_date_time.dart';

/// Controller class to localize relative time stamps using the provided [Locale] and
/// [TimeDifference].
///
/// Following languages are supported at the moment:
/// * English
/// * German
/// * Russian
///
/// If the passed [Locale] can not be applied to the supported localized strings, the
/// English localization will be returned instead.
class RelativeDateFormat {
  /// The device [Locale] on which the localized string will be based on.
  final Locale locale;

  /// The relative date information.
  //final RelativeDateTime relativeDateTime;
  final List<RelativeDateLocalization> localizations;

  /// Creates a [RelativeDateFormat].
  ///
  /// Provide a [TimeDifference] and a [Locale] to return a localized description of the [TimeDifference]
  /// in human-readable form using the [format] property.
  const RelativeDateFormat(
    this.locale, {
    this.localizations = formatLocalizations,
  }
      //this.relativeDateTime,
      );

  RelativeDateLocalization _getLocalization() {
    try {
      return localizations
          .firstWhere((loc) => loc.languageCode == locale.languageCode);
    } catch (e) {
      print("Error: $e");
      return localizationsEN;
    }
  }

  /// States whether to localized the corresponding [TimeDifference]'s time unit in singular form.
  bool _isSingular(RelativeDateTime relativeDateTime) {
    return relativeDateTime.timeDifference.isSingular;
  }

  // String get _localizedPrepositionPast {
  //   return RelativeDateLocalizations
  //       .prepositionsPastLocalizations[locale.languageCode];
  // }

  // String _getLocalizedPrepositionPast(
  //   RelativeDateLocalization relativeDateLocalization,
  // ) {
  //   return
  //       // RelativeDateLocalizations
  //       //     .prepositionsPastLocalizations[locale.languageCode];
  //       relativeDateLocalization.prepositionPast;
  // }

  // String get _localizedPrepositionFuture {
  //   return RelativeDateLocalizations
  //       .prepositionsFutureLocalization[locale.languageCode];
  // }
  // String _getLocalizedPrepositionFuture(
  //   RelativeDateLocalization relativeDateLocalization,
  // ) {
  //   return relativeDateLocalization.prepositionFuture;
  // }

  // String get _localizedNow {
  //   return RelativeDateLocalizations.nowLocalizations[locale.languageCode];
  // }

  // String _getLocalizedNow(
  //   RelativeDateLocalization relativeDateLocalization,
  // ) {
  //   return relativeDateLocalization.atTheMoment;
  // }

  // String _getLocalizedTimeValue(
  //     Locale locale, RelativeDateTime relativeDateTime) {
  //   String _localizedSingularValue = RelativeDateLocalizations
  //       .localizedTimeValueSingular[locale.languageCode];
  //   return _isSingular(relativeDateTime)
  //       ? _localizedSingularValue
  //       : "${relativeDateTime.timeDifference.value.abs()}";
  // }

  String _getLocalizedTimeValue(
    Locale locale,
    RelativeDateTime relativeDateTime,
    RelativeDateLocalization relativeDateLocalization,
  ) {
    // String _localizedSingularValue = RelativeDateLocalizations
    //     .localizedTimeValueSingular[locale.languageCode];
    // String _singularValue = relativeDateLocalization.timeValueSingular;
    // return _isSingular(relativeDateTime) && displaySingularValueAsWord
    //     ? _singularValue
    //     : "${relativeDateTime.timeDifference.value.abs()}";
    return "${relativeDateTime.timeDifference.value.abs()}";
  }

  /// Returns the localized time unit based on the [Locale] parameter value.
  String _getLocalizedTimeUnit(
    Locale locale,
    RelativeDateTime relativeDateTime,
    RelativeDateLocalization relativeDateLocalization,
  ) {
    // List<String> _timeUnitsSingular = RelativeDateLocalizations
    //     .timeUnitsSingularLocalizations[locale.languageCode];
    List<String> _timeUnitsSingular =
        relativeDateLocalization.timeUnitsSingular;
    // List<String> _timeUnitsPlural = RelativeDateLocalizations
    //     .timeUnitsPluralLocalization[locale.languageCode];
    List<String> _timeUnitsPlural = relativeDateLocalization.timeUnitsPlural;

    switch (relativeDateTime.timeDifference.unit) {
      case LitTimeUnit.second:
        return _isSingular(relativeDateTime)
            ? _timeUnitsSingular[0]
            : _timeUnitsPlural[0];

        break;
      case LitTimeUnit.minute:
        return _isSingular(relativeDateTime)
            ? _timeUnitsSingular[1]
            : _timeUnitsPlural[1];

        break;
      case LitTimeUnit.hour:
        return _isSingular(relativeDateTime)
            ? _timeUnitsSingular[2]
            : _timeUnitsPlural[2];

        break;
      case LitTimeUnit.day:
        return _isSingular(relativeDateTime)
            ? _timeUnitsSingular[3]
            : _timeUnitsPlural[3];

        break;
      default:
        return _isSingular(relativeDateTime)
            ? _timeUnitsSingular[4]
            : _timeUnitsPlural[4];

        break;
    }
  }

  /// Returns a localized [String] describing the [TimeDifference] in human-readable
  /// form.
  ///
  /// Providing a [TimeDifference] whose time unit is 'second' and its value is 3 might
  /// return **3 seconds ago** on default.
  ///
  /// Following units can be display for the decription
  /// * Seconds
  /// * Minutes
  /// * Hours
  /// * Years
  String format(RelativeDateTime relativeDateTime) {
    RelativeDateLocalization _localization = _getLocalization();
    //String timeValue = _getLocalizedTimeValue(locale, relativeDateTime);
    String timeValue = _getLocalizedTimeValue(
      locale,
      relativeDateTime,
      _localization,
    );
    String timeUnit = _getLocalizedTimeUnit(
      locale,
      relativeDateTime,
      _localization,
    );

    // String _localizedPrepositionPast =
    //     _getLocalizedPrepositionPast(_localization);
    // String _localizedPrepositionFuture =
    //     _getLocalizedPrepositionFuture(_localization);
    //print(locale);
    //String _localizedNow = _getLocalizedNow(_localization);

    if (relativeDateTime.isNow) {
      return "${_localization.atTheMoment}";
    } else {
      List<String> _words = List<String>();
      // // German localization
      // if (locale.languageCode == 'de') {
      //   if (relativeDateTime.isPast) {
      //     return "$_localizedPrepositionPast $timeValue $timeUnit";
      //   } else {
      //     return "$_localizedPrepositionFuture $timeValue $timeUnit";
      //   }
      // }

      // // Russian localization
      // if (locale.languageCode == 'ru') {
      //   if (relativeDateTime.isPast) {
      //     return "$timeValue $timeUnit $_localizedPrepositionPast";
      //   } else {
      //     return "$_localizedPrepositionFuture $timeValue $timeUnit";
      //   }
      // }

      // // Returns the default localization (EN/US)
      // if (relativeDateTime.isPast) {
      //   return "$timeValue $timeUnit $_localizedPrepositionPast";
      // } else {
      //   return "$_localizedPrepositionFuture $timeValue $timeUnit";
      // }
      if (relativeDateTime.isPast) {
        for (int i = 0; i < _localization.formatOrderPast.length; i++) {
          try {
            if (_localization.formatOrderPast[i] ==
                FormatComponent.preposition) {
              _words.add(_localization.prepositionPast);
            }
            if (_localization.formatOrderPast[i] == FormatComponent.value) {
              _words.add(timeValue);
            }
            if (_localization.formatOrderPast[i] == FormatComponent.unit) {
              _words.add(timeUnit);
            }
          } catch (e) {
            print(
                "LitRelativeDateTime: Error on formatting prepositionPast array. Please check your localization configuration.");
          }
        }
      } else {
        try {
          for (int i = 0; i < _localization.formatOrderFuture.length; i++) {
            if (_localization.formatOrderFuture[i] ==
                FormatComponent.preposition) {
              _words.add(_localization.prepositionPast);
            }
            if (_localization.formatOrderFuture[i] == FormatComponent.value) {
              _words.add(timeValue);
            }
            if (_localization.formatOrderFuture[i] == FormatComponent.unit) {
              _words.add(timeUnit);
            }
          }
        } catch (e) {
          print(
              "LitRelativeDateTime: Error on formatting prepositionFuture array. Please check your localization configuration.");
        }
      }
      try {
        return "${_words[0]} ${_words[1]} ${_words[2]}";
      } catch (e) {
        print(
            "LitRelativeDate: Error on formatting date: Please check your localization config");
        return "ERROR";
      }
    }
  }
}
