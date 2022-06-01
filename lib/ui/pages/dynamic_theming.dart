import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfeaturesapp/ui/theme/app_themes.dart';
import 'package:flutterfeaturesapp/ui/theme/bloc/theme_bloc.dart';
import 'package:flutterfeaturesapp/ui/theme/bloc/theme_event.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(6),
          itemCount: AppTheme.values.length,
          itemBuilder: (context, index) {
            // Enums expose their values as a list - perfect for ListView
            // Store the theme for the current ListView item
            final itemAppTheme = AppTheme.values[index];
            return Card(
              // Style the cards with the to-be-selected theme colors
              color: appThemeData[itemAppTheme].primaryColor,
              child: ListTile(
                title: Text(
                  itemAppTheme.toString(),
                  // To show light text with the dark variants...
                  style: appThemeData[itemAppTheme].textTheme.bodyText1,
                ),
                onTap: () {
                  // This will make the Bloc output a new ThemeState,
                  // which will rebuild the UI because of the BlocBuilder in main.dart
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeChanged(theme: itemAppTheme));
                },
              ),
            );
          }),
    );
  }
}
