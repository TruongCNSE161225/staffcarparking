import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/history/history_controller.dart';

class HistoryBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }

}