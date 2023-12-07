// ignore_for_file: unnecessary_import

import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.h),
          ),
          shadowColor: colorScheme.primary.withOpacity(0.46),
          elevation: 5,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray30002,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray30001,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray800,
          fontSize: 17.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 14.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
        ),
        bodySmall: TextStyle(
          color: appTheme.black90001,
          fontSize: 8.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
        ),
        displayMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 44.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
        ),
        displaySmall: TextStyle(
          color: appTheme.black90001,
          fontSize: 36.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
        ),
        headlineLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 31.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black90001,
          fontSize: 24.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 12.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 11.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 23.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 18.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.black90001,
          fontSize: 14.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF28D8A1),
    primaryContainer: Color(0XFF313131),
    secondaryContainer: Color(0XFFADADAD),

    // Error colors
    errorContainer: Color(0XFF898989),
    onError: Color(0XFFD9D9D9),

    // On colors(text colors)
    onPrimary: Color(0XFF282424),
    onPrimaryContainer: Color(0XFFFFFFFF),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF0C0C0C);
  Color get black90001 => Color(0XFF000000);

  // Blue
  Color get blue200 => Color(0XFF97BCE8);

  // BlueGray
  Color get blueGray100 => Color(0XFFCACCCB);
  Color get blueGray900 => Color(0XFF1C2C3F);
  Color get blueGray90001 => Color(0XFF323643);

  // DeepOrange
  Color get deepOrangeA100 => Color(0XFFF9B572);

  // Gray
  Color get gray300 => Color(0XFFE0E0E0);
  Color get gray30001 => Color(0XFFE1E3E8);
  Color get gray30002 => Color(0XFFDEDEDE);
  Color get gray400 => Color(0XFFB5B5B5);
  Color get gray40001 => Color(0XFFB8B8B8);
  Color get gray40002 => Color(0XFFBABABA);
  Color get gray500 => Color(0XFFA5A5A5);
  Color get gray600 => Color(0XFF777777);
  Color get gray800 => Color(0XFF4D4949);
  Color get gray80001 => Color(0XFF4B4B4B);

  // Green
  Color get green400 => Color(0XFF609966);
  Color get green40001 => Color(0XFF5E9C68);
  Color get green40002 => Color(0XFF5E9B68);

  // Indigo
  Color get indigo300 => Color(0XFF7BA6DA);
  Color get indigo400 => Color(0XFF4E84C4);

  // Red
  Color get red600 => Color(0XFFD83838);
  Color get red700 => Color(0XFFD82828);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
