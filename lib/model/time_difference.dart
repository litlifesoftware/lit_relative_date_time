import 'package:lit_relative_date_time/model/lit_time_unit.dart';

/// A model class to describe a relative date time based on the largest [TimeUnit]
/// available and its difference relative to another date.
///
/// The [value] can be negative e.g. meaning the date is in the past relative to
/// today.
class TimeDifference {
  /// The diffence to another date as an integer value.
  final int value;

  /// The time unit of the difference
  final LitTimeUnit unit;

  /// Creates a [TimeDifference].
  ///
  /// Pass the difference of you date relative to another date and its corresponding unit.
  ///
  /// * [value] describes an integer value. The value may be negative if e.g. the date is
  /// in the past.
  ///
  /// * [unit] is the time unit of the date.
  const TimeDifference({
    required this.value,
    required this.unit,
  });

  /// States whether the [TimeDifference]'unit contains the smallest value available (second).
  bool get isSmallestUnit {
    return unit == LitTimeUnit.second;
  }

  /// States wheter the [TimeDifference]'s value is zero. If so, the difference is invalid
  /// and cannot be used for measuring accurate relative dates.
  bool get isZero {
    return value == 0;
  }

  /// States whether to localized the corresponding [TimeDifference]'s time unit in singular form.
  bool get isSingular {
    return value == 1;
  }
}
