import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staff_carparking/utils/utils.dart';

class GuestController extends GetxController {
  TextEditingController licensePlateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  final _selectedImage = {}.obs;
  get images => _selectedImage;

  Future pickImageFromCamera() async {
    final result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result != null) {
      _selectedImage[_selectedImage.length + 1] = File(result.path);
    }
  }

  void removeImageByIndex(BuildContext context, int index) {
    Utils.showDialogOption(
        context, 'Xoá hình ảnh', images.values.toList()[index], () {
      Get.back();
      _selectedImage.remove(_selectedImage.keys.elementAt(index));
    });
  }

  void clearTextField() {
    licensePlateController.text = "";
    nameController.text = "";
    colorController.text = "";
  }

  void init() {
    clearTextField();
    _selectedImage.clear();
  }
}
