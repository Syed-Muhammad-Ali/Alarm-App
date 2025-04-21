import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShowAlarmPage extends StatefulWidget {
  const ShowAlarmPage({super.key});

  @override
  State<ShowAlarmPage> createState() => _ShowAlarmPageState();
}

class _ShowAlarmPageState extends State<ShowAlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/alarm-background.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  2.hSpace(context),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: SvgPicture.asset("assets/icons/sounds-icon.svg"),
                      ),
                      5.wSpace(context),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "I Don’t Care",
                            fontSize: 14,
                            fontFamily: AppFontFamily.lato,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.black,
                          ),
                          1.hSpace(context),
                          AppText(
                            'Sent by: Lady June',
                            fontSize: 12,
                            fontFamily: AppFontFamily.lato,
                            fontWeight: FontWeight.w400,
                            color: ThemeColors.white,
                          ),
                        ],
                      ),
                    ],
                  ),

                  2.hSpace(context),
                  AppText(
                    'Drink Water',
                    fontSize: 32,
                    fontFamily: AppFontFamily.roboto,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.black,
                  ),
                  AppText(
                    '5:30 AM',
                    fontSize: 24,
                    fontFamily: AppFontFamily.roboto,
                    fontWeight: FontWeight.w500,
                    color: ThemeColors.black,
                  ),
                  1.hSpace(context),
                  Image.asset('assets/images/alarm-clock.gif', height: 170),
                  4.hSpace(context),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.bnbPage);
                    },
                    child: Image.asset('assets/images/close.png'),
                  ),
                  2.hSpace(context),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(RouteName.ratingPage);
                    },
                    child: AppText(
                      'Give Rating',
                      fontFamily: AppFontFamily.roboto,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ThemeColors.white,
                      decorationColor: ThemeColors.white,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
