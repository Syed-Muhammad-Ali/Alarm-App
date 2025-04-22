// ignore_for_file: deprecated_member_use

import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_bar.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/app_textfield.dart';
import 'package:alarm_app/views/widget/button.dart' show AppButton;
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ViewFriendsPage extends StatefulWidget {
  const ViewFriendsPage({super.key});

  @override
  State<ViewFriendsPage> createState() => _ViewFriendsPageState();
}

class _ViewFriendsPageState extends State<ViewFriendsPage> {
  final searchCtrl = TextEditingController();
  final List<Map<String, String>> friends = const [
    {
      'name': 'Abinaya Pillai',
      'subtitle': 'Woke You Up 10 time Last Month.',
      'imagePath': 'assets/images/pic3.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'subtitle': 'Woke You Up 10 time Last Month.',
      'imagePath': 'assets/images/pic7.jpeg',
    },
  ];

  final List<Map<String, String>> requestList = [
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic7.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic3.jpeg',
    },
  ];
  final List<Map<String, String>> yourFriendsList = [
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic3.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic5.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic4.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic3.jpeg',
    },
  ];
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
                children: [
                  CustomAppBar(
                    title: 'Friends',
                    showIcon: true,
                    iconTap: () {
                      Get.toNamed(RouteName.addFriendsPage);
                    },
                  ),
                  4.hSpace(context),
                  AppTextfield(
                    hint: "Search Here",
                    ctr: searchCtrl,
                    textInputType: TextInputType.name,
                    autofillHints: const [AutofillHints.name],
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: SvgPicture.asset("assets/icons/search.svg"),
                    ),
                  ),
                  2.hSpace(context),
                  const SectionHeader(title: 'Friends Who Woke You Up'),
                  2.hSpace(context),
                  ListView.builder(
                    itemCount: friends.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final friend = friends[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            _profileImage(friend['imagePath']!),
                            SizedBox(width: context.h * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  friend['name']!,
                                  fontFamily: AppFontFamily.roboto,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: ThemeColors.black,
                                ),
                                AppText(
                                  friend['subtitle']!,
                                  fontFamily: AppFontFamily.roboto,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  2.hSpace(context),
                  const SectionHeader(title: 'Friend Requests'),
                  2.hSpace(context),
                  ListView.builder(
                    itemCount: requestList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final request = requestList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: Row(
                          children: [
                            _profileImage(request['imagePath']!),
                            SizedBox(width: context.h * 0.02),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    request['name']!,
                                    fontFamily: AppFontFamily.roboto,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: ThemeColors.black,
                                  ),
                                  AppText(
                                    request['followers']!,
                                    fontFamily: AppFontFamily.roboto,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColors.black,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppButton(
                                  width: context.h * 0.07,
                                  height: context.h * 0.03,
                                  ontap: () {},
                                  label: "Accept",
                                  radius: 4,
                                  txtClr: ThemeColors.white,
                                  txtSize: 10,
                                  weight: FontWeight.w400,
                                  backgroundColor: ThemeColors.primaryColor,
                                ),
                                SizedBox(height: 6),
                                AppButton(
                                  width: context.h * 0.07,
                                  height: context.h * 0.03,
                                  ontap: () {},
                                  label: "Cancel",
                                  radius: 4,
                                  txtClr: ThemeColors.black.withOpacity(0.50),
                                  txtSize: 10,
                                  weight: FontWeight.w400,
                                  backgroundColor: ThemeColors.white
                                      .withOpacity(0.75),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  2.hSpace(context),
                  const SectionHeader(title: 'Your Friends'),
                  2.hSpace(context),
                  ListView.builder(
                    itemCount: yourFriendsList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final friend = yourFriendsList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: Row(
                          children: [
                            _profileImage(friend['imagePath']!),
                            SizedBox(width: context.h * 0.02),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    friend['name']!,
                                    fontFamily: AppFontFamily.roboto,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: ThemeColors.black,
                                  ),
                                  AppText(
                                    friend['followers']!,
                                    fontFamily: AppFontFamily.roboto,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColors.black,
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileImage(String path) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(path, height: 50, width: 50, fit: BoxFit.cover),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const SectionHeader({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          fontFamily: AppFontFamily.inter,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: ThemeColors.black,
        ),
        GestureDetector(
          onTap: onTap,
          child: AppText(
            'View All',
            fontFamily: AppFontFamily.inter,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ThemeColors.viewColor,
            decorationColor: ThemeColors.viewColor,
            textDecoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
