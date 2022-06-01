import 'package:flutter/material.dart';

import '../widgets/double_ring_spin_kit.dart';
import '../widgets/multiple_ring_spin_kit.dart';

class CustomLoadingIndicatorsScreen extends StatelessWidget {
  const CustomLoadingIndicatorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SpinKitDualRing(
            color: Colors.purple, size: 100, lineWidth: 4, angle: 120),
        MultipleRingSpinKit(
            color: Colors.brown, size: 100, lineWidth: 4, angle: 120),
      ],
    ));
  }
}
