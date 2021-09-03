import 'package:flutter/material.dart';
import 'package:lit_relative_date_time/lit_relative_date_time.dart';
import 'package:lit_relative_date_time/localizations.dart';

/// [RelativeDateFormat] localizes relative time stamps using the provided
/// [Locale].
///
/// Following languages are supported by default at the moment:
/// * `English`
/// * `German`
/// * `Russian`
///
/// If the provided [Locale] can not be applied to the supported localizations,
/// the default localization will be returned instead.
class RelativeDateFormat {
  /// The device [Locale] on which the localized string will be based on.
  final Locale locale;

  /// The localizations available for formatting.
  final List<RelativeDateLocalization> localizations;

  /// States whether to print `debug` output.
  final bool debug;

  /// Creates a [RelativeDateFormat].
  ///
  /// Provide a [Locale] for localizing a [RelativeDateTime].
  ///
  const RelativeDateFormat(
    this.locale, {
    this.localizations = LOC_ALL,
    this.debug = false,
  });

  /// Tries to return the desired localization or the default localization if
  /// not found.
  RelativeDateLocalization _getLocalization() {
    try {
      return localizations.firstWhere((RelativeDateLocalization localization) {
        return localization.languageCode == locale.languageCode;
      });
      // If the provided list does not contain the current locale's localization,
      // return the default localization.
    } catch (e) {
      if (debug) {
        print("Error: $e");
      }
      return LOC_DEFAULT;
    }
  }

  /// States whether the provided [RelativeDateTime] should have a singular
  /// time unit.
  bool _isSingular(RelativeDateTime relativeDateTime) {
    return relativeDateTime.timeDifference.isSingular;
  }

  /// Returns the absolute time value.
  String _getTimeValue(
    RelativeDateTime relativeDateTime,
    RelativeDateLocalization relativeDateLocalization,
  ) {
    return "${relativeDateTime.timeDifference.value.abs()}";
  }

  /// Returns the localized time unit based on the [Locale] value.
  String _getLocalizedTimeUnit(
    Locale locale,
    RelativeDateTime relativeDateTime,
    RelativeDateLocalization relativeDateLocalization,
  ) {
    List<String> _timeUnitsSingular =
        relativeDateLocalization.timeUnitsSingular;
    List<String> _timeUnitsPlural = relativeDateLocalization.timeUnitsPlural;

    /// Return the corresponding localized unit depending on its time value.
    switch (relativeDateTime.timeDifference.unit) {
      case LitTimeUnit.second:
        return _isSingular(relativeDateTime)
            ? _timeUnitsSingular[0]
            : _timeUnitsPlural[0];

      case LitTimeUnit.minute:
        return _isSingular(relativeDateTime)
            ? _timeUnitsSingular[1]
            : _timeUnitsPlural[1];

      case LitTimeUnit.hour:
        return _isSingular(relativeDateTime)
            ? _timeUnitsSingular[2]
            : _timeUnitsPlural[2];

      case LitTimeUnit.day:
        return _isSingular(relativeDateTime)
            ? _timeUnitsSingular[3]
            : _timeUnitsPlural[3];

      default:
        return _isSingular(relativeDateTime)
            ? _timeUnitsSingular[4]
            : _timeUnitsPlural[4];
    }
  }

  /// Returns a localized [String] formatting the [RelativeDateTime] in
  /// human-readable form.
  ///
  /// Providing a [RelativeDateTime] whose time unit is 'second' and its value
  /// is 3 might return **3 seconds ago** on English Locale.
  ///
  /// Following units can be display for formatting:
  /// * `Seconds`
  /// * `Minutes`
  /// * `Hours`
  /// * `Years`
  String format(RelativeDateTime relativeDateTime) {
    RelativeDateLocalization _localization = _getLocalization();

    String timeValue = _getTimeValue(
      relativeDateTime,
      _localization,
    );

    String timeUnit = _getLocalizedTimeUnit(
      locale,
      relativeDateTime,
      _localization,
    );

    // If the difference in time is less than one second, return the localized
    // string for 'at the moment/now' due to the dates being too close to each
    // other.
    if (relativeDateTime.isNow) {
      return "${_localization.atTheMoment}";
    } else {
      List<String> _words = [];
      // If the relative date time does describe a date in the past, return the
      // formatting for past dates.
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
            if (debug) {
              const String errorMessage =
                  "ERROR on formatting prepositionPast array." +
                      "+ " "Please check your localization configuration.";
              print("$PACKAGE_NAME: $errorMessage");
              _words.add(errorMessage);
            }
          }
        }
        // Else return the formatting for future dates.
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
          const String errorMessage =
              "Error on formatting prepositionFuture array." +
                  " " +
                  "Please check your localization configuration.";
          if (debug) {
            print("$PACKAGE_NAME: $errorMessage");
          }
          _words.add(errorMessage);
        }
      }
      // Try to return the compound words.
      try {
        return "${_words[0]} ${_words[1]} ${_words[2]}";
        // If it does fail, return an error message.
      } catch (e) {
        const String errorMessage =
            "Error on formatting date: Please check your localization config";
        if (debug) {
          print("$PACKAGE_NAME: $errorMessage");
        }
        return errorMessage;
      }
    }
  }
}
