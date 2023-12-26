// ignore_for_file: unnecessary_import

import 'dart:ui';
import 'package:facetap/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Outline button style
  static ButtonStyle get outlinePrimaryBL4 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              3.h,
            ),
            topRight: Radius.circular(
              4.h,
            ),
            bottomLeft: Radius.circular(
              4.h,
            ),
            bottomRight: Radius.circular(
              4.h,
            ),
          ),
        ),
        shadowColor: theme.colorScheme.primary.withOpacity(0.46),
        elevation: 6,
      );
  static ButtonStyle get outlinePrimary1 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shadowColor: theme.colorScheme.primary.withOpacity(0.46),
        elevation: 6,
      );
  static ButtonStyle get outlinePrimary2 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shadowColor: theme.colorScheme.primary.withOpacity(0.46),
        elevation: 7,
      );
  static ButtonStyle get outlinePrimary3 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shadowColor: theme.colorScheme.primary.withOpacity(0.46),
        elevation: 5,
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
