import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/confirm/confirm_controller.dart';

class ConfirmBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmController());
  }
}
