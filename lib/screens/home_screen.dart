import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/controller/home_controllerR.dart';
import 'package:getx_tutorial_app/controller/home_controller.dart';
import 'package:getx_tutorial_app/controller/category_controller.dart';
import 'package:getx_tutorial_app/screens/listingscreen.dart';
import 'package:getx_tutorial_app/screens/profile_screen.dart';
import 'package:getx_tutorial_app/screens/saved_item_screen.dart';
import 'package:getx_tutorial_app/widgets/custom_drawer.dart';
import 'package:getx_tutorial_app/widgets/custom_navbar.dart';
import 'package:getx_tutorial_app/widgets/home_card.dart';
import 'package:getx_tutorial_app/widgets/lorem_house_card.dart';
import 'package:getx_tutorial_app/widgets/search_card.dart';

class HomeScreen extends StatelessWidget {
  final CategoryController controller = Get.put(CategoryController());
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: theme.scaffoldBackgroundColor),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: true,

      endDrawer: null,

      body: DoubleBack(
        message: '',
        waitForSecondBackPress: 2,
        onFirstBackPress: () {
          debugPrint('🔥 DOUBLE BACK FIRST PRESS');
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Press back again to exit'),
                duration: Duration(seconds: 2),
              ),
            );
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Let’s Find your",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.onSurface,
                              //color: Color(0xff7D7D7D),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Favorite Home",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              //color: Color(0xff191C1F),
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      width: 57.w,
                      height: 57.h,
                      margin: EdgeInsets.only(right: 20.w, top: 17.88.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.5.r),
                        //color: Color(0xffC4C4C4),
                        color: Theme.of(context).colorScheme.onSurface,

                        image: DecorationImage(
                          image: AssetImage("assets/images/homeava.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36.h),
                Container(
                  width: 390.w,
                  height: 52.h,
                  child: Row(
                    children: [
                      Container(
                        width: 328.w,
                        height: 51.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(
                            0xffDDDDDDD,
                          ).withOpacity(0.10), // or your desired background
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              //color: Color(0xff7D7D7D),
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            hintText: "Search Properties....",
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7D7D7D),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 52.h,
                        width: 52.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Icon(
                          Icons.tune_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 36.h),
                Obx(() {
                  print("OBX REBUILT: ${controller.selectedIndex.value}");
                  return SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categoryItems.length,
                      itemBuilder: (context, index) {
                        return SearchCard(
                          text: controller.categoryItems[index].name,
                          isSelected: controller.selectedIndex.value == index,
                          onTap: () {
                            print("CLICKED ITEM = $index");
                            controller.selectCategory(index);
                          },
                        );
                      },
                    ),
                  );
                }),
                SizedBox(height: 36.h),
                Container(
                  height: 246.w, //243
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeCardsR.length,
                    itemBuilder: (context, index) {
                      return LoremHouseCard(home: homeCardsR[index]);
                    },
                  ),
                ),
                SizedBox(height: 27.h),
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Places Nearest You",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          //color: Color(0xff0F172A),
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Text(
                        "See More",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          //color: Color(0xff8D5CE2),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 3.r, right: 19.r),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19.h),
                Expanded(
                  child: Container(
                    // width: 330,
                    height: 190,
                    child: ListView.builder(
                      itemCount: homeCards.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          //
                          child: HomeCard(home: homeCards[index]),
                          //home: HomeModel
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              // Already on Home, do nothing
              break;
            case 1:
              Get.to(() => ListingScreen());
              break;
            case 2:
              Get.to(() => SavedItemScreen());
              break;
            case 3:
              Get.to(() => ProfileScreen());
              break;
          }
        },
      ),
    );
  }
}
