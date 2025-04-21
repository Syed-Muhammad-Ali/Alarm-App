import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboadingTwoPage extends StatefulWidget {
  const OnboadingTwoPage({super.key});

  @override
  State<OnboadingTwoPage> createState() => _OnboadingTwoPageState();
}

class _OnboadingTwoPageState extends State<OnboadingTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: ThemeColors.appGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              10.hSpace(context),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/pic1.png",
                    height: 350,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              4.hSpace(context),
              AppText(
                "Let’s get connected to WUB for healthy lifestyle",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ThemeColors.black,
                textAlign: TextAlign.center,
              ),
              4.hSpace(context),
              AppText(
                "Wake up with a surprise – let your friends pick your ringtone!",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ThemeColors.white,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: AppButton(
                        width: context.h * 0.2,
                        height: context.h * 0.06,
                        ontap: () {
                          Get.toNamed(RouteName.signinPage);
                        },
                        label: "Signin",
                        radius: 8,
                        txtClr: ThemeColors.white,
                        txtSize: 16,
                        backgroundColor: ThemeColors.primaryColor,
                      ),
                    ),
                    4.wSpace(context),
                    Expanded(
                      child: AppButton(
                        width: context.h * 0.2,
                        height: context.h * 0.06,
                        ontap: () {
                          Get.toNamed(RouteName.signUpPage);
                        },
                        label: "Signup",
                        radius: 8,
                        txtClr: ThemeColors.white,
                        txtSize: 16,
                        backgroundColor: ThemeColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
