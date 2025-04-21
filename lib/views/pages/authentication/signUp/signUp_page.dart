import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/app_textfield.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: ThemeColors.appGradient),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                4.hSpace(context),
                Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                    width: 100,
                  ),
                ),
                1.hSpace(context),
                AppText(
                  "Hii There!!",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ThemeColors.black,
                  textAlign: TextAlign.center,
                ),
                1.hSpace(context),
                AppText(
                  "Welcome to WUB one stop solution for healthy life",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.black,
                  textAlign: TextAlign.center,
                ),
                3.hSpace(context),
                AppTextfield(
                  hint: "Enter Username",
                  ctr: nameCtrl,
                  textInputType: TextInputType.name,
                  autofillHints: const [AutofillHints.name],
                ),
                1.hSpace(context),
                AppTextfield(
                  hint: "Email",
                  ctr: emailCtrl,
                  textInputType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                ),
                1.hSpace(context),
                AppTextfield(
                  hint: "Password",
                  ctr: passwordCtrl,
                  autofillHints: const [AutofillHints.password],
                  textInputType: TextInputType.visiblePassword,
                  isPasswordField: true,
                ),
                1.hSpace(context),
                AppText(
                  "By signing up you agree to Terms & conditions of Wakey app.",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.white,
                ),
                4.hSpace(context),
                AppButton(
                  width: double.infinity,
                  height: context.h * 0.06,
                  ontap: () {
                             Get.toNamed(RouteName.signinPage);
                  },
                  label: "Create Account",
                  radius: 8,
                  txtClr: ThemeColors.white,
                  txtSize: 16,
                  backgroundColor: ThemeColors.primaryColor,
                ),
                4.hSpace(context),
                Row(
                  children: const [
                    Expanded(child: Divider(color: ThemeColors.dividerColor)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: AppText(
                        "or",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ThemeColors.black,
                      ),
                    ),
                    Expanded(child: Divider(color: ThemeColors.dividerColor)),
                  ],
                ),
                3.hSpace(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      height: context.h * 0.07,
                      width: context.w * 0.15,
                      decoration: BoxDecoration(
                        color: ThemeColors.white.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/apple.svg',
                        width: 32,
                        height: 32,
                      ),
                    ),
                    6.wSpace(context),
                    Container(
                      height: context.h * 0.07,
                      width: context.w * 0.15,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: ThemeColors.white.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/google.svg',
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ],
                ),
                4.hSpace(context),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: ThemeColors.white,
                      fontSize: 14,
                    ),
                    children: [
                      const TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "signin",
                        style: const TextStyle(
                          color: ThemeColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(RouteName.signinPage);
                              },
                      ),
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
