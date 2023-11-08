import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/guest/guest_controller.dart';

class GuestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestController());
  }
}
