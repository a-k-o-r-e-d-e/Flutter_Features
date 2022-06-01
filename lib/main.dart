import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(ThemeState(
          themeData: appThemeData[AppTheme.Light], appTheme: AppTheme.Light)),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }
}

Widget _buildWithTheme(BuildContext context, ThemeState state) {
  return MaterialApp(
    title: 'Flutter Features App',
    home: HomePage(state.themeData),
    theme: state.themeData,
  );
}
