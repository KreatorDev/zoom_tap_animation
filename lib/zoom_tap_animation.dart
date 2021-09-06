library zoom_tap_animation;

import 'dart:async';
import 'package:flutter/widgets.dart';

class ZoomTapAnimation extends StatefulWidget {
  final Widget child;
  final double begin, end;
  final Duration beginDuration, endDuration;
  final Function()? onTap;
  final Curve beginCurve, endCurve;
  const ZoomTapAnimation(
      {Key? key,
      required this.child,
      this.onTap,
      this.begin = 1.0,
      this.end = 0.93,
      this.beginDuration = const Duration(milliseconds: 20),
      this.endDuration = const Duration(milliseconds: 120),
      this.beginCurve = Curves.decelerate,
      this.endCurve = Curves.fastOutSlowIn})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _ZoomTapAnimationState();
}

class _ZoomTapAnimationState extends State<ZoomTapAnimation> with SingleTickerProviderStateMixin<ZoomTapAnimation> {
  // make AnimationController nullable to make sure to not use it if it's null
  AnimationController? _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // initial AnimationController
    _controller = AnimationController(vsync: this, duration: widget.endDuration, value: 1.0, reverseDuration: widget.beginDuration);
    // initial tween animation
    _animation = Tween(begin: widget.end, end: widget.begin)
        .animate(CurvedAnimation(parent: _controller!, curve: widget.beginCurve, reverseCurve: widget.endCurve));
    // animate the Tween animation from the begin point to the end point
    _controller?.forward();
  }

  bool _isOnTap = false;
  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (c) async {
          // prevent the onTap event from beign triggered
          _isOnTap = true;
          // animate the Tween animation from the end point to the start point
          _controller?.reverse();
          await Future.delayed(const Duration(milliseconds: 150), () async {
            // trigger the onTap event if the user has taped the widget for less than 150 milliseconds
            if (!_isOnTap) widget.onTap?.call();
          });
        },
        onPointerMove: (c) async {
          await Future.delayed(const Duration(milliseconds: 100), () {
            // prevent the onTap event from beign triggered if the user drags the widget
            _isOnTap = true;
          });
        },
        onPointerUp: (c) async {
          // prevent the onTap event from beign triggered if the user has taped the widget for more than than 150 milliseconds
          _isOnTap = false;
          // animate the Tween animation from the begin point to the end point
          await _controller?.forward();
        },
        child: ScaleTransition(scale: _animation, child: widget.child));
  }

  @override
  void dispose() {
    // stop the running animation in the state
    _controller?.stop();
    _controller?.dispose();
    // assign AnimationController to null to make sure it's won't be used
    _controller = null;
    super.dispose();
  }
}
