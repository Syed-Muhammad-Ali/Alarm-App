// ignore_for_file: deprecated_member_use

import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_bar.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int _selectedRating = 0;
  bool _showCommentBox = true;
  final TextEditingController _commentCrtl = TextEditingController();
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
              children: [
                CustomAppBar(title: ''),
                8.hSpace(context),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 60),
                        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: ThemeColors.white.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.44),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "Your Review",
                              fontFamily: AppFontFamily.lato,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: ThemeColors.white,
                            ),
                            3.hSpace(context),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                return IconButton(
                                  icon: Icon(
                                    index < _selectedRating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Color(0xffFCD53F),
                                    size: 32,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _selectedRating = index + 1;
                                    });
                                  },
                                );
                              }),
                            ),
                            3.hSpace(context),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: AppText(
                                    "Add Comment",
                                    fontFamily: AppFontFamily.lato,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: ThemeColors.white,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Transform.scale(
                                  scale: 0.6,
                                  child: Switch(
                                    value: _showCommentBox,
                                    onChanged: (val) {
                                      setState(() {
                                        _showCommentBox = val;
                                      });
                                    },
                                    activeColor: ThemeColors.white,
                                    activeTrackColor: ThemeColors.switchColor,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            if (_showCommentBox) ...[
                              2.hSpace(context),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: TextField(
                                  controller: _commentCrtl,
                                  maxLines: 5,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "Write Your Comment Here",
                                    hintStyle: TextStyle(color: Colors.white70),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),

                      Positioned(
                        top: 0,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: ThemeColors.white,
                          child: CircleAvatar(
                            radius: 48,
                            backgroundImage: AssetImage(
                              'assets/images/pic9.jpeg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                AppButton(
                  width: double.infinity,
                  height: context.h * 0.06,
                  ontap: () {
                    // Get.toNamed(RouteName.bnbPage);
                  },
                  label: "Save",
                  radius: 8,
                  txtClr: ThemeColors.white,
                  txtSize: 16,
                  backgroundColor: ThemeColors.primaryColor,
                ),
                4.hSpace(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
