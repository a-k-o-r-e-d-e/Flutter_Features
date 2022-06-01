import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfeaturesapp/ui/Utils/drawer_util.dart';

import '../Utils/route_names.dart';
import 'dynamic_theming.dart';

class HomePage extends StatelessWidget {
  final themeData;

  HomePage(this.themeData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Features'),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to the PreferencePage
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DynamicThemingScreen(),
              ));
            },
          )
        ],
      ),
      drawer: DrawerUtil(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 8),
          children: [
            _GridTile(
                icon: Icons.camera,
                title: 'Dynamic Theming',
                navigateTo: RouteNames.dynamicThemingScreen),
            _GridTile(
                icon: Icons.arrow_forward_rounded,
                title: 'Swipe to Dismiss',
                navigateTo: RouteNames.swipeToDismissScreen),
            _GridTile(
                icon: Icons.keyboard_double_arrow_up_rounded,
                title: 'Bottom Sheets',
                navigateTo: RouteNames.bottomSheetsScreen),
            _GridTile(
                icon: Icons.table_chart,
                title: 'TabBar Layout',
                navigateTo: RouteNames.tabBarLayoutScreen),
            _GridTile(
                icon: Icons.network_check_rounded,
                title: 'Connectivity Test',
                navigateTo: RouteNames.connectivityTestScreen),
            _GridTile(
                icon: Icons.flip,
                title: 'PageView Demo',
                navigateTo: RouteNames.pageViewDemoScreen),
            _GridTile(
                icon: Icons.flip_camera_android_rounded,
                title: 'Circular Pan Wheel',
                navigateTo: RouteNames.circularPanWheelScreen),
          ],
        ),
      ),
    );
  }
}

class _GridTile extends StatelessWidget {
  const _GridTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.navigateTo})
      : super(key: key);

  final IconData icon;
  final String title;

  /// The Route Name of the screen to navigate to
  final String navigateTo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, navigateTo);
      },
      child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.primaries[
                        Random().nextInt(Colors.primaries.length - 1)],
                    Colors.accents[Random().nextInt(Colors.accents.length - 1)],
                  ]),
              color: Colors
                  .primaries[Random().nextInt(Colors.primaries.length - 1)]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: Colors.white),
              SizedBox(height: 8),
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white))
            ],
          )),
    );
  }
}
