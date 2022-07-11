import 'package:flutter/material.dart';

///  What's the point?
///How to use the AnimatedWidget helper class
///(instead of addListener() and setState()) to create a widget that animates.
/// Use AnimatedWidget to create a widget that performs a reusable animation.
/// To separate the transition from the widget, use an AnimatedBuilder.
/// Examples of AnimatedWidgets in the Flutter API:
/// AnimatedBuilder, AnimatedModalBarrier, DecoratedBoxTransition,
/// FadeTransition, PositionedTransition, RelativePositionedTransition,
/// RotationTransition, ScaleTransition, SizeTransition, SlideTransition.
///
///
/// The AnimatedWidget base class allows you to separate out the core widget code from the animation code.
/// AnimatedWidget doesn’t need to maintain a State object to hold the animation.

class _AnimatedLogo extends AnimatedWidget {
  const _AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
        child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: animation.value,
      width: animation.value,
      child: const FlutterLogo(
        textColor: Colors.pink,
        style: FlutterLogoStyle.horizontal,
      ),
    ));
  }
}

class AnimatedLogoUsingAnimatedWidget extends StatefulWidget {
  const AnimatedLogoUsingAnimatedWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedLogoUsingAnimatedWidget> createState() =>
      _AnimatedLogoUsingAnimatedWidgetState();
}

class _AnimatedLogoUsingAnimatedWidgetState
    extends State<AnimatedLogoUsingAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 50, end: 200).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addStatusListener((status) => debugPrint('$status'));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Animate Using Animated Widget',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 100, child: _AnimatedLogo(animation: animation)),
        Divider()
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
