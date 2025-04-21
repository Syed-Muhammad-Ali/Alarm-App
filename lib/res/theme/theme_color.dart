// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ThemeColors {
  static const white = Colors.white;
  static const black = Colors.black;
  static const green = Colors.green;
  static const red = Colors.red;
  static const Color grey = Colors.grey;
  static const primaryColor = Color(0xFFFF7235);
  static const secondaryColor = Color(0xFFBE00FF);
  static const dividerColor = Color(0xFF797C81);
  static const containerColor = Color(0xFFFFB92B);
  static const switchColor = Color(0xFFC847F4);
  static const viewColor = Color(0xFF661F00);

  static const Gradient appGradient = LinearGradient(
    colors: <Color>[Color(0xFFF7AC54), Color(0xFFBE00FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Gradient containerGradient = LinearGradient(
    colors: <Color>[
      Color(0xFFD41414).withOpacity(0.50),
      Color(0xFFF75468).withOpacity(0.50),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
