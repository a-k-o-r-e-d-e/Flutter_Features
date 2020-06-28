import 'dart:async';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import './bloc.dart';
import '../app_themes.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState {
    // Everything is accessible from the appThemeData Map.
    return super.initialState ??
        ThemeState(
            themeData: appThemeData[AppTheme.Light], appTheme: AppTheme.Light);
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      yield ThemeState(
          themeData: appThemeData[event.theme], appTheme: event.theme);
    }
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    try {
      return ThemeState(
          themeData: appThemeData[
              EnumToString.fromString(AppTheme.values, json['theme'])],
          appTheme: EnumToString.fromString(AppTheme.values, json['theme']));
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    try {
      return {'theme': EnumToString.parse(state.appTheme)};
    } catch (_) {
      return null;
    }
  }
}
