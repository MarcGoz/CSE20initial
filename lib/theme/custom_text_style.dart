import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 16.fSize,
      );
  static get bodyLargeBlack90001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90001,
        fontSize: 18.fSize,
      );
  static get bodyLargeBluegray90001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray90001,
        fontSize: 16.fSize,
      );
  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
        fontSize: 16.fSize,
      );
  static get bodyLargeRubik => theme.textTheme.bodyLarge!.rubik;
  static get bodyMedium15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
      );
  static get titleSmallBlack90001 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.black90001,
    fontWeight: FontWeight.w700,
    fontSize: 15.fSize,
  );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w100,
      );
  static get bodyMediumBlack900Thin => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w100,
      );
  static get bodyMediumErrorContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w100,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w100,
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w100,
      );
  static get bodyMediumRegular => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumRegular15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w400,
      );

  static get bodyMediumSecondaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w400,
      );

  static get bodyMediumThin => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w100,
      );
  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 10.fSize,
      );
  static get bodySmallBluegray900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallErrorContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallErrorContainerRegular =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray400,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallGray500Regular => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallOnPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 10.fSize,
      );
  static get bodySmallOnPrimaryContainer10 =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 10.fSize,
      );
  static get bodySmallOnPrimaryContainer10_1 =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 10.fSize,
      );
  static get bodySmallOnPrimaryContainer_1 =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallRegular => theme.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get bodySmallRubik => theme.textTheme.bodySmall!.rubik.copyWith(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallRubikErrorContainer =>
      theme.textTheme.bodySmall!.rubik.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallRubikErrorContainerRegular =>
      theme.textTheme.bodySmall!.rubik.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallRubikOnPrimaryContainer =>
      theme.textTheme.bodySmall!.rubik.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w400,
      );
  // Display text style
  static get displayMediumBluegray100 =>
      theme.textTheme.displayMedium!.copyWith(
        color: appTheme.blueGray100,
        fontSize: 40.fSize,
        fontWeight: FontWeight.w700,
      );
  static get displayMediumPrimary => theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 40.fSize,
        fontWeight: FontWeight.w700,
      );
  static get displayMediumPrimary_1 => theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get displaySmallPrimary => theme.textTheme.displaySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Headline text style
  static get headlineLargeBlack90001 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.black90001,
        fontSize: 32.fSize,
        fontWeight: FontWeight.w300,
      );
  static get headlineLargePrimary => theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Label text style
  static get labelLargeBlack90001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeOnPrimaryContainer =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w900,
      );
  static get labelLargeOnPrimaryContainerBlack =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w900,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeRed600 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.red600,
      );
  static get labelLargeRubikErrorContainer =>
      theme.textTheme.labelLarge!.rubik.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get labelMediumBlack90001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black90001,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBlack90001Medium =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumMedium => theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  // Montserrat text style
  static get montserratBlack90001 => TextStyle(
        color: appTheme.black90001,
        fontSize: 66.fSize,
        fontWeight: FontWeight.w300,
      ).montserrat;
  static get montserratBlack90001Bold => TextStyle(
        color: appTheme.black90001,
        fontSize: 6.fSize,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static get montserratBlack90001Light => TextStyle(
        color: appTheme.black90001,
        fontSize: 66.fSize,
        fontWeight: FontWeight.w300,
      ).montserrat;
  // Title text style
  static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleLargeRoboto => theme.textTheme.titleLarge!.roboto.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumMontserrat =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        fontSize: 16.fSize,
      );
  static get titleMediumMontserratBlack900 =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGreen40002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.green40002,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 15.fSize,
      );
  static get titleSmallOnPrimaryContainerBlack =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w900,
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get rubik {
    return copyWith(
      fontFamily: 'Rubik',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }
}
