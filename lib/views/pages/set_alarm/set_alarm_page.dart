// ignore_for_file: deprecated_member_use

import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_bar.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/app_textfield.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetAlarmPage extends StatefulWidget {
  const SetAlarmPage({super.key});

  @override
  State<SetAlarmPage> createState() => _SetAlarmPageState();
}

class _SetAlarmPageState extends State<SetAlarmPage> {
  double volume = 0.5;
  bool isVibrateOn = true;
  final labelCtrl = TextEditingController();

  final List<String> days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
  Set<String> selectedDays = {'Th', 'Sa'};

  // List<int> hours = List.generate(12, (i) => i == 0 ? 12 : i);
  // List<int> minutes = List.generate(60, (i) => i);
  // List<String> periods = ['AM', 'PM'];
  final List<int> hours = List.generate(12, (index) => index + 1);
  final List<int> minutes = List.generate(60, (index) => index);
  final List<String> periods = ['AM', 'PM'];

  int selectedHour = 5;
  int selectedMinute = 30;
  String selectedPeriod = 'AM';

  void toggleDay(String day) {
    setState(() {
      selectedDays.contains(day)
          ? selectedDays.remove(day)
          : selectedDays.add(day);
    });
  }

  void toggleAllDays() {
    setState(() {
      if (selectedDays.length == days.length) {
        selectedDays.clear();
      } else {
        selectedDays = days.toSet();
      }
    });
  }

  // Widget _buildWheel(
  //   List<dynamic> items,
  //   dynamic selected,
  //   ValueChanged<dynamic> onChanged,
  // ) {
  //   return SizedBox(
  //     height: 150,
  //     width: 60,
  //     child: ListWheelScrollView.useDelegate(
  //       controller: FixedExtentScrollController(
  //         initialItem: items.indexOf(selected),
  //       ),
  //       itemExtent: 50,
  //       onSelectedItemChanged: (index) => onChanged(items[index]),
  //       physics: const FixedExtentScrollPhysics(),
  //       perspective: 0.003,
  //       diameterRatio: 1.2,
  //       childDelegate: ListWheelChildBuilderDelegate(
  //         builder: (context, index) {
  //           if (index < 0 || index >= items.length) return null;
  //           return Center(
  //             child: Text(
  //               items[index].toString().padLeft(2, '0'),
  //               style: const TextStyle(fontSize: 20),
  //             ),
  //           );
  //         },
  //         childCount: items.length,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildWheel<T>({
    required List<T> items,
    required T selected,
    required ValueChanged<T> onChanged,
  }) {
    return SizedBox(
      height: 200,
      width: 70,
      child: ListWheelScrollView.useDelegate(
        controller: FixedExtentScrollController(
          initialItem: items.indexOf(selected),
        ),
        itemExtent: 50,
        physics: const FixedExtentScrollPhysics(),
        perspective: 0.003,
        diameterRatio: 1.2,
        onSelectedItemChanged: (index) => onChanged(items[index]),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (index < 0 || index >= items.length) return null;
            final isSelected = items[index] == selected;
            return Center(
              child: AppText(
                items[index].toString().padLeft(2, '0'),
                fontSize: isSelected ? 40 : 20,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? ThemeColors.black : Colors.black54,
                fontFamily: AppFontFamily.oxygen,
              ),
            );
          },
          childCount: items.length,
        ),
      ),
    );
  }

  List<String> images = <String>[
    'assets/images/pic7.jpeg',
    'assets/images/pic6.jpeg',
    'assets/images/pic5.jpeg',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(title: 'Set Alarm'),
                  4.hSpace(context),
                  AppTextfield(
                    hint: "label",
                    ctr: labelCtrl,
                    autofillHints: const [AutofillHints.name],
                    textInputType: TextInputType.name,
                  ),
                  3.hSpace(context),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     _buildWheel(
                  //       hours,
                  //       selectedHour,
                  //       (value) => setState(() => selectedHour = value),
                  //     ),
                  //     const SizedBox(width: 8),
                  //     const Text(
                  //       ":",
                  //       style: TextStyle(
                  //         fontSize: 40,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     const SizedBox(width: 8),
                  //     _buildWheel(
                  //       minutes,
                  //       selectedMinute,
                  //       (value) => setState(() => selectedMinute = value),
                  //     ),
                  //     const SizedBox(width: 16),
                  //     _buildWheel(
                  //       periods,
                  //       selectedPeriod,
                  //       (value) => setState(() => selectedPeriod = value),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildWheel<int>(
                        items: hours,
                        selected: selectedHour,
                        onChanged: (val) => setState(() => selectedHour = val),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        ":",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      _buildWheel<int>(
                        items: minutes,
                        selected: selectedMinute,
                        onChanged:
                            (val) => setState(() => selectedMinute = val),
                      ),
                      const SizedBox(width: 8),
                      _buildWheel<String>(
                        items: periods,
                        selected: selectedPeriod,
                        onChanged:
                            (val) => setState(() => selectedPeriod = val),
                      ),
                    ],
                  ),
                  3.hSpace(context),
                  AppText(
                    "Repeat",
                    fontFamily: AppFontFamily.inter,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  2.hSpace(context),
                  Wrap(
                    spacing: 6,
                    runSpacing: 0,
                    children:
                        days.map((day) {
                          final isSelected = selectedDays.contains(day);
                          return GestureDetector(
                            onTap: () => toggleDay(day),
                            onLongPress: toggleAllDays,
                            child: Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? ThemeColors.primaryColor
                                        : ThemeColors.white.withOpacity(0.75),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: AppText(
                                day,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFontFamily.roboto,
                                color:
                                    isSelected
                                        ? ThemeColors.white
                                        : ThemeColors.black,
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  4.hSpace(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "Sound",
                            fontFamily: AppFontFamily.oxygen,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'I Don’t Care, ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sofi Stones',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                  radius: 14,
                                  backgroundImage: AssetImage(images[i]),
                                ),
                              ),
                            ),
                          SizedBox(width: context.w * 0.08),
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
                          SizedBox(width: context.w * 0.005),
                          Icon(
                            Icons.chevron_right,
                            size: 32,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                  3.hSpace(context),
                  AppText(
                    'Volume',
                    fontSize: 18,
                    fontFamily: AppFontFamily.oxygen,
                    fontWeight: FontWeight.w700,
                    color: ThemeColors.black,
                  ),

                  Slider(
                    value: volume,
                    min: 0,
                    max: 1,
                    onChanged: (value) => setState(() => volume = value),
                    activeColor: ThemeColors.primaryColor,
                    inactiveColor: Color(0xff393C4175),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        "Vibrate",
                        fontSize: 18,
                        fontFamily: AppFontFamily.oxygen,
                        fontWeight: FontWeight.w700,
                        color: ThemeColors.black,
                      ),
                      Switch(
                        value: isVibrateOn,
                        onChanged: (val) => setState(() => isVibrateOn = val),
                        activeColor: Colors.white,
                        activeTrackColor: ThemeColors.primaryColor,
                        inactiveTrackColor: Colors.grey[400],
                      ),
                    ],
                  ),
                  3.hSpace(context),
                  Center(
                    child: AppButton(
                      width: context.w * 0.35,
                      height: context.h * 0.05,
                      ontap: () {
                        Get.toNamed(RouteName.selectSoundsPage);
                      },
                      label: "Save",
                      radius: 4,
                      txtClr: ThemeColors.white,
                      txtSize: 14,
                      weight: FontWeight.w400,
                      backgroundColor: ThemeColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TimePickerScreen extends StatefulWidget {
  const TimePickerScreen({Key? key}) : super(key: key);

  @override
  State<TimePickerScreen> createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  final List<int> hours = List.generate(12, (index) => index + 1);
  final List<int> minutes = List.generate(60, (index) => index);
  final List<String> periods = ['AM', 'PM'];

  int selectedHour = 5;
  int selectedMinute = 30;
  String selectedPeriod = 'AM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE7A977), Color(0xFFCE5DD4)],
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildWheel<int>(
                items: hours,
                selected: selectedHour,
                onChanged: (val) => setState(() => selectedHour = val),
              ),
              const SizedBox(width: 4),
              const Text(
                ":",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              _buildWheel<int>(
                items: minutes,
                selected: selectedMinute,
                onChanged: (val) => setState(() => selectedMinute = val),
              ),
              const SizedBox(width: 8),
              _buildWheel<String>(
                items: periods,
                selected: selectedPeriod,
                onChanged: (val) => setState(() => selectedPeriod = val),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWheel<T>({
    required List<T> items,
    required T selected,
    required ValueChanged<T> onChanged,
  }) {
    return SizedBox(
      height: 200,
      width: 70,
      child: ListWheelScrollView.useDelegate(
        controller: FixedExtentScrollController(
          initialItem: items.indexOf(selected),
        ),
        itemExtent: 50,
        physics: const FixedExtentScrollPhysics(),
        perspective: 0.003,
        diameterRatio: 1.2,
        onSelectedItemChanged: (index) => onChanged(items[index]),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (index < 0 || index >= items.length) return null;
            final isSelected = items[index] == selected;
            return Center(
              child: Text(
                items[index].toString().padLeft(2, '0'),
                style: TextStyle(
                  fontSize: isSelected ? 40 : 20,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.black54,
                ),
              ),
            );
          },
          childCount: items.length,
        ),
      ),
    );
  }
}
