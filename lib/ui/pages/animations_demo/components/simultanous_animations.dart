import 'package:flutter/material.dart';

/// Consider the case where you want to animate in and out while the opacity animates from transparent to opaque.
///
/// Note::: This example shows how to use multiple tweens on the same animation controller,
/// where each tween manages a different effect in the animation.
/// It is for illustrative purposes only.
/// If you were tweening opacity and size in production code,
/// you’d probably use FadeTransition and SizeTransition instead.

class _AnimatedLogo extends AnimatedWidget {
  const _AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  /// Make the Tweens static because they can't change
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 50, end: 200);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
        child: Opacity(
            opacity: _opacityTween.evaluate(animation),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: _sizeTween.evaluate(animation),
              height: _sizeTween.evaluate(animation),
              child: const FlutterLogo(
                textColor: Colors.pinkAccent,
                style: FlutterLogoStyle.horizontal,
              ),
            )));
  }
}

class SimultaneousSizeAndOpacityAnimation extends StatefulWidget {
  const SimultaneousSizeAndOpacityAnimation({Key? key}) : super(key: key);

  @override
  State<SimultaneousSizeAndOpacityAnimation> createState() =>
      _SimultaneousSizeAndOpacityAnimationState();
}

class _SimultaneousSizeAndOpacityAnimationState
    extends State<SimultaneousSizeAndOpacityAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Simultaneous Opacity & Size Animation',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        _AnimatedLogo(animation: animation),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
