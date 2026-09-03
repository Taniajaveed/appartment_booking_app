import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const SearchCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap:
          /*widget.*/ onTap,
      child: Container(
        width: 100.w,
        height: 40.h,
        margin: EdgeInsets.only(right: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: isSelected
              ? const Color(0xff8D5CE2)
              : isDark
              ? const Color(0xFF211B2D) // Dark theme
              : const Color(0x1A4861E0), // Light theme
        ),
        child: Text(
          /*widget.*/ text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: isSelected
                ? Colors.white
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
