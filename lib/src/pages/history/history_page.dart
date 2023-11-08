import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:staff_carparking/src/pages/history/history_controller.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: const Text(
          'Lịch sử gửi xe',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            color: index % 2 == 0 ? Colors.white : Colors.grey[200],
            child: Row(
              children: [
                Icon(
                  Icons.receipt_rounded,
                  // Icons.monetization_on_rounded,
                  color: Colors.blue[900],
                  size: 60.sp,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thanh  toán phí gửi xe',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '17:30 - 1/1/2023',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 18.sp),
                          ),
                          Text(
                            '+1.000đ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20.sp),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
