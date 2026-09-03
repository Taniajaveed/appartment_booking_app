import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_tutorial_app/controller/bookmark_cotroller.dart';
import 'package:getx_tutorial_app/model/home_model.dart';

class HomeCard extends StatelessWidget {
  final HomeModel home;

  HomeCard({super.key, required this.home});
  final BookmarkController bookmarkController = Get.put(
    BookmarkController(),
  ); // this statement will initialize controller and create the object of BookmarkController

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      //width: 500.w, //391
      width: double.infinity,
      height: 101.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: Theme.of(context).colorScheme.surface,
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
                  ).colorScheme.surface.withOpacity(0.5),
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxis,
        children: [
          Container(
            width: 89.w,
            height: 89.h,
            margin: EdgeInsets.only(
              top: 6.h,
              left: 6.w,
              bottom: 6.h,
              right: 14.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: const Color(0xffC4C4C4),
              image: DecorationImage(
                image: AssetImage(home.imageName),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text(
                  home.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    //color: const Color(0xff2F2F2F),
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),

              // PRICE
              Text(
                home.price,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  //color: const Color(0xff8D5CE2),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: 9.h),
              // LOCATION
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 14.w,
                    color: const Color(0xff7D7D7D),
                  ),
                  SizedBox(width: 4.36.w),
                  Text(
                    home.location,
                    style: TextStyle(
                      color: const Color(0xff7D7D7D),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 4.h),

              // DETAILS
              Container(
                width: 146.92.w,
                height: 19.38.h,
                child: Row(
                  children: [
                    Icon(
                      Icons.bed_outlined,

                      color: const Color(0xff7D7D7D),

                      size: 15,
                    ),
                    Text(
                      " ${home.bedrooms}",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff7D7D7D),
                      ),
                    ),

                    const Spacer(),
                    Icon(
                      Icons.bathtub_outlined,
                      color: const Color(0xff7D7D7D),

                      size: 15,
                    ),
                    Text(
                      " ${home.bathrooms}",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff7D7D7D),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.square_outlined,
                      color: const Color(0xff7D7D7D),

                      size: 15,
                    ),
                    Text(
                      " ${home.area}",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff7D7D7D),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //Icon(Icons.bookmark_outlined),
          Spacer(),
          Container(
            width: 32.w,
            height: 29.h, //
            //alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.65.r),
              //color: const Color(0x1A4861E0),
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF211B2D) // Dark theme
                  : const Color(0x1A4861E0), // Light theme
            ),
            child: Obx(
              () => IconButton(
                onPressed: () {
                  final isSaved = bookmarkController.isBookmarked(home);
                  bookmarkController.toggleBookmark(home);
                  if (isSaved) {
                    Get.snackbar("Removed", "Item removed successfully");
                  } else {
                    Get.snackbar("Saved", "Item saved successfully");
                  }
                },
                icon: Icon(
                  bookmarkController.isBookmarked(home)
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                ),
                //Icon(Icons.bookmark_border),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
