import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/login/login_controller.dart';
import 'package:staff_carparking/src/widgets/inputText.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF0575E6),
                Color(0xFF021B79),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: EdgeInsets.all(60.r),
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Chào mừng bạn đến với chúng tôi",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    )),
                child: Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: InputText(
                              controller: controller.userNameController,
                              text: 'Tên đăng nhập'),
                        ),
                        Obx(
                          () => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: InputText(
                                isPassword: true,
                                controller: controller.passwordController,
                                obscureText: controller.obscureText.value,
                                onPressed: () {
                                  controller.obscureText.value =
                                      !controller.obscureText.value;
                                },
                                text: 'Mật khẩu'),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              // controller.login();
                              controller.signInWithGoogle();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            child: Padding(
                              padding: EdgeInsets.all(15.r),
                              child: Text(
                                'Đăng nhập',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
