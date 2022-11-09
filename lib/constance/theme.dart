// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:wellcare/constance/constance.dart' as constance;

class AppTheme {
  static bool isLightTheme = true;

  static ThemeData getTheme() {
    if (isLightTheme) {
      return lightTheme();
    } else {
      return darkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline6: TextStyle(
        color: base.headline6!.color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        // fontFamily: "Avenir",
      ),
      subtitle1: TextStyle(
        color: base.subtitle1!.color,
        fontSize: 18,
        // fontFamily: "Avenir",
      ),
      subtitle2: TextStyle(
        color: base.subtitle2!.color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        // fontFamily: "Avenir",
      ),
      bodyText2: TextStyle(
        color: base.bodyText2!.color,
        fontSize: 16,
        // fontFamily: "Avenir",
      ),
      bodyText1: TextStyle(
        color: base.bodyText1!.color,
        fontSize: 14,
        // fontFamily: "Avenir",
      ),
      button: TextStyle(
        color: base.button!.color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        // fontFamily: "Avenir",
      ),
      caption: TextStyle(
        color: base.caption!.color,
        fontSize: 12,
        // fontFamily: "Avenir",
      ),
      headline4: TextStyle(
        color: base.headline4!.color,
        fontSize: 34,
        // fontFamily: "Avenir",
      ),
      headline3: TextStyle(
        color: base.headline3!.color,
        fontSize: 48,
        // fontFamily: "Avenir",
      ),
      headline2: TextStyle(
        color: base.headline2!.color,
        fontSize: 60,
        // fontFamily: "Avenir",
      ),
      headline1: TextStyle(
        color: base.headline1!.color,
        fontSize: 96,
        // fontFamily: "Avenir",
      ),
      headline5: TextStyle(color: base.headline5!.color, fontSize: 24),
      overline: TextStyle(color: base.overline!.color, fontSize: 10),
    );
  }

  static ThemeData lightTheme() {
    Color primaryColor = HexColor(constance.primaryColorString);
    Color secondaryColor = HexColor(constance.secondaryColorString);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );

    final ThemeData base = ThemeData.light();
    return base.copyWith(
        appBarTheme: AppBarTheme(color: Colors.white),
        popupMenuTheme: PopupMenuThemeData(color: Colors.white),
        colorScheme: colorScheme,
        primaryColor: primaryColor,
        buttonColor: primaryColor,
        splashColor: Colors.white.withOpacity(0.1),
        hoverColor: Colors.transparent,
        splashFactory: InkRipple.splashFactory,
        highlightColor: Colors.transparent,
        accentColor: primaryColor,
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        errorColor: Colors.red,
        textTheme: _buildTextTheme(base.textTheme),
        primaryTextTheme: _buildTextTheme(base.textTheme),
        platform: TargetPlatform.iOS,
        indicatorColor: primaryColor,
        disabledColor: HexColor("#D5D7D8"));
  }

  static ThemeData darkTheme() {
    Color primaryColor = HexColor(constance.primaryColorString);
    Color secondaryColor = HexColor(constance.secondaryColorString);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      popupMenuTheme: PopupMenuThemeData(color: Colors.black),
      appBarTheme: AppBarTheme(color: Colors.black),
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      accentColor: secondaryColor,
      canvasColor: Colors.white,
      backgroundColor: Colors.grey[850],
      scaffoldBackgroundColor: Colors.grey[850],
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
