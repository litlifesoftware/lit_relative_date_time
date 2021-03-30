import 'package:lit_relative_date_time/lit_relative_date_time.dart';
import 'package:lit_relative_date_time/controller/relative_date_time_controller.dart';

/// Controller class to calculate a [TimeDifference] based on two comparable [DateTime] objects.
///
/// If the calculated [TimeDifference]'s value is negative, the compared [DateTime] is in the
/// future.
class RelativeDateTime {
  final DateTime dateTime;
  final DateTime other;

  /// Creates a [RelativeDateTime].
  ///
  /// Ensure to provide two comparable [DateTime] objects.
  RelativeDateTime({
    required this.dateTime,
    required this.other,
  });

  /// Returns the calculated [TimeDifference].
  TimeDifference get timeDifference {
    RelativeDateTimeController controller =
        RelativeDateTimeController(dateTime, other);
    return controller.calculateTimeDifference();
  }

  /// States whether the dates are approximating each other to much to measure a valid [TimeDifference].
  bool get isNow {
    return timeDifference.isZero && timeDifference.isSmallestUnit;
  }

  /// States whether the [other] date time is in the past.
  bool get isPast {
    return timeDifference.value > 0;
  }
}
