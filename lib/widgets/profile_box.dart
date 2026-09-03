import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class rContain extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final IconData icon;

  const rContain({required this.text, this.onTap, required this.icon});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 375.w,
        width: double.infinity,
        height: 47.07.h, //27.07
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isDark
              ? const Color(0xFF1B1F2A) // dark theme
              : const Color(0x1A4861E0), // light theme
        ),
        child: Row(
          children: [
            Container(
              height: 27.07.h,
              width: 21.51.w,
              alignment: Alignment.center,
              child: Icon(icon),
            ),
            SizedBox(width: 14.09.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                //color: Color(0xff3C3C3C),
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
            Spacer(),
            Container(
              //width: 9.75.w,
              height: 17.77,
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_forward_sharp,
                //color: Color(0xff1F2327)
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
