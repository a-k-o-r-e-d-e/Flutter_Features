import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Utils/drawer_util.dart';

void main() => runApp(MyApp());
final bloc = Bloc();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: bloc.darkThemeEnabled,
        initialData: false,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Features App',
            theme: ThemeData.from(
              colorScheme: snapshot.data
                  ? ColorScheme.dark(surface: Colors.purple)
                  : ColorScheme.light(surface: Colors.purple),
            ),
//          ThemeData(
//            // This is the theme of your application.
//            primarySwatch: Colors.purple,
//
//          ),
            home: HomePage(snapshot.data),
          );
        });
  }
}

class HomePage extends StatelessWidget {
  bool darkThemeEnabled;

  HomePage(this.darkThemeEnabled);

// This widget is the root of view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Features"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: DrawerUtil(
        darkThemeEnabled: darkThemeEnabled,
      ),
      body: Center(child: Text("Open Drawer to check diff features")),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();

  get changeTheme => _themeController.sink.add;

  get darkThemeEnabled => _themeController.stream;

  static final _instance = Bloc.internal();

  Bloc.internal();

  factory Bloc() => _instance;
}
