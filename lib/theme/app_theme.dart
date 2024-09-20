import 'package:flutter/material.dart';

import '../sizes.dart';
import 'colors.dart';

class AppTheme {
  final AppColors chosenColor;

  AppTheme(
      this.chosenColor,
      );

  ThemeData getTheme() {
    final sizes = AppValues();

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        surface: chosenColor.backgroundColor,
        seedColor: chosenColor.primaryColor,
        primary: chosenColor.primaryColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: chosenColor.primaryColor,
        foregroundColor: chosenColor.backgroundColor,
        titleTextStyle: TextStyle(
          fontSize: sizes.appBarText,
          color: chosenColor.textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: chosenColor.textColor,
          fontSize: sizes.normalText,
        ),
        labelSmall: TextStyle(
          color: chosenColor.textColor,
          fontSize: sizes.normalText,
        ),
        headlineLarge: TextStyle(
          color: chosenColor.textColor,
          fontSize: sizes.largeText,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
          WidgetStateProperty.all<Color>(chosenColor.primaryColor),
          foregroundColor:
          WidgetStateProperty.all<Color>(chosenColor.whiteColor),
          textStyle: WidgetStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: sizes.smallText,
            ),
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all<Color>(chosenColor.primaryColor),
        overlayColor:
        WidgetStateProperty.all<Color>(chosenColor.backgroundColor),
        trackColor:
        WidgetStateProperty.all<Color>(chosenColor.backgroundColor),
        trackOutlineColor:
        WidgetStateProperty.all<Color>(chosenColor.backgroundColor),
      ),
    );
  }
}