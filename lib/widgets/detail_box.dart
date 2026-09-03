import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBox extends StatelessWidget {
  final IconData icon;
  const DetailBox({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106.w,
      height: 63.h,
      margin: EdgeInsets.only(left: 26.w),
      child: Material(
        elevation: 4,
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.r),
        shadowColor: Theme.of(context).shadowColor,
        child: Center(
          child: Icon(
            //Icons.favorite_outline,
            icon,
            size: 28.sp,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}
