import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyList extends StatelessWidget {
  final String text;
  PropertyList({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 237.w,
      height: 18.h,
      margin: EdgeInsets.only(left: 25.w),
      child: Row(
        children: [
          Container(
            width: 18.w,
            height: 18.h,
            child: Icon(
              Icons.check_circle_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
            // child: Image(
            //  image: AssetImage("assets/images/circletick.png"),
            // ),
          ),
          SizedBox(width: 13.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
