import 'package:lit_relative_date_time/lit_relative_date_time.dart';

class RelativeDateTimeController {
  final DateTime dateTime;
  final DateTime other;

  const RelativeDateTimeController(this.dateTime, this.other);

  TimeDifference calculateTimeDifference() {
    int differenceInMs = dateTime.difference(other).inMilliseconds;

    int differenceInMsAbs = differenceInMs.abs();
    //other.difference(dateTime).inMilliseconds;
    if ((differenceInMsAbs < msPerMinute)) {
      return TimeDifference(
        value: (differenceInMs / msPerSecond).floor(),
        unit: LitTimeUnit.second,
      );
    }
    if ((differenceInMsAbs < msPerHour)) {
      return TimeDifference(
        value: (differenceInMs / msPerMinute).floor(),
        unit: LitTimeUnit.minute,
      );
    }

    if ((differenceInMsAbs < msPerDay)) {
      return TimeDifference(
        value: (differenceInMs / msPerHour).floor(),
        unit: LitTimeUnit.hour,
      );
    }

    if ((differenceInMsAbs < msPerYear)) {
      return TimeDifference(
        value: (differenceInMs / msPerDay).floor(),
        unit: LitTimeUnit.day,
      );
    }

    return TimeDifference(
      value: (differenceInMs / msPerYear).floor(),
      unit: LitTimeUnit.year,
    );
  }
}
