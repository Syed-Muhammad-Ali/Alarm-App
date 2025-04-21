// ignore_for_file: deprecated_member_use

import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/pages/profile/components/setting_item.dart';
import 'package:alarm_app/views/pages/profile/components/stat_card.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isNotificationEnabled = true;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AppText(
                    'Profile',
                    fontFamily: AppFontFamily.roboto,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ThemeColors.black,
                  ),
                ),
                2.hSpace(context),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/pic5.jpeg',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    5.wSpace(context),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        AppText(
                          'Furqan',
                          fontFamily: AppFontFamily.roboto,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.black,
                        ),
                        SizedBox(height: 4),
                        AppText(
                          '+92 000 0000 000',
                          fontFamily: AppFontFamily.roboto,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.white,
                        ),
                        AppText(
                          'roymiller@gmail.com',
                          fontFamily: AppFontFamily.roboto,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                2.hSpace(context),
                Row(
                  children: [
                    Column(
                      children: const [
                        AppText(
                          '14',
                          fontFamily: AppFontFamily.roboto,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: ThemeColors.black,
                        ),

                        SizedBox(height: 4),
                        AppText(
                          'Friends',
                          fontFamily: AppFontFamily.roboto,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.white,
                        ),
                      ],
                    ),
                    9.wSpace(context),
                    AppButton(
                      width: context.h * 0.22,
                      height: context.h * 0.06,
                      ontap: () {
                        Get.toNamed(RouteName.editProfilePage);
                      },
                      label: "Edit profile",
                      radius: 8,
                      txtClr: ThemeColors.black,
                      txtSize: 15,
                      weight: FontWeight.w600,
                      backgroundColor: ThemeColors.white.withOpacity(0.75),
                    ),
                  ],
                ),
                4.hSpace(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    StatCard(title: 'Total alarms', value: '75'),
                    StatCard(title: 'Ringtones Sent/\nReceived', value: '75'),
                    StatCard(title: 'Wake-up time\naverage', value: '128'),
                  ],
                ),
                4.hSpace(context),
                SettingsItem(
                  title: 'Sounds',
                  trailing: const Icon(Icons.arrow_forward, size: 22),
                  onTap: () {
                    Get.toNamed(RouteName.showAlarmPage);
                  },
                ),
                1.hSpace(context),
                SettingsItem(
                  title: 'Notification',
                  trailing: Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: _isNotificationEnabled,
                      onChanged: (value) {
                        setState(() {
                          _isNotificationEnabled = value;
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: ThemeColors.switchColor,
                    ),
                  ),
                ),
                1.hSpace(context),
                SettingsItem(
                  title: 'Delete Account',
                  trailing: const Icon(Icons.arrow_forward, size: 22),
                  onTap: () {},
                ),
                1.hSpace(context),
                SettingsItem(
                  title: 'Log Out',
                  trailing: const Icon(Icons.arrow_forward, size: 22),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
