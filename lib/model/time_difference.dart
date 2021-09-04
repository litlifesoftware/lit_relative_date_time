import 'package:lit_relative_date_time/controllers.dart';
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

  /// States whether the difference unit is `second`.
  bool get isSmallestUnit {
    final controller = TimeDifferenceController(this);
    return controller.isSmallestUnit;
  }

  /// States whether the difference value is `0`.
  bool get isZero {
    final controller = TimeDifferenceController(this);
    return controller.isZero;
  }

  /// States whether the difference value is `1`.
  bool get isSingular {
    final controller = TimeDifferenceController(this);
    return controller.isSingular;
  }
}
