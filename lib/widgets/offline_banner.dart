/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/controller/network_controller.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final networkController = Get.find<NetWorkController>();

    // return Scaffold(
    //   body:
    return Obx(() {
      if (networkController.connectionStatus.value ==
          NetWorkController.noConnection) {
        return Container(
          height: 32.w,
          width: double.infinity,
          //padding: const EdgeInsets.all(10),
          color: Colors.grey,
          child: const Text(
            "⚠ No Internet Connection",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      }
      return const SizedBox.shrink();
    });
    //);
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/controller/network_controller.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final networkController = Get.find<NetWorkController>();

    return SizedBox(
      child: Obx(() {
        final isOffline =
            networkController.connectionStatus.value ==
            NetWorkController.noConnection;

        if (!isOffline) {
          return const SizedBox.shrink();
        }

        return Container(
          width: double.infinity,
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off_rounded, color: Colors.white, size: 17.sp),
              SizedBox(width: 7.w),
              Text(
                "No Internet Connection",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
