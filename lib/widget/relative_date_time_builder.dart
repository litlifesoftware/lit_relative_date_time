import 'package:flutter/material.dart';
import 'package:lit_relative_date_time/controllers.dart';
import 'package:lit_relative_date_time/models.dart';

/// A Flutter widget allowing to create a [RelativeDateTime] while providing
/// access to its corresponding localized `String` in human-readable format.
class RelativeDateTimeBuilder extends StatefulWidget {
  final DateTime date;
  final DateTime other;
  final Widget Function(
    RelativeDateTime relativeDateTime,
    String formatted,
  ) builder;

  /// Creates a [RelativeDateTimeBuilder].
  const RelativeDateTimeBuilder({
    Key? key,
    required this.date,
    required this.other,
    required this.builder,
  }) : super(key: key);

  /// Creates a [RelativeDateTimeBuilder], whose provided [DateTime] will
  /// always be relative to the current timestamp.

  factory RelativeDateTimeBuilder.now({
    required Widget Function(
      RelativeDateTime relativeDateTime,
      String formatted,
    )
        builder,
    required DateTime date,
  }) {
    return RelativeDateTimeBuilder(
      builder: builder,
      date: DateTime.now(),
      other: date,
    );
  }

  @override
  _RelativeDateTimeBuilderState createState() =>
      _RelativeDateTimeBuilderState();
}

class _RelativeDateTimeBuilderState extends State<RelativeDateTimeBuilder> {
  RelativeDateTime get _relativeDateTime {
    return RelativeDateTime(
      dateTime: widget.date,
      other: widget.other,
    );
  }

  RelativeDateFormat get _relativeDateFormatter {
    return RelativeDateFormat(
      Localizations.localeOf(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return widget.builder(
          _relativeDateTime,
          _relativeDateFormatter.format(_relativeDateTime),
        );
      },
    );
  }
}
