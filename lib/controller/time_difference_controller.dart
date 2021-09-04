import 'package:lit_relative_date_time/lit_relative_date_time.dart';

class TimeDifferenceController {
  final TimeDifference timeDifference;

  const TimeDifferenceController(this.timeDifference);

  /// States whether the difference unit is `second`.

  bool get isSmallestUnit {
    return timeDifference.unit == LitTimeUnit.second;
  }

  /// States whether the difference value is `0`.

  bool get isZero {
    return timeDifference.value == 0;
  }

  /// States whether the difference value is `1`.

  bool get isSingular {
    return timeDifference.value == 1;
  }
}
