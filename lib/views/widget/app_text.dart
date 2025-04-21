// ignore_for_file: unreachable_switch_default

import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppFontFamily { roboto, inter, oxygen, lato }

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontStyle,
    this.fontFamily = AppFontFamily.roboto,
    this.lineSpacing,
    this.letterSpacing,
    this.textOverflow,
    this.maxLines,
    this.textDecoration,
    this.color,
    this.fontWeight,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.decorationColor,
  });

  final String text;
  final AppFontFamily fontFamily;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final double? fontSize;
  final double? letterSpacing;
  final double? lineSpacing;
  final TextAlign textAlign;
  final Color? color;
  final int? maxLines;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    TextStyle style;

    switch (fontFamily) {
      case AppFontFamily.oxygen:
        style = GoogleFonts.oxygen(
          fontStyle: fontStyle ?? FontStyle.normal,
          height: lineSpacing,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          fontWeight: fontWeight,
          fontSize:
              fontSize ?? Theme.of(context).textTheme.bodyMedium!.fontSize,
          color: color ?? ThemeColors.black,
          decorationColor: decorationColor ?? ThemeColors.white,
        );
        break;

      case AppFontFamily.inter:
        style = GoogleFonts.inter(
          fontStyle: fontStyle ?? FontStyle.normal,
          height: lineSpacing,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          fontWeight: fontWeight,
          fontSize:
              fontSize ?? Theme.of(context).textTheme.bodyMedium!.fontSize,
          color: color ?? ThemeColors.black,
          decorationColor: decorationColor ?? ThemeColors.white,
        );
        break;

      case AppFontFamily.lato:
        style = GoogleFonts.lato(
          fontStyle: fontStyle ?? FontStyle.normal,
          height: lineSpacing,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          fontWeight: fontWeight,
          fontSize:
              fontSize ?? Theme.of(context).textTheme.bodyMedium!.fontSize,
          color: color ?? ThemeColors.black,
          decorationColor: decorationColor ?? ThemeColors.white,
        );
        break;

      case AppFontFamily.roboto:
      default:
        style = GoogleFonts.roboto(
          fontStyle: fontStyle ?? FontStyle.normal,
          height: lineSpacing,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          fontWeight: fontWeight,
          fontSize:
              fontSize ?? Theme.of(context).textTheme.bodyMedium!.fontSize,
          color: color ?? ThemeColors.black,
          decorationColor: decorationColor ?? ThemeColors.white,
        );
    }

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style,
    );
  }
}
