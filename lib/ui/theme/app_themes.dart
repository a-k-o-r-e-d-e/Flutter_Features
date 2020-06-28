import 'package:flutter/material.dart';

enum AppTheme {
  Dark,
  Light,
  GreyDark,
}

final appThemeData = {
  AppTheme.Dark: ThemeData.dark().copyWith(primaryColor: Colors.lightGreen),
  AppTheme.Light: ThemeData.light().copyWith(primaryColor: Colors.purple),
  AppTheme.GreyDark: ThemeData.light().copyWith(primaryColor: Colors.grey)
};
