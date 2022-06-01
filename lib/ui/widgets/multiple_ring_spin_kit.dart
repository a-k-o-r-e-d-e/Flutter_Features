import 'dart:math' as math;

import 'package:flutter/material.dart';

class MultipleRingSpinKit extends StatefulWidget {
  const MultipleRingSpinKit({
    Key? key,
    required this.color,
    this.lineWidth = 7.0,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 3000),
    this.controller,
    this.angle = 60,
  }) : super(key: key);

  final Color color;
  final double lineWidth;
  final double size;
  final Duration duration;
  final AnimationController? controller;
  final double angle;

  @override
  _MultipleRingSpinKitState createState() => _MultipleRingSpinKitState();
}

class _MultipleRingSpinKitState extends State<MultipleRingSpinKit>
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
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear
            // const Interval(0.0, 1.0, curve: Curves.linear)
            ));
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Animation Value:: ${(_animation.value * 10).floor() % 4}");
    return Center(
      child: Transform(
        transform: Matrix4.identity()
          ..rotateZ((_animation.value) * math.pi * 2),
        alignment: FractionalOffset.center,
        child: CustomPaint(
          child: SizedBox.fromSize(size: Size.square(widget.size)),
          willChange: true,
          painter: _MultiRingPainter(
              angle: widget.angle,
              paintWidth: widget.lineWidth,
              color: widget.color,
              numOfRings: (_animation.value * 10).floor() % 5 > 1 ? 2 : 5),
        ),
      ),
    );
  }
}

class _MultiRingPainter extends CustomPainter {
  _MultiRingPainter(
      {required this.angle,
      required double paintWidth,
      required Color color,
      this.numOfRings = 5})
      : ringPaint = Paint()
          ..color = color
          ..strokeWidth = paintWidth
          ..style = PaintingStyle.stroke;

  final Paint ringPaint;
  final double angle;
  final int numOfRings;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    double startAngle = 0.0;
    double sweepAngle = (360 / (numOfRings * 2)).floorToDouble();
    for (int i = 1; i <= numOfRings; i++) {
      canvas.drawArc(
          rect, getRadian(startAngle), getRadian(sweepAngle), false, ringPaint);
      startAngle += sweepAngle * 2;
    }
    // canvas.drawArc(rect, 0.0, getRadian(angle), false, ringPaint);
    // canvas.drawArc(rect, getRadian(180.0), getRadian(angle), false, ringPaint);
    // canvas.drawArc(rect, getRadian(120), getRadian(angle), false, ringPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double getRadian(double angle) => math.pi / 180 * angle;
}
