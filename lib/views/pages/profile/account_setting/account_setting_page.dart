import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/pages/profile/components/setting_item.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';

class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({super.key});

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AppText(
                    'Account Setting',
                    fontFamily: AppFontFamily.roboto,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ThemeColors.black,
                  ),
                ),
                8.hSpace(context),
                SettingsItem(
                  title: 'Delete Account',
                  trailing: const Icon(Icons.arrow_forward, size: 22),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            backgroundColor: ThemeColors.white,
                            title: const Text('Confirm Deletion'),
                            content: const Text(
                              'Are you sure you want to delete your account? ',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Place your delete logic here
                                  print('Account deleted');
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                    );
                  },
                ),
                2.hSpace(context),
                SettingsItem(
                  title: 'Log Out',
                  trailing: const Icon(Icons.arrow_forward, size: 22),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
