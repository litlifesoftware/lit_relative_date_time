import 'package:lit_relative_date_time/models.dart';
import 'package:lit_relative_date_time/controllers.dart';

/// A `model` class describing a [TimeDifference] based on two comparable
/// [DateTime] objects.
///
/// If the calculated [TimeDifference]'s value is negative, the compared
/// [DateTime] is in the future.
class RelativeDateTime {
  final DateTime dateTime;
  final DateTime other;

  /// Creates a [RelativeDateTime].
  ///
  RelativeDateTime({
    required this.dateTime,
    required this.other,
  });

  /// Returns the calculated [TimeDifference].
  TimeDifference get timeDifference {
    final controller = RelativeDateTimeController(dateTime, other);
    return controller.calculateTimeDifference();
  }

  /// States whether the dates are approximating each other to much to measure
  /// a valid [TimeDifference].
  bool get isNow {
    return timeDifference.isZero && timeDifference.isSmallestUnit;
  }

  /// States whether the [other] date time is in the past.
  bool get isPast {
    return timeDifference.value > 0;
  }
}
