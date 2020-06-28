import 'package:flutter/material.dart';
import 'package:flutterfeaturesapp/ui/pages/dynamic_theming.dart';

import '../pages/bottomsheets.dart';
import '../pages/swipe_to_dismiss.dart';
import '../pages/tab_bar_nav.dart';

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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PreferencePage()));
            },
          ),
          ListTile(
            title: Text("Swipe to Dismiss"),
            leading: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SwipeToDismiss()));
            },
          ),
          ListTile(
            title: Text("BottomSheets"),
            leading: Icon(Icons.keyboard_arrow_up),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => BottomSheets()));
            },
          ),
          ListTile(
            title: Text("TabBar Navigation"),
            leading: Icon(Icons.table_chart),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => TabBarNav()));
            },
          )
        ],
      ),
    );
  }
}
