import 'package:flutter/material.dart';

///  What's the point?
///  How to add basic animation to a widget using addListener() and setState().
///  Every time the Animation generates a new number, the addListener() function calls setState().
///  How to define an AnimationController with the required vsync parameter.

class SimpleLogoAnimation extends StatefulWidget {
  const SimpleLogoAnimation({Key? key}) : super(key: key);

  @override
  State<SimpleLogoAnimation> createState() => _SimpleLogoAnimationState();
}

class _SimpleLogoAnimationState extends State<SimpleLogoAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() => setState(() {}));
    animation = Tween<double>(begin: 30, end: 150).animate(controller);

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Simple Basic Animation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox.square(
          dimension: 150,
          child: Center(
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: animation.value,
                  width: animation.value,
                  child: const FlutterLogo())),
        ),
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
