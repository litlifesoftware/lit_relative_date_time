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

  /// Returns a [RelativeDateTimeController] based on this relative date time.
  RelativeDateTimeController get _controller =>
      RelativeDateTimeController(this);

  /// Returns the calculated [TimeDifference].
  TimeDifference get timeDifference => _controller.timeDifference;

  /// Returns the calculated difference in time as a [Duration].
  Duration get differenceInDuration => _controller.differenceInDuration;

  /// States whether the difference is immeasurable (no difference).
  bool get isNow => _controller.isNow;

  /// States whether the [other] date time is in the past.
  bool get isPast => _controller.isPast;
}
