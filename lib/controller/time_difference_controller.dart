import 'package:lit_relative_date_time/lit_relative_date_time.dart';

/// A LitRelativeDateTime `controller` class implementing checks performed on
/// [TimeDifference] model classes.
class TimeDifferenceController {
  /// The time difference.
  final TimeDifference timeDifference;

  /// Creates a [TimeDifferenceController].
  const TimeDifferenceController(this.timeDifference);

  /// States whether the difference unit is `second`.
  bool get isSmallestUnit {
    return timeDifference.unit == LitTimeUnit.second;
  }

  /// States whether the difference value is `0`.
  bool get isZero {
    return timeDifference.value.abs() == 0;
  }

  /// States whether the difference value is `1`.
  bool get isSingular {
    return timeDifference.value.abs() == 1;
  }
}
