import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/main/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
