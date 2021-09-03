import 'package:lit_relative_date_time/models.dart';

/// A `model` class describing a difference in time of two time stamps.
///
/// The [value] may be negative resulting in a past point in time.
class TimeDifference {
  /// The time unit's value.
  final int value;

  /// The time unit.
  final LitTimeUnit unit;

  /// Creates a [TimeDifference].
  ///
  const TimeDifference({
    required this.value,
    required this.unit,
  });

  /// States whether the [TimeDifference]'unit contains the smallest measurable
  /// value available ([LitTimeUnit.second]).
  bool get isSmallestUnit {
    return unit == LitTimeUnit.second;
  }

  /// States wheter the [TimeDifference]'s value is zero. If so, the difference
  /// is invalid and cannot be used for measuring accurate relative dates.
  bool get isZero {
    return value == 0;
  }

  /// States whether to localized the corresponding [TimeDifference]'s time unit
  /// in singular form.
  bool get isSingular {
    return value == 1;
  }
}
