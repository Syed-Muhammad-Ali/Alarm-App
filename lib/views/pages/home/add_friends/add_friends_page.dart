import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_bar.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/app_textfield.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddFriendsPage extends StatefulWidget {
  const AddFriendsPage({super.key});

  @override
  State<AddFriendsPage> createState() => _AddFriendsPageState();
}

class _AddFriendsPageState extends State<AddFriendsPage> {
  final searchCtrl = TextEditingController();

  final List<Map<String, String>> requestList = [
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic7.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic3.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic3.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic5.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic4.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic3.jpeg',
    },
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: 'Add Friends', showIcon: false),
                4.hSpace(context),
                AppTextfield(
                  hint: "Search Here",
                  ctr: searchCtrl,
                  textInputType: TextInputType.name,
                  autofillHints: const [AutofillHints.name],
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                ),
                2.hSpace(context),
                OptionTile(
                  icon: Icons.group_add,
                  iconColor: Color(0xFFED7360),
                  title: "Invite friends",
                  underline: true,
                ),

                // Contacts
                OptionTile(
                  icon: Icons.call,
                  iconColor: Color(0xFF67DDA0),
                  title: "Contacts",
                ),
                2.hSpace(context),
                AppText(
                  'Peoples You May Know',
                  fontFamily: AppFontFamily.inter,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ThemeColors.black,
                ),

                2.hSpace(context),
                Expanded(
                  child: ListView.builder(
                    itemCount: requestList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final request = requestList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteName.otherUserProfilePage);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: Row(
                            children: [
                              _profileImage(request['imagePath']!),
                              SizedBox(width: context.h * 0.02),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      request['name']!,
                                      fontFamily: AppFontFamily.roboto,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: ThemeColors.black,
                                    ),
                                    AppText(
                                      request['followers']!,
                                      fontFamily: AppFontFamily.roboto,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeColors.black,
                                    ),
                                  ],
                                ),
                              ),
                              AppButton(
                                width: context.h * 0.09,
                                height: context.h * 0.03,
                                ontap: () {},
                                label: "Add",
                                radius: 4,
                                txtClr: ThemeColors.white,
                                txtSize: 14,
                                weight: FontWeight.w400,
                                backgroundColor: ThemeColors.primaryColor,
                              ),
                            ],
                          ),
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

  Widget _profileImage(String path) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(path, height: 50, width: 50, fit: BoxFit.cover),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final bool underline;

  const OptionTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.underline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconColor,
            child: Icon(icon, color: ThemeColors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: AppText(
              title,
              fontFamily: AppFontFamily.roboto,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: ThemeColors.black,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: ThemeColors.white,
          ),
        ],
      ),
    );
  }
}
