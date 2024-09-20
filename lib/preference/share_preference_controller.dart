import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceController {
  static const String isDarkTheme = 'isDarkTheme';
  static late final SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static bool get getDarkTheme =>
      _preferences.getBool(isDarkTheme) ??
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  static Future<void> setIsDarkTheme({required bool darkTheme}) async =>
      _preferences.setBool(isDarkTheme, darkTheme);
}
