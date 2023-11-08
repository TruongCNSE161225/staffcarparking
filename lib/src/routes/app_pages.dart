import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/confirm/confirm_binding.dart';
import 'package:staff_carparking/src/pages/confirm/confirm_page.dart';
import 'package:staff_carparking/src/pages/guest/guest_binding.dart';
import 'package:staff_carparking/src/pages/guest/guest_page.dart';
import 'package:staff_carparking/src/pages/history/history_binding.dart';
import 'package:staff_carparking/src/pages/history/history_page.dart';
import 'package:staff_carparking/src/pages/home/home_binding.dart';
import 'package:staff_carparking/src/pages/home/home_page.dart';
import 'package:staff_carparking/src/pages/login/login_binding.dart';
import 'package:staff_carparking/src/pages/login/login_page.dart';
import 'package:staff_carparking/src/pages/main/main_binding.dart';
import 'package:staff_carparking/src/pages/main/main_page.dart';
import 'package:staff_carparking/src/pages/profile/profile_binding.dart';
import 'package:staff_carparking/src/pages/profile/profile_page.dart';
import 'package:staff_carparking/src/pages/scan/scan_binding.dart';
import 'package:staff_carparking/src/pages/scan/scan_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryPage(),
      binding: HistoryBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => const ScanPage(),
      binding: ScanBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.GUEST,
      page: () => const GuestPage(),
      binding: GuestBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CONFIRM,
      page: () => const ConfirmPage(),
      binding: ConfirmBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
