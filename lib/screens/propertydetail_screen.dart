import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/screens/book_now_screen.dart';
import 'package:getx_tutorial_app/screens/home_screen.dart';
import 'package:getx_tutorial_app/widgets/detail_box.dart';
import 'package:getx_tutorial_app/widgets/propertybox.dart';
import 'package:getx_tutorial_app/widgets/propertylist.dart';

class PropertyDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Get.off(() => HomeScreen());
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Property Detail",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            //color: Color(0xff373B42),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 25.h),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 380.w,
                        height: 300.h,
                        margin: EdgeInsets.symmetric(horizontal: 25.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xffD9D9D9),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/propertydetail.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 22.h),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 25.w, top: 23.h),
                            child: Container(
                              width: 14.w,
                              height: 20.h,
                              child: Icon(
                                Icons.location_on_rounded,
                                size: 20,
                                //color: Color(0xff8D5CE2),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 27.h),
                            child: Text(
                              "     Block Street 20, New York",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff7D7D7D),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(top: 22.h, right: 25.w),
                            child: Text(
                              "\$450.00/day",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.primary,

                                //color: Color(0xff8D5CE2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 13.h),
                      Container(
                        margin: EdgeInsets.only(left: 25.w),
                        child: Text(
                          "Grand Studio Cozy Apartment",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            //color: Color(0xff191C1F),
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.8),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 19.89,
                            height: 19.04,
                            margin: EdgeInsets.only(left: 24.w, top: 11.h),
                            child: Icon(
                              Icons.star,
                              size: 20,
                              color: Color(0xffFFE91F),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 14.h),
                            child: RichText(
                              text: TextSpan(
                                text: "   4.5", // first part
                                style: TextStyle(
                                  //color: Color(0xff191C1F),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.8),

                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '    (90 reviews)',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff4F4F4F),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22.h),
                      PropertyList(text: "Scenic Location"),
                      SizedBox(height: 13.h),
                      PropertyList(text: "Modern Amenities"),
                      SizedBox(height: 13.h),
                      PropertyList(text: "Outdoor Space"),
                      SizedBox(height: 13.h),
                      PropertyList(text: "Family Lunch, Dinner"),
                      SizedBox(height: 13.h),
                      PropertyList(text: "8 Night / Day Stay"),
                      SizedBox(height: 13.h),
                      PropertyList(text: "Free Transport"),
                      SizedBox(height: 36.h),
                      Container(
                        width: 301.w,
                        height: 92.h,
                        margin: EdgeInsets.symmetric(horizontal: 64.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PropertyBox(text: "Phone", icon: Icons.call),
                            Spacer(),
                            PropertyBox(text: "Reviews", icon: Icons.star),
                            Spacer(),
                            PropertyBox(
                              text: "Navigate",
                              icon: Icons.location_on,
                            ),
                            Spacer(),
                            PropertyBox(text: "Share", icon: Icons.share),
                          ],
                        ),
                      ),
                      SizedBox(height: 31.h),
                      Container(
                        width: 278.w,
                        height: 41.h,
                        margin: EdgeInsets.only(left: 26.w),
                        child: Text(
                          "Accomodation Details",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.8),
                            //color: Color(0xff191C1F),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          DetailBox(icon: Icons.local_taxi),
                          DetailBox(icon: Icons.favorite_outline_outlined),
                          DetailBox(icon: Icons.attractions_sharp),
                        ],
                      ),
                      SizedBox(height: 17.h),

                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => BookNowScreen(),
                            binding: BookNowBinding(),
                          );
                        },
                        child: Container(
                          width: 342,
                          height: 66,
                          margin: EdgeInsets.only(left: 29.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            //color: Color(0xff8D5CE2),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Text(
                            "Book Now",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
