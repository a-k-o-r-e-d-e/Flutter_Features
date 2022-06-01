import 'package:flutter/material.dart';

class RadialScaleLoadingIndicator extends StatefulWidget {
  const RadialScaleLoadingIndicator(
      {Key? key,
      this.size = 200.0,
      this.duration = const Duration(seconds: 4),
      this.controller,
      required this.scaleImageUrl})
      : super(key: key);

  final double size;
  final String scaleImageUrl;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<RadialScaleLoadingIndicator> createState() =>
      _RadialScaleLoadingIndicatorState();
}

class _RadialScaleLoadingIndicatorState
    extends State<RadialScaleLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() => setState(() {}))
      ..repeat();
    _animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  static const _TWO_PI = 3.14 * 2;

  @override
  Widget build(BuildContext context) {
    //       // percentage to show in Center Text
    int percentage = (_animation.value * 100).ceil();
    return Container(
        width: widget.size,
        height: widget.size,
        child: Stack(
          children: [
            ShaderMask(
                shaderCallback: (rect) {
                  return SweepGradient(
                          startAngle: 0.0,
                          endAngle: _TWO_PI,
                          stops: [_animation.value, _animation.value],
                          center: Alignment.center,
                          colors: [Colors.blue, Colors.transparent])
                      .createShader(rect);
                },
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: Image.asset(
                        widget.scaleImageUrl,
                        fit: BoxFit.fill,
                      ).image)),
                )),
            Center(
                child: Container(
              width: widget.size - 40,
              height: widget.size - 40,
              decoration: BoxDecoration(
                  color: Colors.transparent, shape: BoxShape.circle),
              child: Center(
                  child: Text(
                '$percentage',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              )),
            ))
          ],
        ));
    // return TweenAnimationBuilder(
    //     tween: Tween(begin: 0.0, end: 1.0),
    //     duration: Duration(seconds: 4),
    //     builder: (context, double value, child) {
    //       // percentage to show in Center Text
    //       int percentage = (value * 100).ceil();
    //       return Container(
    //           width: widget.size,
    //           height: widget.size,
    //           child: Stack(
    //             children: [
    //               ShaderMask(
    //                   shaderCallback: (rect) {
    //                     return SweepGradient(
    //                             startAngle: 0.0,
    //                             endAngle: _TWO_PI,
    //                             stops: [value, value],
    //                             center: Alignment.center,
    //                             colors: [Colors.blue, Colors.transparent])
    //                         .createShader(rect);
    //                   },
    //                   child: Container(
    //                     width: widget.size,
    //                     height: widget.size,
    //                     decoration: BoxDecoration(
    //                         shape: BoxShape.circle,
    //                         image: DecorationImage(
    //                             image: Image.asset(
    //                                     'assets/images/radial_scale.png')
    //                                 .image)),
    //                   )),
    //               Center(
    //                   child: Container(
    //                 width: widget.size - 40,
    //                 height: widget.size - 40,
    //                 decoration: BoxDecoration(
    //                     color: Colors.white, shape: BoxShape.circle),
    //                 child: Center(
    //                     child: Text(
    //                   '$percentage',
    //                   style: TextStyle(
    //                       fontSize: 25,
    //                       color: Colors.blue,
    //                       fontWeight: FontWeight.bold),
    //                 )),
    //               ))
    //             ],
    //           ));
    //     });
  }
}
