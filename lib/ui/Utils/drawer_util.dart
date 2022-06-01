import 'package:flutter/material.dart';
import 'package:flutterfeaturesapp/ui/Utils/route_names.dart';

class DrawerUtil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Lone Wolf"),
            accountEmail: Text("korex006@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.deepPurple
                  : Colors.white,
              child: Text("LW"),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          ListTile(
            title: Text("Dynamic Theming"),
            leading: Icon(Icons.camera),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, RouteNames.dynamicThemingScreen);
            },
          ),
          ListTile(
            title: Text("Swipe to Dismiss"),
            leading: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, RouteNames.swipeToDismissScreen);
            },
          ),
          ListTile(
            title: Text("BottomSheets"),
            leading: Icon(Icons.keyboard_arrow_up),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, RouteNames.bottomSheetsScreen);
            },
          ),
          ListTile(
            title: Text("TabBar Layout"),
            leading: Icon(Icons.table_chart),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, RouteNames.tabBarLayoutScreen);
            },
          ),
          ListTile(
            title: Text("Connectivity Test"),
            leading: Icon(Icons.network_check),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, RouteNames.connectivityTestScreen);
            },
          ),
          ListTile(
            title: Text("PageView Demo"),
            leading: Icon(Icons.flip),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, RouteNames.pageViewDemoScreen);
            },
          ),
          ListTile(
            title: Text("Circular Pan Wheel"),
            leading: Icon(Icons.circle),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, RouteNames.circularPanWheelScreen);
            },
          ),
        ],
      ),
    );
  }
}
