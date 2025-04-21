import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> images = [
    'assets/images/pic1.png',
    'assets/images/pic1.png',
    'assets/images/pic1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) => setState(() => currentPage = index),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(gradient: ThemeColors.appGradient),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    images[index],
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                4.hSpace(context),
                AppText(
                  "Access Anywhere",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ThemeColors.black,
                ),
                2.hSpace(context),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: AppText(
                    "The video call feature can be accessed from anywhere if your team is here to help you.",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.white,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (dotIndex) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      width: currentPage == dotIndex ? 10 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color:
                            currentPage == dotIndex
                                ? ThemeColors.primaryColor
                                : ThemeColors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
                4.hSpace(context),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 24,
                  ),
                  child: AppButton(
                    width: double.infinity,
                    height: context.h * 0.06,
                    ontap: () {
                      if (currentPage == images.length - 1) {
                        Get.toNamed(RouteName.onboadingTwoPage);
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    label:
                        currentPage == images.length - 1
                            ? "Get Started"
                            : "Next",
                    radius: 8,
                    txtClr: ThemeColors.white,
                    txtSize: 16,
                    backgroundColor: ThemeColors.primaryColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
