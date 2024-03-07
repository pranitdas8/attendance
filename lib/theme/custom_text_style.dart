import 'package:flutter/material.dart';
import 'package:attendance_app/core/utils/size_utils.dart';
import 'package:attendance_app/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Headline text style
  static get headlineMediumBluegray100 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.blueGray100,
        fontSize: 28.fSize,
      );
  static get headlineMediumBluegray100_1 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.blueGray100,
      );
}

extension on TextStyle {
  TextStyle get judson {
    return copyWith(
      fontFamily: 'Judson',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
