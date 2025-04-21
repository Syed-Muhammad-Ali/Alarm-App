// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> friendImages = const [
    'assets/images/pic2.jpeg',
    'assets/images/pic3.jpeg',
    'assets/images/pic4.jpeg',
    'assets/images/pic5.jpeg',
    'assets/images/pic3.jpeg',
  ];
  List<String> images = <String>[
    'assets/images/pic7.jpeg',
    'assets/images/pic6.jpeg',
    'assets/images/pic5.jpeg',
  ];
  bool isSwitched = true;
  bool showFriendsSection = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      setState(() {
        showFriendsSection = false;
      });
    });
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ThemeColors.containerColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/pic2.jpeg',
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          4.wSpace(context),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(
                                'Ruby Jackson',
                                fontFamily: AppFontFamily.oxygen,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: ThemeColors.white,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  1.wSpace(context),
                                  AppText(
                                    'Kolkata',
                                    fontFamily: AppFontFamily.oxygen,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteName.notificationPage);
                        },
                        child: SvgPicture.asset(
                          "assets/icons/notification.svg",
                        ),
                      ),
                    ],
                  ),
                  if (showFriendsSection) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        15.hSpace(context),
                        Center(child: Image.asset("assets/images/pic8.png")),
                        2.hSpace(context),
                        AppText(
                          'No Alarm found',
                          fontFamily: AppFontFamily.inter,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.black,
                        ),
                        6.hSpace(context),
                        AppButton(
                          width: double.infinity,
                          height: context.h * 0.06,
                          ontap: () {},
                          label: "Let Friends Wake You Up",
                          radius: 8,
                          txtClr: ThemeColors.white,
                          txtSize: 16,
                          backgroundColor: ThemeColors.primaryColor,
                        ),
                      ],
                    ),
                  ] else ...[
                    2.hSpace(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'Friends',
                          fontFamily: AppFontFamily.inter,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ThemeColors.black,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteName.viewFriendsPage);
                          },
                          child: AppText(
                            'View All',
                            fontFamily: AppFontFamily.inter,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ThemeColors.white,
                            decorationColor: ThemeColors.white,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    3.hSpace(context),
                    SizedBox(
                      height: context.h * 0.15,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: friendImages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      friendImages[index],
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                1.hSpace(context),
                                AppText(
                                  'Sophia Calzoni',
                                  fontFamily: AppFontFamily.inter,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColors.black,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    1.hSpace(context),
                    AppText(
                      'Upcoming Alarms',
                      fontFamily: AppFontFamily.inter,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.black,
                    ),
                    2.hSpace(context),
                    ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: context.h * 0.2,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            gradient: ThemeColors.containerGradient,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/sound.svg",
                                      height: 20,
                                      width: 20,
                                    ),
                                    2.wSpace(context),
                                    const Expanded(
                                      child: AppText(
                                        "I Don’t Care, by Sofi",
                                        fontSize: 18,
                                        fontFamily: AppFontFamily.lato,
                                        fontWeight: FontWeight.w500,
                                        color: ThemeColors.white,
                                      ),
                                    ),
                                    Switch(
                                      value: isSwitched,
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitched = value;
                                        });
                                      },
                                      activeColor: ThemeColors.white,
                                      activeTrackColor: ThemeColors.switchColor,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    AppText(
                                      '5:30 AM',
                                      fontSize: 24,
                                      fontFamily: AppFontFamily.roboto,
                                      fontWeight: FontWeight.w500,
                                      color: ThemeColors.white,
                                    ),
                                    AppText(
                                      "1:30:52 Sec",
                                      fontSize: 16,
                                      fontFamily: AppFontFamily.roboto,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeColors.white,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF7235).withOpacity(0.33),
                                  borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(16),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      'wake Up Time',
                                      fontSize: 16,
                                      fontFamily: AppFontFamily.roboto,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeColors.white,
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < images.length; i++)
                                          Align(
                                            widthFactor: .25,
                                            alignment: Alignment.center,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 1,
                                                ),
                                              ),
                                              margin: EdgeInsets.only(
                                                left: i.toDouble() * 18,
                                              ),
                                              child: CircleAvatar(
                                                radius: 17,
                                                backgroundImage: AssetImage(
                                                  images[i],
                                                ),
                                              ),
                                            ),
                                          ),
                                        SizedBox(width: 32),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Center(
                                            child: AppText(
                                              '+5',
                                              fontSize: 16,
                                              fontFamily: AppFontFamily.roboto,
                                              fontWeight: FontWeight.w400,
                                              color: ThemeColors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
