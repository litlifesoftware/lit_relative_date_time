import 'package:flutter/material.dart';
import 'package:lit_relative_date_time/lit_relative_date_time.dart';
import 'package:lit_relative_date_time/widgets.dart';

/// A Flutter widget allowing to create a [RelativeDateTime] while providing
/// access to its corresponding localized `String` in human-readable format.
/// The [RelativeDateTime] is always relative to the current timestamp.
///
/// The child build using the`builder` will be animated and will therefore
/// will be rendered using the latest [RelativeDateTime] value.
class AnimatedRelativeDateTimeBuilder extends StatefulWidget {
  /// The [DateTime] the [RelativeDateTime] should be relative to.
  final DateTime date;

  final Widget Function(RelativeDateTime relativeDateTime, String formatted)
      builder;

  /// Creates a [AnimatedRelativeDateTimeBuilder].

  const AnimatedRelativeDateTimeBuilder({
    Key? key,
    required this.date,
    required this.builder,
  }) : super(key: key);

  @override
  _AnimatedRelativeDateTimeBuilderState createState() =>
      _AnimatedRelativeDateTimeBuilderState();
}

class _AnimatedRelativeDateTimeBuilderState
    extends State<AnimatedRelativeDateTimeBuilder>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  /// The animation's duration will be one second to sync the animation
  /// to the time ticker.
  final Duration _animationDuration = Duration(
    milliseconds: 1000,
  );

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return RelativeDateTimeBuilder.now(
          date: widget.date,
          builder: (relDate, formatted) {
            return widget.builder(relDate, formatted);
          },
        );
      },
    );
  }
}
