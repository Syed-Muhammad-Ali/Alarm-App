// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_bar.dart';
import 'package:alarm_app/views/widget/app_textfield.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:csc_picker_plus/csc_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final phoneNoCtrl = TextEditingController();
  String? countryValue;
  String? stateValue;
  String? cityValue;

  File? _imageFile;
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() => _imageFile = File(pickedFile.path));
    }
    Get.back();
  }

  void _showImagePickerSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.purple.shade50,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take from Camera"),
                onTap: () => _pickImage(ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Pick from Gallery"),
                onTap: () => _pickImage(ImageSource.gallery),
              ),
            ],
          ),
    );
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(title: 'Edit Profile'),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child:
                                _imageFile != null
                                    ? Image.file(
                                      _imageFile!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                    : Image.asset(
                                      'assets/images/pic5.jpeg',
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                          ),
                        ),

                        Positioned(
                          bottom: -8,
                          right: -6,
                          child: GestureDetector(
                            onTap: _showImagePickerSheet,
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/icons/camera.svg",
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  4.hSpace(context),
                  AppTextfield(
                    hint: "Username",
                    ctr: nameCtrl,
                    readOnly: true,
                    textInputType: TextInputType.name,
                    autofillHints: const [AutofillHints.name],
                  ),
                  1.hSpace(context),
                  AppTextfield(
                    hint: "Email",
                    ctr: emailCtrl,
                    readOnly: true,
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
                  AppTextfield(
                    hint: "Phone",
                    ctr: phoneNoCtrl,
                    autofillHints: const [AutofillHints.telephoneNumber],
                    textInputType: TextInputType.number,
                  ),
                  // 1.hSpace(context),
                  // AppTextfield(
                  //   hint: "Address",
                  //   ctr: addressCtrl,
                  //   autofillHints: const [AutofillHints.addressCity],
                  //   textInputType: TextInputType.streetAddress,
                  //   isPasswordField: true,
                  // ),
                  // 1.hSpace(context),
                  // AppTextfield(
                  //   hint: "Zip Code",
                  //   ctr: zipCodeCtrl,
                  //   autofillHints: const [AutofillHints.telephoneNumber],
                  //   textInputType: TextInputType.number,
                  //   isPasswordField: true,
                  // ),
                  1.hSpace(context),
                  CSCPickerPlus(
                    dropdownDecoration: BoxDecoration(
                      color: ThemeColors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ThemeColors.white.withOpacity(0.85),
                        width: 1,
                      ),
                    ),
                    countryStateLanguage: CountryStateLanguage.englishOrNative,
                    // countryStateLanguage: CountryStateLanguage.englishOrNative,
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        stateValue = value ?? '';
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        cityValue = value ?? '';
                      });
                    },
                  ),
                  5.hSpace(context),
                  AppButton(
                    width: double.infinity,
                    height: context.h * 0.06,
                    ontap: () {
                      //  Get.toNamed(RouteName.signinPage);
                    },
                    label: "Save changes",
                    radius: 8,
                    txtClr: ThemeColors.white,
                    txtSize: 16,
                    backgroundColor: ThemeColors.primaryColor,
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
