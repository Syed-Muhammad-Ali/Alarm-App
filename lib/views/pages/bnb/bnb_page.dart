import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/pages/alarm/alarm_page.dart';
import 'package:alarm_app/views/pages/home/home_page.dart';
import 'package:alarm_app/views/pages/profile/profile_page.dart';
import 'package:alarm_app/views/pages/sounds/sounds_page.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BNBPage extends StatefulWidget {
  const BNBPage({super.key});

  @override
  State<BNBPage> createState() => _BNBPageState();
}

class _BNBPageState extends State<BNBPage> {
  int _selectedIndex = 0;

  // List of Screens
  final List<Widget> _screens = [
    const HomePage(),
    const AlarmPage(),
    const SoundsPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteName.setAlarmPage);
          // Get.toNamed(RouteName.friendsPage);
        },
        shape: const CircleBorder(),
        elevation: 2,
        backgroundColor: Color(0xffFF4D00),
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Color(0xffFF4D00),
          ),
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/add-icon.svg",
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: const BorderRadius.only(
            //   topLeft: Radius.circular(25),
            //   topRight: Radius.circular(25),
            // ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                selectedIndex == 0
                    ? "assets/icons/home-selected.svg"
                    : "assets/icons/home.svg",
                "Home",
                0,
              ),
              _buildNavItem(
                selectedIndex == 1
                    ? "assets/icons/alarm-selected.svg"
                    : "assets/icons/alarm.svg",
                "Alarm",
                1,
              ),
              const SizedBox(width: 60),
              _buildNavItem(
                selectedIndex == 2
                    ? "assets/icons/music-selected.svg"
                    : "assets/icons/music.svg",
                "Music",
                2,
              ),
              _buildNavItem(
                selectedIndex == 3
                    ? "assets/icons/profile-selected.svg"
                    : "assets/icons/profile.svg",
                "Profile",
                3,
              ),
            ],
          ),
        ),
        Positioned(
          top: -35,
          left: MediaQuery.of(context).size.width / 2 - 35,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,

              width: isSelected ? 28 : 26,
              height: isSelected ? 28 : 26,
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: AppText(
                  label,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.primaryColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
