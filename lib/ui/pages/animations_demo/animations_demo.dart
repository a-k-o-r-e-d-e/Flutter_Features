import 'package:flutter/material.dart';
import 'package:flutterfeaturesapp/ui/pages/animations_demo/components/rendering_simple_animations.dart';

import 'components/animate_using_animated_builder.dart';
import 'components/animate_using_animated_widget.dart';
import 'components/simultanous_animations.dart';

class AnimationsDemoScreen extends StatelessWidget {
  const AnimationsDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              SimpleLogoAnimation(),
              AnimatedLogoUsingAnimatedWidget(),
              // TextAni(),
              AnimateLogoUsingAnimatedBuilder(),
              SimultaneousSizeAndOpacityAnimation()
            ],
          ),
        ),
      ),
    );
  }
}
