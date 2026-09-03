//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/model/home_model.dart';
import 'package:getx_tutorial_app/screens/propertydetail_screen.dart';

class ListingScreenCard extends StatelessWidget {
  final HomeModel home;

  ListingScreenCard({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 187.03.w,
      height: 204.97.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.58.r),
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 12,
                  spreadRadius: 0,
                ),
              ]
            : [
                BoxShadow(
                  color: /*const Color(0xffFFFFFF)*/ Theme.of(
                    context,
                  ).colorScheme.surface.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and icons
          Stack(
            children: [
              GestureDetector(
                onTap: () => Get.to(PropertyDetail()),
                child: Container(
                  width: 187.03.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.58.r),
                    color: const Color(0xffC4C4C4),
                    image: DecorationImage(
                      image: AssetImage(home.imageName),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 98.13.h,
                left: 8.29.w,
                child: Row(
                  children: [
                    _InfoContainer(
                      width: 50.45.w,
                      icon: Icons.bed_rounded,
                      text: home.bedrooms,
                    ),
                    SizedBox(width: 3.86.w),
                    _InfoContainer(
                      width: 40.85.w,
                      icon: Icons.bathtub_outlined,
                      text: home.bathrooms,
                    ),
                    SizedBox(width: 3.86.w),
                    _InfoContainer(
                      width: 72.71.w, //81.71
                      icon: Icons.crop_square_outlined,
                      text: home.area,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h), //9.23
          Container(
            margin: EdgeInsets.only(left: 8.39.w),
            child: Text(
              home.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                //color: Color(0xff2F2F2F),
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.9),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 8.29.w),
            child: Text(
              home.price,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                //color: Color(0xff8D5CE2),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8.29.w),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 12.66.r,
                  color: Color(0xff7D7D7D),
                ),
                SizedBox(width: 3.65.w),
                Text(
                  home.location,
                  style: TextStyle(
                    color: Color(0xff7D7D7D),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Container(
                  width: 26.84.w,
                  height: 26.84.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.25.r),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF211B2D) // Dark theme
                        : const Color(0x1A4861E0), // Light theme
                  ),
                  child: Icon(Icons.bookmark_border, size: 16.r),
                ),
                SizedBox(width: 9.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoContainer extends StatelessWidget {
  final double width;
  final IconData icon;
  final String text;

  const _InfoContainer({
    required this.width,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 24.86.h,
      decoration: BoxDecoration(
        //color: const Color(0xffFFFFFF),
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(30.7.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
          SizedBox(width: 4.6.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 10.73.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
