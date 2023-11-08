import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/scan/scan_controller.dart';

class ScanBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ScanController());
  }

}