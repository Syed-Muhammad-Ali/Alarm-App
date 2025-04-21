
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool? showIcon;
  final VoidCallback? iconTap;
  const CustomAppBar({
    super.key,
    required this.title,
    this.showIcon = false,
    this.iconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        AppText(
          title,
          fontFamily: AppFontFamily.roboto,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ThemeColors.black,
        ),
        showIcon == true
            ? GestureDetector(
              onTap: iconTap,
              child: SvgPicture.asset("assets/icons/user.svg"),
            )
            : SizedBox(),
      ],
    );
  }
}
