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
  int get differenceMs {
    return differenceInDuration.inMilliseconds;
  }

  /// The absolute difference of both date times in `miliseconds`.
  int get differenceMsAbs {
    return differenceMs.abs();
  }

  /// Calculates the difference in time and returns a [TimeDifference].
  TimeDifference calculateTimeDifference() {
    // If the closest time unit is second
    if (differenceMsAbs < MS_PER_MINUTE &&
        (differenceMsAbs / MS_PER_SECOND).abs().round() != SEC_PER_MIN) {
      return TimeDifference(
        value: (differenceMs / MS_PER_SECOND).round(),
        unit: LitTimeUnit.second,
      );
    }
    // If the closest time unit is minute
    if (differenceMsAbs < MS_PER_HOUR &&
        (differenceMsAbs / MS_PER_MINUTE).abs().round() != MIN_PER_HR) {
      return TimeDifference(
        value: (differenceMs / MS_PER_MINUTE).round(),
        unit: LitTimeUnit.minute,
      );
    }
    // If the closest time unit is hour
    if (differenceMsAbs < MS_PER_DAY &&
        (differenceMsAbs / MS_PER_HOUR).abs().round() != HR_PER_DAY) {
      return TimeDifference(
        value: (differenceMs / MS_PER_HOUR).round(),
        unit: LitTimeUnit.hour,
      );
    }
    // If the closest time unit is day
    if (differenceMsAbs < MS_PER_WEEK &&
        (differenceMsAbs / MS_PER_DAY).abs().round() != DAYS_PER_WK) {
      final res = differenceMs / MS_PER_DAY;
      return TimeDifference(
        value: (differenceMs / MS_PER_DAY).round(),
        unit: LitTimeUnit.day,
      );
    }
    // If the closest time unit is week
    if (differenceMsAbs < MS_PER_MONTH &&
        (differenceMsAbs / MS_PER_WEEK).abs().round() != WKS_PER_MNTH) {
      return TimeDifference(
        value: (differenceMs / MS_PER_WEEK).round(),
        unit: LitTimeUnit.week,
      );
    }
    // If the closest time unit is month
    if (differenceMsAbs < MS_PER_YEAR &&
        (differenceMsAbs / MS_PER_MONTH).abs().round() != MNTHS_PER_YR) {
      return TimeDifference(
        value: (differenceMs / MS_PER_MONTH).round(),
        unit: LitTimeUnit.month,
      );
    }
    // Else the closest time unit is year
    return TimeDifference(
      value: (differenceMs / MS_PER_YEAR).round(),
      unit: LitTimeUnit.year,
    );
  }
}
