import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/profile/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF064789),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Tài khoản'),
        actions: [
          IconButton(
            onPressed: () {
              controller.dialogConfirm();
            },
            icon: Icon(Icons.logout, size: 30.sp),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 30.h,
          ),
          CircleAvatar(
            radius: 70.r,
            backgroundImage: const NetworkImage('https://picsum.photos/200'),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            controller.user!.name ?? "Chưa cập nhật",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
                color: Colors.black),
          ),
          SizedBox(
            height: 25.h,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 2,
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.white),
              onPressed: () {
                controller.editProfile(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 17.w),
                child: Text(
                  "Chỉnh sửa thông tin",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              )),
          SizedBox(
            height: 25.h,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleName(
                      'Họ và tên:',
                      controller.user!.name ?? "Chưa cập nhật",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    titleName(
                      'Email:',
                      controller.user!.email ?? "Chưa cập nhật",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // titleName('Ngày tháng năm sinh:',
                    //     controller.user!.dateOfBirth ?? "Chưa cập nhật"),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    titleName(
                      'Số điện thoại:',
                      controller.user!.phone ?? "Chưa cập nhật",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleName('Mật khẩu:', "*********"),
                        IconButton(
                            onPressed: () {
                              controller.changePassword(context);
                            },
                            icon: const Icon(Icons.edit))
                      ],
                    ),
                    // titleName('Địa chỉ:',
                    //     controller.user!.address ?? "Chưa cập nhật"),
                    SizedBox(
                      height: 60.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget titleName(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            )),
        SizedBox(
          height: 5.h,
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: const Color(0xFF064789),
          ),
        ),
      ],
    );
  }
}
