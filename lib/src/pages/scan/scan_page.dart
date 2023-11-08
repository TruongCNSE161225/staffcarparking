import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:staff_carparking/src/pages/scan/scan_controller.dart';

class ScanPage extends GetView<ScanController> {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
                child: Container(
                    color: Colors.amber,
                    child: QRView(
                        overlay: QrScannerOverlayShape(
                          borderColor: Colors.red,
                          borderRadius: 10,
                          borderLength: 30,
                        ),
                        key: controller.qrKey,
                        onQRViewCreated: controller.onQRViewCreated))),
            // Expanded(
            //   flex: 1,
            //   child: Container(),
            // )
          ],
        ),
      ),
    );
  }
}
