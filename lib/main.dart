import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfeaturesapp/bottomsheets.dart';
import 'package:flutterfeaturesapp/swipe_to_dismiss.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
// This widget is the root of view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Features"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Lone Wolf"),
              accountEmail: Text("korex006@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.deepPurple
                        : Colors.white,
                child: Text("LW"),
              ),
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
            )
          ],
        ),
      ),
      body: Center(child: Text("Open Drawer to check diff features")),
    );
  }
}
