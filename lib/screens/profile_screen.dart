import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/screens/home_screen.dart';
import 'package:getx_tutorial_app/screens/listingscreen.dart';
import 'package:getx_tutorial_app/screens/saved_item_screen.dart';
import 'package:getx_tutorial_app/widgets/custom_navbar.dart';
import 'package:getx_tutorial_app/widgets/profile_box.dart';

class ProfileScreen extends StatelessWidget {
  int currentIndex = 3;
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).colorScheme.primary,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 700.h, //806 //700
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.r),
                  topRight: Radius.circular(45.r),
                ),
              ),
              //child: Container(width: 50, height: 50, color: Colors.pink),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(top: 40, left: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.surface.withOpacity(0.5),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.off(() => HomeScreen());
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(
                      context,
                    ).colorScheme.surface.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100.h), //100
              child: Column(
                children: [
                  Container(
                    width: 95.w,
                    height: 95.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(47.5.r),
                      image: DecorationImage(
                        image: AssetImage("assets/images/homeava.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Stefani Wong",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    "istefani@example.com",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.5),
                      // color: Color(0xff696969),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 27.w,
                right: 27.w,
                top: 290.h,
              ), //100
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  rContain(
                    text: "Account Settings",
                    icon: Icons.settings,
                    onTap: () {},
                  ),
                  SizedBox(height: 15.h),
                  rContain(
                    text: "Emergency Contacts",
                    icon: Icons.emergency,
                    onTap: () {},
                  ),
                  SizedBox(height: 15.h), //30
                  rContain(text: "Notifications", icon: Icons.notifications),
                  SizedBox(height: 15.h),
                  rContain(text: "Language", icon: Icons.language),
                  SizedBox(height: 15.h),
                  rContain(text: "Privacy", icon: Icons.lock),
                  SizedBox(height: 15.h),
                  rContain(
                    text: "Security",
                    onTap: () {},
                    icon: Icons.security,
                  ),
                  SizedBox(height: 15.h),
                  rContain(
                    text: "Auto safety Setting",
                    onTap: () {},
                    icon: Icons.safety_check,
                  ),
                  SizedBox(height: 29.11.h),
                  GestureDetector(
                    onTap: () {
                      //Get.defaultDialog();
                      Get.defaultDialog(
                        title: "Log Out",
                        titleStyle: TextStyle(fontSize: 14),
                        middleText: "Do you Want to logout?",
                        //middleTextStyle: ,
                        backgroundColor: Color.fromARGB(255, 148, 146, 146),
                        radius: 80,
                        //content: ,it overrides the value of middle text
                        textCancel: "Cancel",
                        cancelTextColor: Colors.black,
                        textConfirm: "Confirm",
                        confirmTextColor: Colors.black,
                        onCancel: () {
                          Get.back();
                        },
                        onConfirm: () {},
                        //cancel: ,
                        //confirm: ,
                        //actions: [add button like action-1, action-2 etc],
                        barrierDismissible: false,
                      );
                    },
                    child: Container(
                      width: 232.w,
                      height: 66.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        //color: Color(0xffE7506B),
                        color: Color(0xff8D5CE2),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.to(() => HomeScreen());
              break;
            case 1:
              Get.to(() => ListingScreen());
              break;

            case 2:
              Get.to(() => SavedItemScreen());
              break;

            case 3:
              // already on profile screen
              break;
          }
        },
      ),
    );
  }
}
