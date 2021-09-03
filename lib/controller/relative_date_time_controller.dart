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

  /// Calculates the difference in time and returns a [TimeDifference].
  TimeDifference calculateTimeDifference() {
    /// The difference of both date times. The difference may be negative.
    int differenceInMs = dateTime.difference(other).inMilliseconds;

    /// The difference of both date times. The value is always unsigned.
    int differenceInMsAbs = differenceInMs.abs();

    // If the closest time unit is second
    if ((differenceInMsAbs < MS_PER_MINUTE)) {
      return TimeDifference(
        value: (differenceInMs / MS_PER_SECOND).floor(),
        unit: LitTimeUnit.second,
      );
    }
    // If the closest time unit is minute
    if ((differenceInMsAbs < MS_PER_HOUR)) {
      return TimeDifference(
        value: (differenceInMs / MS_PER_MINUTE).floor(),
        unit: LitTimeUnit.minute,
      );
    }
    // If the closest time unit is hour
    if ((differenceInMsAbs < MS_PER_DAY)) {
      return TimeDifference(
        value: (differenceInMs / MS_PER_HOUR).floor(),
        unit: LitTimeUnit.hour,
      );
    }
    // If the closest time unit is day
    if ((differenceInMsAbs < MS_PER_YEAR)) {
      return TimeDifference(
        value: (differenceInMs / MS_PER_DAY).floor(),
        unit: LitTimeUnit.day,
      );
    }
    // Else the closest time unit is year
    return TimeDifference(
      value: (differenceInMs / MS_PER_YEAR).floor(),
      unit: LitTimeUnit.year,
    );
  }
}
