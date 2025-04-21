// ignore_for_file: deprecated_member_use

import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/pages/home/other_user_profile/received_profile/received_profile_page.dart';
import 'package:alarm_app/views/pages/home/other_user_profile/send_profile/send_sound_profile.dart';
import 'package:alarm_app/views/widget/app_bar.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';

class OtherUserProfilePage extends StatefulWidget {
  const OtherUserProfilePage({super.key});

  @override
  State<OtherUserProfilePage> createState() => _OtherUserProfilePageState();
}

class _OtherUserProfilePageState extends State<OtherUserProfilePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

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
                CustomAppBar(title: 'Profile', showIcon: false),
                4.hSpace(context),
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
                          height: 90,
                          width: 90,
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
                3.hSpace(context),
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
                    10.wSpace(context),
                    AppButton(
                      width: context.h * 0.22,
                      height: context.h * 0.06,
                      ontap: () {
                        // Get.toNamed(RouteName.editProfilePage);
                      },
                      label: "Add",
                      radius: 8,
                      txtClr: ThemeColors.black,
                      txtSize: 15,
                      weight: FontWeight.w600,
                      backgroundColor: ThemeColors.white.withOpacity(0.75),
                    ),
                  ],
                ),
                2.hSpace(context),
                TabBar(
                  controller: _tabController,
                  labelColor: ThemeColors.secondaryColor,
                  unselectedLabelColor: ThemeColors.white,
                  indicatorColor: ThemeColors.secondaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      // width: 3.0,
                      color: ThemeColors.secondaryColor,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 120),
                  ),
                  indicatorWeight: 3,
                  tabs: const [Tab(text: "Send"), Tab(text: "Received")],
                ),
                Flexible(
                  child: TabBarView(controller: _tabController, children: [
                       SendSoundProfile(),ReceivedProfilePage(),
                        ],
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
