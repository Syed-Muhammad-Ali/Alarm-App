import 'dart:async';

import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/app_textfield.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  final searchCtrl = TextEditingController();
  List<String> images = <String>[
    'assets/images/pic7.jpeg',
    'assets/images/pic6.jpeg',
    'assets/images/pic5.jpeg',
  ];
  bool isSwitched = true;
  bool showFirstColumn = true;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      setState(() {
        showFirstColumn = false;
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
            child:
                showFirstColumn
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Image.asset("assets/images/alarm.png")),
                        6.hSpace(context),
                        AppButton(
                          width: double.infinity,
                          height: context.h * 0.06,
                          ontap: () {},
                          label: "Create Alarm",
                          radius: 8,
                          txtClr: ThemeColors.white,
                          txtSize: 16,
                          backgroundColor: ThemeColors.primaryColor,
                        ),
                      ],
                    )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: AppText(
                            'Alarm',
                            fontFamily: AppFontFamily.roboto,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ThemeColors.black,
                          ),
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
                        1.hSpace(context),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            activeTrackColor:
                                                ThemeColors.switchColor,
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
                                        color: Color(
                                          0xFFFF7235,
                                        ).withOpacity(0.33),
                                        borderRadius:
                                            const BorderRadius.vertical(
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
                                              for (
                                                int i = 0;
                                                i < images.length;
                                                i++
                                              )
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
                                                      backgroundImage:
                                                          AssetImage(images[i]),
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
                                                    fontFamily:
                                                        AppFontFamily.roboto,
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
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
