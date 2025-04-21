// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:alarm_app/views/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  Color? txtClr;
  String label;
  VoidCallback? ontap;
  Row? rowElements;
  double? height;
  double? width;
  double? txtSize;
  double? radius;
  FontWeight? weight;
  EdgeInsets? padding;
  final Color? backgroundColor;
  final Gradient? gradient;
  bool loading;
  final Border? border;

  AppButton({
    super.key,
    required this.label,
    this.ontap,
    this.rowElements,
    this.txtClr,
    this.height,
    this.radius,
    this.width,
    this.txtSize = 16,
    this.weight,
    this.padding,
    this.backgroundColor,
    this.gradient,
    this.loading = false,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height ?? 56,
        width: width ?? Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: backgroundColor,
          border: border,
          boxShadow: [
            // BoxShadow(
            //   color: Colors.white.withOpacity(0.3),
            //   blurRadius: 10,
            //   spreadRadius: 1,
            //   offset: const Offset(0, 4),
            // ),
            // BoxShadow(
            //   color: Colors.white.withOpacity(0.2), // Dark bottom shadow
            //   blurRadius: 6,
            //   spreadRadius: 1,
            //   offset: const Offset(0, 4), // Positioned downward
            // ),
          ],
          // gradient:
          //     backgroundColor == null ? gradient ?? _defaultGradient() : null,
        ),
        child: Center(
          child:
              rowElements ??
              AppText(
                label,
                textAlign: TextAlign.center,
                textOverflow: TextOverflow.ellipsis,
                color: txtClr ?? Colors.white,
                fontSize: txtSize,
                fontWeight: weight ?? FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
