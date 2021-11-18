import 'package:lit_relative_date_time/data.dart';
import 'package:lit_relative_date_time/models.dart';

/// A `controller` class to calculate custom differences in time of two
/// provided [DateTime] objects.
///
class RelativeDateTimeController {
  final DateTime dateTime;
  final DateTime other;

  /// Creates a [RelativeDateTimeController].
  ///
  /// [dateTime] and [other] are the dates times that are set relative to each
  /// other.
  const RelativeDateTimeController(this.dateTime, this.other);

  /// Returns the difference of both date times as a [Duration].
  ///
  /// The [dateTime] will always be used as base, when subtracting [other] from
  /// [dateTime].
  Duration get differenceInDuration {
    return dateTime.difference(other);
  }

  /// The difference of both date times in `miliseconds`.
  ///
  /// The value may be negative.
  int get differenceMs => differenceInDuration.inMilliseconds;

  /// The absolute difference of both date times in `miliseconds`.
  int get differenceMsAbs => differenceMs.abs();

  /// Calculates the [TimeDifference]'s value based on the [LitTimeUnit]
  /// provided.
  int _calcTimeDiffValue(LitTimeUnit unit) {
    int diff = differenceMs;
    switch (unit) {
      case LitTimeUnit.second:
        return (diff / MS_PER_SECOND).round();
      case LitTimeUnit.minute:
        return (diff / MS_PER_MINUTE).round();
      case LitTimeUnit.hour:
        return (diff / MS_PER_HOUR).round();
      case LitTimeUnit.day:
        return (diff / MS_PER_DAY).round();
      case LitTimeUnit.week:
        return (diff / MS_PER_WEEK).round();
      case LitTimeUnit.month:
        return (diff / MS_PER_MONTH).round();
      case LitTimeUnit.year:
        return (diff / MS_PER_YEAR).round();
      default:
        throw Exception(
          "'LitRelativeDateTime'" +
              " " +
              "Calculation for this 'LitTimeUnit' has not been implemented.",
        );
    }
  }

  /// Returns whether the difference is not measurable (`now`).
  bool get isNow => timeDifference.isZero && timeDifference.isSmallestUnit;

  /// Returns whether the other date time is before the provided date time.
  bool get isPast => timeDifference.value > 0;

  /// Returns whether the difference can be converted into the time unit
  /// `second`.
  bool get validUnitSecond =>
      differenceMsAbs < MS_PER_MINUTE &&
      (differenceMsAbs / MS_PER_SECOND).abs().round() != SEC_PER_MIN;

  /// Returns whether the difference can be converted into the time unit
  /// `minute`.
  bool get validUnitMinute =>
      differenceMsAbs < MS_PER_HOUR &&
      (differenceMsAbs / MS_PER_MINUTE).abs().round() != MIN_PER_HR;

  /// Returns whether the difference can be converted into the time unit
  /// `hour`.
  bool get validUnitHour =>
      differenceMsAbs < MS_PER_DAY &&
      (differenceMsAbs / MS_PER_HOUR).abs().round() != HR_PER_DAY;

  /// Returns whether the difference can be converted into the time unit
  /// `day`.
  bool get validUnitDay =>
      differenceMsAbs < MS_PER_WEEK &&
      (differenceMsAbs / MS_PER_DAY).abs().round() != DAYS_PER_WK;

  /// Returns whether the difference can be converted into the time unit
  /// `week`.
  bool get validUnitWeek =>
      differenceMsAbs < MS_PER_MONTH &&
      (differenceMsAbs / MS_PER_WEEK).abs().round() != WKS_PER_MNTH;

  /// Returns whether the difference can be converted into the time unit
  /// `year`.
  bool get validUnitMonth =>
      differenceMsAbs < MS_PER_YEAR &&
      (differenceMsAbs / MS_PER_MONTH).abs().round() != MNTHS_PER_YR;

  /// Calculates the difference in time by converting it into a valid time unit
  /// and returns a [TimeDifference].
  TimeDifference get timeDifference {
    // If the closest time unit is second
    if (validUnitSecond) {
      final unit = LitTimeUnit.second;

      return TimeDifference(
        value: _calcTimeDiffValue(unit),
        unit: unit,
      );
    }
    // If the closest time unit is minute
    if (validUnitMinute) {
      final unit = LitTimeUnit.minute;

      return TimeDifference(
        value: _calcTimeDiffValue(unit),
        unit: unit,
      );
    }
    // If the closest time unit is hour
    if (validUnitHour) {
      final unit = LitTimeUnit.hour;

      return TimeDifference(
        value: _calcTimeDiffValue(unit),
        unit: unit,
      );
    }
    // If the closest time unit is day
    if (validUnitDay) {
      final unit = LitTimeUnit.day;

      return TimeDifference(
        value: _calcTimeDiffValue(unit),
        unit: unit,
      );
    }
    // If the closest time unit is week
    if (validUnitWeek) {
      final unit = LitTimeUnit.week;

      return TimeDifference(
        value: _calcTimeDiffValue(unit),
        unit: unit,
      );
    }
    // If the closest time unit is month
    if (validUnitMonth) {
      final unit = LitTimeUnit.month;

      return TimeDifference(
        value: _calcTimeDiffValue(unit),
        unit: unit,
      );
    }

    // Else the closest time unit is year
    final unit = LitTimeUnit.year;

    return TimeDifference(
      value: _calcTimeDiffValue(unit),
      unit: unit,
    );
  }
}
