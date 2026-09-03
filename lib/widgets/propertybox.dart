import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyBox extends StatelessWidget {
  final String text;
  final IconData icon;
  PropertyBox({required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w,
      height: 92.h, //89
      child: Column(
        children: [
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(130.r),
              color: Color(0x1A4861E0),
            ),
            child: Container(
              width: 24.w,
              height: 24.h,
              child: Icon(icon, color: Theme.of(context).colorScheme.primary),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 7.h, bottom: 4.h),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),

                //color: Color(0xff191C1F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
