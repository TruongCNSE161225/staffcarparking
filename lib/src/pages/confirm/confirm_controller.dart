import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staff_carparking/src/modals/parking_session_modal.dart';
import 'package:staff_carparking/src/pages/scan/scan_controller.dart';
import 'package:staff_carparking/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:staff_carparking/utils/utils.dart';

class ConfirmController extends GetxController {
  Rx<ParkingSessionModal> parkingSession = Rx(ParkingSessionModal());
  late List<File> imageConfirm = [];
  final _selectedImage = {}.obs;
  get images => _selectedImage;
  @override
  void onInit() {
    parkingSession(Get.arguments['parkingSession']);
    super.onInit();
  }

  Future<void> confirmCheckIn(String sessionId) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    List<String> imageApi = [];
    if (imageConfirm.isNotEmpty) {
      for (var i = 0; i < imageConfirm.length; i++) {
        String result = await Utils.uploadImage(imageConfirm[i]);
        imageApi.add(Constants.baseUrlImage + result);
      }
    }
    final response = await http.put(
      Uri.parse("${Constants.baseUrl}parkingSession/confirm"),
      headers: Constants.header(token!),
      body: jsonEncode({"sessionId": sessionId, "checkInCapture": imageApi}),
    );
    if (response.statusCode == 200) {
      Get.back();
      Utils.showDialogPopup(Get.context!, 'Xác nhận thành công');
    } else {
      Utils.showDialogPopupError(Get.context!, 'Error ${response.statusCode}');
    }
  }

  Future<void> checkOut(String sessionId) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    List<String> imageApi = [];
    if (imageConfirm.isNotEmpty) {
      for (var i = 0; i < imageConfirm.length; i++) {
        String result = await Utils.uploadImage(imageConfirm[i]);
        imageApi.add(Constants.baseUrlImage + result);
      }
    }
    final response = await http.put(
      Uri.parse("${Constants.baseUrl}parkingSession/checkOut"),
      headers: Constants.header(token!),
      body: jsonEncode({"sessionId": sessionId, "checkInCapture": imageApi}),
    );
    if (response.statusCode == 200) {
      Get.back();
      Utils.showDialogPopup(Get.context!, 'Xác nhận thành công');
    } else {}
  }

  Future<void> onConfirm() async {
    var checkInValue = parkingSession.value.checkInTime;
    var checkOutValue = parkingSession.value.checkOutTime;
    if (checkInValue != null && checkOutValue == null) {
      if (imageConfirm.isEmpty) {
        return;
      } else {
        await checkOut(parkingSession.value.id!);
      }
    }
    if (checkOutValue == null && checkInValue == null) {
      if (imageConfirm.isEmpty) {
        return;
      } else {
        await confirmCheckIn(parkingSession.value.id!);
      }
    }
    // var scanController = Get.find<ScanController>();
    // scanController.qrViewController?.resumeCamera();
  }

  void onCancel() {
    Get.back();
  }

  void removeImageByIndex(BuildContext context, int index) {
    Utils.showDialogOption(
        context, 'Xoá hình ảnh', images.values.toList()[index], () {
      Get.back();
      _selectedImage.remove(_selectedImage.keys.elementAt(index));
    });
  }

  Future pickImageFromCamera() async {
    imageConfirm.clear();
    final result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result != null) {
      imageConfirm.add(File(result.path));
      _selectedImage[_selectedImage.length + 1] = File(result.path);
    }
  }
}
