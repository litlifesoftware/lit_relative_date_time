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

  /// States whether to render using an `opacity` animation.
  final bool animateOpacity;

  /// The builder method returning the `child` widget.
  final Widget Function(RelativeDateTime relativeDateTime, String formatted)
      builder;

  /// Creates a [AnimatedRelativeDateTimeBuilder].

  const AnimatedRelativeDateTimeBuilder({
    Key? key,
    required this.date,
    this.animateOpacity = false,
    required this.builder,
  }) : super(key: key);

  @override
  _AnimatedRelativeDateTimeBuilderState createState() =>
      _AnimatedRelativeDateTimeBuilderState();
}

class _AnimatedRelativeDateTimeBuilderState
    extends State<AnimatedRelativeDateTimeBuilder>
    with TickerProviderStateMixin {
  late AnimationController _tickerAnimationController;

  /// The animation's duration will be one second to sync the animation
  /// to the time ticker.
  final Duration _tickerDuration = Duration(
    milliseconds: 1000,
  );

  /// Returns the animation opacity.
  ///
  /// Always returns `1` if no opacity animation is requested.
  double get _opacity {
    return widget.animateOpacity
        ? 0.35 + (_tickerAnimationController.value * 0.65)
        : 1.0;
  }

  @override
  void initState() {
    _tickerAnimationController = AnimationController(
      vsync: this,
      duration: _tickerDuration,
    );
    _tickerAnimationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _tickerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _tickerAnimationController,
      builder: (context, _) {
        return _AnimatedChild(
          animationController: _tickerAnimationController,
          builder: widget.builder,
          date: widget.date,
          opacity: _opacity,
        );
      },
      child: _AnimatedChild(
        animationController: _tickerAnimationController,
        builder: widget.builder,
        date: widget.date,
        opacity: _opacity,
      ),
    );
  }
}

/// The child widget renderend either with or without an animated opacity.
class _AnimatedChild extends StatelessWidget {
  final double opacity;
  final AnimationController animationController;
  final DateTime date;
  final Widget Function(RelativeDateTime, String) builder;

  const _AnimatedChild({
    Key? key,
    required this.opacity,
    required this.animationController,
    required this.date,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: animationController.duration!,
      child: RelativeDateTimeBuilder.now(
        date: date,
        builder: (relDate, formatted) {
          return builder(relDate, formatted);
        },
      ),
    );
  }
}
