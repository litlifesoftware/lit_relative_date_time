import 'package:lit_relative_date_time/lit_relative_date_time.dart';

/// A collection of time units available varying amounts of time Simplifies the localized
/// string value.
enum LitTimeUnit {
  /// A second contains [msPerSecond]ms.
  second,

  /// A minute contains [msPerMinute]ms.
  minute,

  /// An hour contains [msPerHour]ms.
  hour,

  /// An hour contains [msPerDay]ms.
  day,

  /// A month contains [msPerMonth]ms.
  month,

  /// A year contains [msPerDay]ms.
  year,
}
