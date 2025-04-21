import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/views/pages/authentication/signIn/signIn_page.dart';
import 'package:alarm_app/views/pages/authentication/signUp/signUp_page.dart';
import 'package:alarm_app/views/pages/bnb/bnb_page.dart';
import 'package:alarm_app/views/pages/home/other_user_profile/other_user_profile_page.dart';
import 'package:alarm_app/views/pages/set_alarm/select_sounds/select_sounds_page.dart';
import 'package:alarm_app/views/pages/show_alarm/show_alarm_page.dart';
import 'package:alarm_app/views/pages/show_alarm/rating/rating_page.dart';
import 'package:alarm_app/views/pages/home/add_friends/add_friends_page.dart';
import 'package:alarm_app/views/pages/home/view_friends/view_friends_page.dart';
import 'package:alarm_app/views/pages/notification/notification_page.dart';
import 'package:alarm_app/views/pages/onboarding/onboading_two_page.dart';
import 'package:alarm_app/views/pages/onboarding/onboarding_page.dart';
import 'package:alarm_app/views/pages/profile/edit_profile/edit_profile_page.dart';
import 'package:alarm_app/views/pages/set_alarm/set_alarm_page.dart';
import 'package:alarm_app/views/pages/sounds/share_sounds/share_sounds_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
    // Local Admin Screen Name
    GetPage(
      name: RouteName.onboardingPage,
      page: () => const OnboardingPage(),
      // transition: Transition.rightToLeftWithFade,
      // transitionDuration: const Duration(milliseconds: 800),
    ),
    GetPage(
      name: RouteName.onboadingTwoPage,
      page: () => const OnboadingTwoPage(),
    ),
    GetPage(name: RouteName.signinPage, page: () => const SigninPage()),
    GetPage(name: RouteName.signUpPage, page: () => const SignupPage()),
    GetPage(name: RouteName.bnbPage, page: () => const BNBPage()),
    GetPage(
      name: RouteName.viewFriendsPage,
      page: () => const ViewFriendsPage(),
    ),
    GetPage(name: RouteName.addFriendsPage, page: () => const AddFriendsPage()),
    GetPage(
      name: RouteName.editProfilePage,
      page: () => const EditProfilePage(),
    ),
    GetPage(
      name: RouteName.notificationPage,
      page: () => const NotificationPage(),
    ),
    GetPage(
      name: RouteName.shareSoundsPage,
      page: () => const ShareSoundsPage(),
    ),
    GetPage(name: RouteName.showAlarmPage, page: () => const ShowAlarmPage()),
    GetPage(name: RouteName.ratingPage, page: () => const RatingPage()),
    GetPage(name: RouteName.setAlarmPage, page: () => const SetAlarmPage()),
    GetPage(name: RouteName.selectSoundsPage, page: () => const SelectSoundsPage()),
    GetPage(name: RouteName.otherUserProfilePage, page: () => const OtherUserProfilePage()),
  ];
}
