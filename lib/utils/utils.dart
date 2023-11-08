import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staff_carparking/src/modals/image_modal.dart';
import 'package:staff_carparking/src/modals/vehicle_type_modal.dart';
import 'package:staff_carparking/utils/constants.dart';

abstract class Utils {
  static String hiddenPrice(dynamic price, bool hidden) {
    if (hidden) {
      return "******";
    }
    return price;
  }

  static Future<VehicleTypeModal> getVehicleTypeByString(String name) async {
    var prefs = await SharedPreferences.getInstance();
    VehicleTypeModal vehicleTypeModal = VehicleTypeModal();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}vehicleTypes/list"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));

      result['data'].forEach((element) {
        if (name.contains(element['name'])) {
          return vehicleTypeModal = VehicleTypeModal.fromJson(element);
        }
      });
    }
    return vehicleTypeModal;
  }

  static String checkEmpty(String text, String defaultValue) {
    if (text.isEmpty) {
      return defaultValue;
    }
    return text;
  }

  static void loading(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(color: Colors.blue[900]),
            ));
  }

  static void showDialogPopup(BuildContext context, String text) {
    Get.dialog(AlertDialog(
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 40.sp,
        )));
  }

  static void showDialogPopupError(BuildContext context, String text) {
    Get.dialog(AlertDialog(
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Icon(
          Icons.error,
          color: Colors.red,
          size: 40.sp,
        )));
  }

  static void showDialogOption(
      BuildContext context, String text, File file, Function()? onDelete) {
    Get.dialog(AlertDialog(
      title: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.file(
          file,
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Huỷ', style: TextStyle(color: Colors.white))),
        ElevatedButton(
            onPressed: onDelete,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF064789)),
            child: const Text('Xoá', style: TextStyle(color: Colors.white))),
      ],
    ));
  }

  static Future<String> uploadImage(File? file) async {
    var postUri = Uri.parse('${Constants.baseUrlMedia}public/upload');
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('file', file!.path);
    request.fields['fileType'] = 'AVATAR';
    request.files.add(multipartFile);
    final streamResponse = await request.send();
    final responseImage = await http.Response.fromStream(streamResponse);
    if (responseImage.statusCode == 200) {
      Map<String, dynamic> result =
          jsonDecode(utf8.decode(responseImage.bodyBytes));
      ImageModal image = ImageModal.fromJson(result['data']);
      return image.previewUrl!;
    } else {
      return '';
    }
  }
}
