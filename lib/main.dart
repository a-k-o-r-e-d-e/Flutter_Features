import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfeaturesapp/ui/Utils/route_names.dart';
import 'package:flutterfeaturesapp/ui/pages/bottomsheets.dart';
import 'package:flutterfeaturesapp/ui/pages/connectivity_test.dart';
import 'package:flutterfeaturesapp/ui/pages/dynamic_theming.dart';
import 'package:flutterfeaturesapp/ui/pages/page_view.dart';
import 'package:flutterfeaturesapp/ui/pages/swipe_to_dismiss.dart';
import 'package:flutterfeaturesapp/ui/pages/tab_bar_nav.dart';
import 'package:flutterfeaturesapp/ui/theme/app_themes.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'ui/pages/home_page.dart';
import 'ui/theme/bloc/bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp()),
    storage: storage,
  );
  // HydratedBloc delegate = await HydratedStorage.build();
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<String, Widget Function(BuildContext)> generateRoutes(
      BuildContext context) {
    return {
      RouteNames.dynamicThemingScreen: (context) => DynamicThemingScreen(),
      RouteNames.swipeToDismissScreen: (context) => SwipeToDismiss(),
      RouteNames.bottomSheetsScreen: (context) => BottomSheetsScreen(),
      RouteNames.tabBarLayoutScreen: (context) => TabBarLayoutScreen(),
      RouteNames.connectivityTestScreen: (context) => ConnectivityTest(),
      RouteNames.pageViewDemoScreen: (context) => PageViewDemo(),
      RouteNames.circularPanWheelScreen: (context) => BottomSheetsScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(ThemeState(
          themeData: appThemeData[AppTheme.Light], appTheme: AppTheme.Light)),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => MaterialApp(
          title: 'Flutter Features App',
          home: HomePage(state.themeData),
          theme: state.themeData,
          routes: generateRoutes(context),
        ),
      ),
    );
  }
}
