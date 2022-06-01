import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfeaturesapp/ui/Utils/drawer_util.dart';

import 'dynamic_theming.dart';

class HomePage extends StatelessWidget {
  var themeData;

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
      body: Center(
        child: Text('Open Drawer to checkout different features',
            style: TextStyle(fontSize: 15.0)),
      ),
    );
  }
}
