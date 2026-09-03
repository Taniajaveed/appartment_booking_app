import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_tutorial_app/model/home_model.dart';

class LoremHouseCard extends StatelessWidget {
  final HomeModel home;

  const LoremHouseCard({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 223.w,
      height: 246.h, //242
      margin: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,

        borderRadius: BorderRadius.circular(15.r),
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
          // IMAGE + DETAILS
          Stack(
            children: [
              Container(
                width: 223.w,
                height: 155.h, //155
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: const Color(0xffC4C4C4),
                  image: DecorationImage(
                    image: AssetImage(home.imageName),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // BED / BATH / AREA
              Positioned(
                top: 117.h,
                left: 10.w,
                child: Row(
                  children: [
                    // BEDROOM
                    _InfoContainer(
                      width: 53.45.w,
                      icon: Icons.bed_rounded,
                      text: home.bedrooms,
                    ),
                    SizedBox(width: 4.6.w),
                    // BATHROOM
                    _InfoContainer(
                      width: 44.85.w,
                      icon: Icons.bathtub_outlined,
                      text: home.bathrooms,
                    ),
                    SizedBox(width: 4.6.w),
                    // AREA
                    _InfoContainer(
                      width: 81.71.w,
                      icon: Icons.crop_square_outlined,
                      text: home.area,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h), //1
          // TITLE
          Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Text(
              home.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.9),
              ),
            ),
          ),

          // PRICE
          Container(
            margin: EdgeInsets.only(top: 3.h, left: 10.w),
            child: Text(
              home.price,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

          // LOCATION + BOOKMARK
          Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Row(
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

                const Spacer(),

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

                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
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
      height: 26.86.h,
      decoration: BoxDecoration(
        //color: const Color(0xffFFFFFF),
        color: Theme.of(context).colorScheme.surface,

        borderRadius: BorderRadius.circular(30.7.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image.asset(icon),
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
          SizedBox(width: 4.6.w),

          Text(
            text,
            style: TextStyle(
              fontSize: 10.73.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              //color: const Color(0xff212121),
            ),
          ),
        ],
      ),
    );
  }
}
