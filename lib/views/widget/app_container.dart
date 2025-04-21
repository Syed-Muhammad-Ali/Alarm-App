// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppContainer extends StatelessWidget {
  AppContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.onTap,
    this.padding,
    this.margin,
    this.color,
    this.radius,
  });
  final Widget child;
  double? width;
  double? height;
  VoidCallback? onTap;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  final Color? color;
  double? radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? Get.width,
        height: height,
        padding: padding ?? EdgeInsets.all(16),
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 12),
          color: color ?? ThemeColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
