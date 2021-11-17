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
    if (differenceMsAbs < MS_PER_MINUTE) {
      return TimeDifference(
        value: (differenceMs / MS_PER_SECOND).floor(),
        unit: LitTimeUnit.second,
      );
    }
    // If the closest time unit is minute
    if (differenceMsAbs < MS_PER_HOUR) {
      return TimeDifference(
        value: (differenceMs / MS_PER_MINUTE).floor(),
        unit: LitTimeUnit.minute,
      );
    }
    // If the closest time unit is hour
    if (differenceMsAbs < MS_PER_DAY) {
      return TimeDifference(
        value: (differenceMs / MS_PER_HOUR).floor(),
        unit: LitTimeUnit.hour,
      );
    }
    // If the closest time unit is day
    if (differenceMsAbs < MS_PER_WEEK) {
      final res = differenceMs / MS_PER_DAY;
      return TimeDifference(
        value: res.floor(),
        unit: LitTimeUnit.day,
      );
    }
    // If the closest time unit is week
    if (differenceMsAbs < MS_PER_MONTH) {
      return TimeDifference(
        value: (differenceMs / MS_PER_WEEK).floor(),
        unit: LitTimeUnit.week,
      );
    }
    // If the closest time unit is week
    if (differenceMsAbs < MS_PER_YEAR) {
      return TimeDifference(
        value: (differenceMs / MS_PER_MONTH).floor(),
        unit: LitTimeUnit.month,
      );
    }
    // Else the closest time unit is year
    return TimeDifference(
      value: (differenceMs / MS_PER_YEAR).floor(),
      unit: LitTimeUnit.year,
    );
  }
}
