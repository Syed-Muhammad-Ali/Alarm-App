// ignore_for_file: deprecated_member_use

import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w * 0.28,
      height: context.h * 0.13,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          AppText(
            title,
            fontFamily: AppFontFamily.roboto,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: ThemeColors.black.withOpacity(0.90),
          ),
          2.hSpace(context),
          AppText(
            value,
            fontFamily: AppFontFamily.inter,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ThemeColors.black.withOpacity(0.90),
          ),
        ],
      ),
    );
  }
}
