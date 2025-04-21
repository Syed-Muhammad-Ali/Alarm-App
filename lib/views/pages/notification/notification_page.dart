// ignore_for_file: deprecated_member_use

import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_bar.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: ThemeColors.appGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(title: 'Notification'),
                  4.hSpace(context),
                  NotificationCard(
                    icon: Icons.diamond,
                    iconGradientColors: [Color(0xff55DE25), Color(0xff23E97E)],
                    message:
                        'Congrats, You have achieved more than 1k strak recently',
                    time: '1h ago',
                  ),
                  SizedBox(height: 12),
                  NotificationCard(
                    icon: Icons.alarm,
                    iconGradientColors: [Color(0xffC847F4), Color(0xff6E54F7)],
                    message:
                        'You have added new alarm\nthe ring will stop once you start walking for atleast 1 min',
                    time: '1h ago',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final List<Color> iconGradientColors;
  final String message;
  final String time;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.iconGradientColors,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ThemeColors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.w * 0.13,
            height: context.h * 0.06,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: iconGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // shape: BoxShape.circle,
            ),
            child: Center(child: Icon(icon, color: Colors.white, size: 24)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: AppText(
              message,
              fontFamily: AppFontFamily.oxygen,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ThemeColors.black,
            ),
          ),
          const SizedBox(width: 2),
          AppText(
            time,
            fontFamily: AppFontFamily.oxygen,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ThemeColors.black,
          ),
        ],
      ),
    );
  }
}
