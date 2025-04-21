import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/pages/set_alarm/select_sounds/all_sounds/all_sounds_page.dart';
import 'package:alarm_app/views/pages/set_alarm/select_sounds/received_sounds/received_sounds_page.dart';
import 'package:alarm_app/views/pages/set_alarm/select_sounds/send_sounds/send_sounds_page.dart';
import 'package:alarm_app/views/widget/app_bar.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';

class SelectSoundsPage extends StatefulWidget {
  const SelectSoundsPage({super.key});

  @override
  State<SelectSoundsPage> createState() => _SelectSoundsPageState();
}

class _SelectSoundsPageState extends State<SelectSoundsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: ThemeColors.appGradient),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(title: 'Sound', showIcon: false),
                    2.hSpace(context),
                    TabBar(
                      controller: _tabController,
                      labelColor: ThemeColors.secondaryColor,
                      unselectedLabelColor: ThemeColors.white,
                      indicatorColor: ThemeColors.secondaryColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          // width: 3.0,
                          color: ThemeColors.secondaryColor,
                        ),
                        insets: EdgeInsets.symmetric(horizontal: 80),
                      ),
                      indicatorWeight: 3,
                      tabs: const [
                        Tab(text: "All"),
                        Tab(text: "Send"),
                        Tab(text: "Received"),
                      ],
                    ),
                    Flexible(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          AllSoundsPage(),
                          SendSoundsPage(),
                          ReceivedSoundsPage(),
                        ],
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
