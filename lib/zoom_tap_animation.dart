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
  AnimationController? _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.endDuration, value: 1.0, reverseDuration: widget.beginDuration);
    _animation = Tween(begin: widget.end, end: widget.begin)
        .animate(CurvedAnimation(parent: _controller!, curve: widget.beginCurve, reverseCurve: widget.endCurve));
    _controller?.forward();
  }

  bool _isOnTap = false;
  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (c) async {
          _isOnTap = true;
          _controller?.reverse();
          await Future.delayed(const Duration(milliseconds: 150), () async {
            if (!_isOnTap) widget.onTap?.call();
          });
        },
        onPointerMove: (c) async {
          await Future.delayed(const Duration(milliseconds: 100), () {
            _isOnTap = true;
          });
        },
        onPointerUp: (c) async {
          _isOnTap = false;
          await _controller?.forward();
        },
        child: ScaleTransition(scale: _animation, child: widget.child));
  }

  @override
  void dispose() {
    _controller?.stop();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }
}
