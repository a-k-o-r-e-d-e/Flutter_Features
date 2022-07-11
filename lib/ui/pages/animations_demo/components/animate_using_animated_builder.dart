import 'package:flutter/material.dart';

/// What's the point?
/// An AnimatedBuilder understands how to render the transition.
/// An AnimatedBuilder doesn’t know how to render the widget, nor does it manage the Animation object.
/// Use AnimatedBuilder to describe an animation as part of a build method for another widget. If you simply want to define a widget with a reusable animation, use an AnimatedWidget, as shown in the Simplifying with AnimatedWidget section.
/// Examples of AnimatedBuilders in the Flutter API: BottomSheet, ExpansionTile, PopupMenu, ProgressIndicator, RefreshIndicator, Scaffold, SnackBar, TabBar, TextField.

/// One problem with the code in the [AnimatedLogoUsingAnimatedWidget] example, is that changing the animation required changing the widget that renders the logo. A better solution is to separate responsibilities into different classes:
///
///   - Render the logo
///   - Define the Animation object
///   - Render the transition
///
/// You can accomplish this separation with the help of the AnimatedBuilder class.
/// An AnimatedBuilder is a separate class in the render tree.
/// Like AnimatedWidget, AnimatedBuilder automatically listens to notifications from the Animation object, and marks the widget tree dirty as necessary, so you don’t need to call addListener()
class _LogoWidget extends StatelessWidget {
  const _LogoWidget({Key? key}) : super(key: key);

  // Leave out the height and width so it fills the animating parent
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const FlutterLogo(),
    );
  }
}

class _GrowTransition extends StatelessWidget {
  const _GrowTransition(
      {Key? key, required this.animation, required this.child})
      : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SizedBox(
          height: animation.value,
          width: animation.value,
          child: child,
        );
      },
      child: child,
    ));
  }
}

class AnimateLogoUsingAnimatedBuilder extends StatefulWidget {
  const AnimateLogoUsingAnimatedBuilder({Key? key}) : super(key: key);

  @override
  State<AnimateLogoUsingAnimatedBuilder> createState() =>
      _AnimateLogoUsingAnimatedBuilderState();
}

class _AnimateLogoUsingAnimatedBuilderState
    extends State<AnimateLogoUsingAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 50, end: 150).animate(controller)
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
          'Animated Using Animated Builder',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox.square(
            dimension: 150,
            child: _GrowTransition(
                animation: animation, child: const _LogoWidget())),
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
