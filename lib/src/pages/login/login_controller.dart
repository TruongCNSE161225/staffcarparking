import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:staff_carparking/src/modals/user_modal.dart';
import 'package:staff_carparking/utils/constants.dart';
import 'package:staff_carparking/utils/utils.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<bool> obscureText = true.obs;

  void login() {
    Get.offAllNamed('/main');
  }

  Future<void> signInWithGoogle() async {
    var prefs = await SharedPreferences.getInstance();
    await GoogleSignIn().signOut();
    prefs.clear();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    final user = FirebaseAuth.instance.currentUser;
    final token = await user!.getIdToken();
    prefs.setString('token', "$token");
    loginApi(token!);
  }

  Future<void> loginApi(String token) async {
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}users/details"),
      headers: Constants.header(token),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      var data = UserModal.fromJson(result['data']);
      var prefs = await SharedPreferences.getInstance();
      prefs.setString('user', json.encode(data.toJson()));
      return Get.toNamed('/main');
    }
  }

  Future<void> loginEmailPassword() async {
    var email = userNameController.text;
    var password = passwordController.text;

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.showDialogPopupError(
            Get.context!, 'Tài khoản không tồn tại');
      } else if (e.code == 'wrong-password') {
        Utils.showDialogPopupError(Get.context!, 'Mật khẩu không đúng');
      }
    }
  }
}
