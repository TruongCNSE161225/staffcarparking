import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staff_carparking/src/modals/user_modal.dart';
import 'package:staff_carparking/src/pages/scan/scan_controller.dart';
import 'package:staff_carparking/src/widgets/inputText.dart';
import 'package:staff_carparking/utils/constants.dart';

class ProfileController extends GetxController {
  UserModal? user;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  Rx<bool> obscureTextOld = true.obs;
  Rx<bool> obscureTextNew = true.obs;
  final _formKeyProfile = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  Future<void> init() async {
    var prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      user = UserModal.fromJson(json.decode(userJson.toString()));
    }
  }

  void dialogConfirm() {
    Get.dialog(AlertDialog(
      title: const Text(
        'Đăng xuất',
      ),
      content: const Text("Bạn muốn đăng xuất?"),
      actions: [
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Huỷ', style: TextStyle(color: Colors.white))),
        ElevatedButton(
            onPressed: () {
              signOut();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF064789)),
            child:
                const Text('Đăng xuất', style: TextStyle(color: Colors.white))),
      ],
    ));
  }

  void resetChangePassword() {
    obscureTextOld.value = true;
    obscureTextNew = true.obs;
    oldPasswordController.text = "";
    newPasswordController.text = "";
  }

  void resetEditProfile() {
    // nameController.text = user!.name ?? '';
    // emailController.text = user!.email ?? '';
    // phoneController.text = user!.phone ?? '';
  }

  void changePassword(context) {
    resetChangePassword();
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32.r))),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: _formKeyPassword,
              child: Column(
                children: [
                  Container(
                    width: 120.w,
                    height: 3.h,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25.r)),
                  ),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: InputText(
                          isPassword: true,
                          controller: oldPasswordController,
                          obscureText: obscureTextOld.value,
                          onPressed: () {
                            obscureTextOld.value = !obscureTextOld.value;
                          },
                          text: 'Mật khẩu cũ'),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: InputText(
                          isPassword: true,
                          controller: newPasswordController,
                          obscureText: obscureTextNew.value,
                          onPressed: () {
                            obscureTextNew.value = !obscureTextNew.value;
                          },
                          text: 'Mật khẩu mới'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFF064789),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Thay đổi mật khẩu',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void editProfile(context) {
    resetEditProfile();
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32.r))),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: _formKeyProfile,
              child: Column(
                children: [
                  Container(
                    width: 120.w,
                    height: 3.h,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25.r)),
                  ),
                  InputText(text: 'Họ và tên', controller: nameController),
                  InputText(
                    text: 'Email',
                    controller: emailController,
                  ),
                  InputText(text: 'Số điện thoại', controller: phoneController),
                  GestureDetector(
                    onTap: () {
                      updateProfile();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFF064789),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Cập nhật',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> updateProfile() async {
    // Get.back();
    // user!.name = nameController.text;
    // user!.email = emailController.text;
    // user!.phone = phoneController.text;
    // var prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    // final response = await http.put(
    //     Uri.parse("${Constants.baseUrl}users/update"),
    //     headers: Constants.header(token!),
    //     body: jsonEncode(user!.toJson()));
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
    //   var data = UserModal.fromJson(result['data']);
    //   var prefs = await SharedPreferences.getInstance();
    //   prefs.setString('user', json.encode(data.toJson()));
    // } else {}
  }

  Future<void> signOut() async {
    var prefs = await SharedPreferences.getInstance();
    await GoogleSignIn().signOut();
    prefs.clear();
    Get.offAllNamed('/login');
    // await FirebaseAuth.instance.signOut();
  }

  void snackbarVehicle(String licensePlate) {
    Get.snackbar(
      "Xác nhận xe vào",
      "",
      snackPosition: SnackPosition.TOP,
      messageText: Text(
        licensePlate,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      colorText: Colors.white,
      borderRadius: 10,
      backgroundColor: Colors.blue,
      duration: const Duration(seconds: 3),
    );
  }
}
