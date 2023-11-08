import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/confirm/confirm_controller.dart';
import 'package:staff_carparking/utils/constants.dart';
import 'package:staff_carparking/utils/number_utils.dart';
import 'package:staff_carparking/utils/utils.dart';

class ConfirmPage extends GetView<ConfirmController> {
  const ConfirmPage({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF064789),
            title: Text('Xác thực thông tin xe',
                style: TextStyle(color: Colors.white, fontSize: 20.sp)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  text(
                      context,
                      'Biển số',
                      controller
                          .parkingSession.value.vehicleSnapShot!.licensePlate!),
                  SizedBox(
                    height: 20.h,
                  ),
                  text(context, 'Tên xe',
                      controller.parkingSession.value.vehicleSnapShot!.name!),
                  SizedBox(
                    height: 20.h,
                  ),
                  text(context, 'Màu sắc',
                      controller.parkingSession.value.vehicleSnapShot!.color!),
                  SizedBox(
                    height: 20.h,
                  ),
                  text(context, 'Hình ảnh', ''),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 0;
                              i <
                                  controller.parkingSession.value
                                      .vehicleSnapShot!.images!.length;
                              i++)
                            Padding(
                              padding: EdgeInsets.only(right: 25.w),
                              child: InkWell(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.network(Constants.baseUrlImage +
                                      controller.parkingSession.value
                                          .vehicleSnapShot!.images![i]),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  text(
                      context,
                      'Phí gửi xe',
                      NumberUtils.vnd(controller.parkingSession.value
                          .vehicleSnapShot!.vehicleTypePrice!)),
                  SizedBox(
                    height: 20.h,
                  ),
                  controller.parkingSession.value.checkInCapture!.isNotEmpty
                      ? Column(
                          children: [
                            text(context, 'Ảnh check in', ''),
                            Padding(
                              padding: EdgeInsets.only(right: 25.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.network(controller.parkingSession
                                    .value.checkInCapture!.first),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  text(context, 'Xác nhận ảnh', ''),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(
                    () => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 130.h,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var i = 0;
                                i < controller.images.value.length;
                                i++)
                              Padding(
                                padding: EdgeInsets.only(right: 25.w),
                                child: InkWell(
                                  onTap: () {
                                    controller.removeImageByIndex(context, i);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: Image.file(
                                      controller.imageConfirm.toList()[i],
                                    ),
                                  ),
                                ),
                              ),
                            controller.images.value.length != 1
                                ? InkWell(
                                    onTap: () {
                                      controller.pickImageFromCamera();
                                    },
                                    child: Container(
                                      width: 130.w,
                                      height: 130.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
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
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            controller.onCancel();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[900]),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: Text('Huỷ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold)),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            controller.onConfirm();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900]),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: Text('Xác thực',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold)),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  SizedBox text(BuildContext context, String title, String value) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SizedBox(
              width: 150.w,
              child: Text(
                '$title:   ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23.sp,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23.sp,
                    color: Colors.blue[900]),
              ),
            ),
          ],
        ));
  }
}
