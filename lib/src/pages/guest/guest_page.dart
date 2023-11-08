import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/guest/guest_controller.dart';
import 'package:staff_carparking/src/widgets/inputText.dart';

class GuestPage extends GetView<GuestController> {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue[900],
            elevation: 0,
            title: const Text('Khách vãng lai',
                style: TextStyle(color: Colors.white))),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                InputText(
                    controller: controller.licensePlateController,
                    text: 'Biển số'),
                SizedBox(
                  height: 10.h,
                ),
                InputText(controller: controller.nameController, text: 'Tên xe'),
                SizedBox(
                  height: 10.h,
                ),
                InputText(
                    controller: controller.colorController, text: 'Màu sắc'),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Hình ảnh:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(
                  () => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 130.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 0; i < controller.images.length; i++)
                            Padding(
                              padding: EdgeInsets.only(right: 25.w),
                              child: InkWell(
                                onTap: () {
                                  controller.removeImageByIndex(context, i);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.file(
                                    controller.images.values.toList()[i],
                                  ),
                                ),
                              ),
                            ),
                          controller.images.length != 2
                              ? InkWell(
                                  onTap: () {
                                    controller.pickImageFromCamera();
                                  },
                                  child: Container(
                                    width: 130.w,
                                    height: 130.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 40.sp,
                                      color: Colors.blue[900],
                                    ),
                                  ))
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 90.h,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900]),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: Text('Xác thực',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold)),
                    )),
              ],
            ),
          ),
        ));
  }
}
