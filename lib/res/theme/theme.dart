import 'package:flutter/material.dart';

class ColorTheme extends Theme {
  static ThemeData themeData = ThemeData(
    // Set all colors to white
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    // brightness: Brightness.light,
    // canvasColor: Colors.white,
    // cardColor: Colors.white,
    // dialogBackgroundColor: Colors.white,
    // disabledColor: Colors.white,
    // dividerColor: Colors.white,

    // focusColor: Colors.white,
    // highlightColor: Colors.white,
    // hintColor: Colors.white,
    // hoverColor: Colors.white,
    // indicatorColor: Colors.white,
    // primaryColor: Colors.white,
    // primaryColorDark: Colors.white,
    // primaryColorLight: Colors.white,
    // scaffoldBackgroundColor: Colors.white,
    // secondaryHeaderColor: Colors.white,
    // splashColor: Colors.white,
    // unselectedWidgetColor: Colors.white,
    // // Typography & Iconography
    // iconTheme: const IconThemeData(color: Colors.white),
    // primaryIconTheme: const IconThemeData(color: Colors.white),
    // // Component Themes
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: Colors.white,
    //   foregroundColor: Colors.white,
    //   surfaceTintColor: Colors.white,
    // ),
    // Add other component themes here if needed
  );

  ColorTheme(Widget child, {super.key}) : super(child: child, data: themeData);
}
