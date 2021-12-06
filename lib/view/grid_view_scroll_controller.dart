import 'package:flutter/cupertino.dart';

class GridViewScrollController extends ScrollController {
  GridViewScrollController({
    double initialScrollOffset = 0.0,
    keepScrollOffset = true,
    debugLabel,
  }) : super(
      initialScrollOffset: initialScrollOffset,
      keepScrollOffset: keepScrollOffset,
      debugLabel: debugLabel);

  @override
  _UnboundedScrollPosition createScrollPosition(
      ScrollPhysics physics,
      ScrollContext context,
      ScrollPosition? oldPosition,
      ) {
    return _UnboundedScrollPosition(
      physics: physics,
      context: context,
      oldPosition: oldPosition,
      initialPixels: initialScrollOffset,
    );
  }

  void jumpToWithoutGoingIdleAndKeepingBallistic(double value) {
    assert(positions.isNotEmpty, 'ScrollController not attached.');
    for (_UnboundedScrollPosition position in List.from(positions))
      position.jumpToWithoutGoingIdleAndKeepingBallistic(value);
  }
}

class _UnboundedScrollPosition extends ScrollPositionWithSingleContext {
  _UnboundedScrollPosition({
    required ScrollPhysics physics,
    required ScrollContext context,
    required ScrollPosition? oldPosition,
    required double initialPixels,
  }) : super(
    physics: physics,
    context: context,
    oldPosition: oldPosition,
    initialPixels: initialPixels,
  );

  /// There is a feedback-loop between aboveController and belowController. When one of them is
  /// being used, it controls the other. However if they get out of sync, for timing reasons,
  /// the controlled one with try to control the other, and the jump will stop the real controller.
  /// For this reason, we can't let one stop the other (idle and ballistics) in this situation.
  void jumpToWithoutGoingIdleAndKeepingBallistic(double value) {
    if (pixels != value) {
      forcePixels(value);
    }
  }
}