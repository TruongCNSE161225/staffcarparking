import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/main/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            body: PageStorage(
                bucket: controller.bucket, child: controller.currentScreen),
            extendBody: true,
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
              child: NavigationBar(
                backgroundColor: const Color(0xFF064789),
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                onDestinationSelected: (int index) {
                  controller.changeTab(index);
                },
                indicatorColor: Colors.white,
                selectedIndex: controller.currentTab.value,
                destinations: const <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.home,
                      color: Color(0xFF064789),
                    ),
                    icon: Icon(Icons.home_outlined, color: Colors.white),
                    label: 'Trang chủ',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.qr_code_scanner,
                      color: Color(0xFF064789),
                    ),
                    icon: Icon(Icons.qr_code_scanner, color: Colors.white),
                    label: 'Quét mã',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.add,
                      size: 30,
                      color: Color(0xFF064789),
                    ),
                    icon: Icon(Icons.add, color: Colors.white),
                    label: 'Xe vãng lai',
                  ),
                  // NavigationDestination(
                  //   selectedIcon: Icon(
                  //     Icons.history_rounded,
                  //     color: Color(0xFF064789),
                  //   ),
                  //   icon: Icon(Icons.history_rounded, color: Colors.white),
                  //   label: 'Lịch sử',
                  // ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.account_circle_rounded,
                      color: Color(0xFF064789),
                    ),
                    icon: Icon(Icons.account_circle_outlined,
                        color: Colors.white),
                    label: 'Tài khoản',
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
