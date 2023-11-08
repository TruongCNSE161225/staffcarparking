import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/guest/guest_controller.dart';
import 'package:staff_carparking/src/pages/guest/guest_page.dart';
import 'package:staff_carparking/src/pages/history/history_controller.dart';
import 'package:staff_carparking/src/pages/history/history_page.dart';
import 'package:staff_carparking/src/pages/home/home_controller.dart';
import 'package:staff_carparking/src/pages/home/home_page.dart';
import 'package:staff_carparking/src/pages/profile/profile_controller.dart';
import 'package:staff_carparking/src/pages/profile/profile_page.dart';
import 'package:staff_carparking/src/pages/scan/scan_controller.dart';
import 'package:staff_carparking/src/pages/scan/scan_page.dart';

class MainController extends GetxController {
  late HomeController _homeController;
  late ScanController _scanController;
  late GuestController _guestController;
  late HistoryController _historyController;
  late ProfileController _profileController;
  PageStorageBucket bucket = PageStorageBucket();
  var currentTab = 0.obs;
  final List<Widget> _screens = [
    const HomePage(),
    const ScanPage(),
    const GuestPage(),
    // const HistoryPage(),
    const ProfilePage(),
  ];

  Widget get currentScreen => _screens[currentTab.value];

  @override
  void onInit() {
    initController();
    super.onInit();
  }

  void initController() {
    Get.put(
      HomeController(),
      permanent: true,
    );
    _homeController = Get.find<HomeController>();
    _homeController.init();

    Get.put(
      ScanController(),
      permanent: true,
    );
    _scanController = Get.find<ScanController>();
    _scanController.init();

    // Get.put(
    //   HistoryController(),
    //   permanent: true,
    // );
    // _historyController = Get.find<HistoryController>();
    // _historyController.init();

    Get.put(
      ProfileController(),
      permanent: true,
    );
    _profileController = Get.find<ProfileController>();
    _profileController.init();

    Get.put(
      GuestController(),
      permanent: true,
    );
    _guestController = Get.find<GuestController>();
    _guestController.init();
  }

  void changeTab(int index) {
    currentTab.value = index;
    switch (index) {
      case 0:
        _homeController.init();
        break;
      case 1:
        _scanController.init();
        break;
      case 2:
        _guestController.init();
        break;
      // case 3:
      //   _historyController.init();
      //   break;
      case 3:
        _profileController.init();
        break;
    }
  }
}
