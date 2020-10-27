import 'package:flutter/material.dart';
import 'package:flutterfeaturesapp/ui/Utils/drawer_util.dart';

class CircularPanWheel extends StatefulWidget {
  CircularPanWheel({Key key}) : super(key: key);

  @override
  _CircularPanWheelState createState() => _CircularPanWheelState();
}

class _CircularPanWheelState extends State<CircularPanWheel> {
  final double radius = 150;

  double _movement = 0;

  void _panHandler(DragUpdateDetails d) {
    /// Pan location on the wheel
    bool onTop = d.localPosition.dy <= radius;
    bool onLeftSide = d.localPosition.dx <= radius;
    bool onRightSide = !onLeftSide;
    bool onBottom = !onTop;

    /// Pan movements
    bool panUp = d.delta.dy <= 0.0;
    bool panLeft = d.delta.dx <= 0.0;
    bool panRight = !panLeft;
    bool panDown = !panUp;

    /// Absolute change on axis
    double yChange = d.delta.dy.abs();
    double xChange = d.delta.dx.abs();

    /// Directional change on wheel
    double vert = (onRightSide && panUp) || (onLeftSide && panDown)
        ? yChange * -1
        : yChange;

    double horz =
        (onTop && panLeft) || (onBottom && panRight) ? xChange * -1 : xChange;

    // Total computed change
    double rotationalChange = vert + horz;

    bool movingClockwise = rotationalChange > 0;
    bool movingCounterClockwise = rotationalChange < 0;

    setState(() {
      _movement = rotationalChange;
    });

    // Now do something interesting with these computations!
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white30,
      drawer: DrawerUtil(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _movement > 0 ? 'Clockwise' : 'Counter-Clockwise',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white),
            ),
            Text(
              '$_movement',
              style: TextStyle(color: Colors.white),
            ),
            GestureDetector(
                onPanUpdate: _panHandler,
                child: Container(
                  height: radius * 2,
                  width: radius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
