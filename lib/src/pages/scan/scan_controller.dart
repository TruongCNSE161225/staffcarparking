import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:staff_carparking/src/modals/parking_session_modal.dart';
import 'package:staff_carparking/utils/constants.dart';

class ScanController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;
  String result = "";

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }

  Future<void> checkVehicle(String id) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}parkingSession/$id/detail"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      ParkingSessionModal data = ParkingSessionModal.fromJson(result['data']);
      Get.toNamed('/confirm', arguments: {
        'parkingSession': data,
      });

    } else {}
  }

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      await checkVehicle(scanData.code!);
    });
  }

  void init() {
    _getCameraPermission();
    if (Platform.isAndroid) {
      qrViewController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrViewController?.resumeCamera();
    }
  }
}
