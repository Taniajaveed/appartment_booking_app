import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/controller/list_controller.dart';
import 'package:getx_tutorial_app/screens/home_screen.dart';
import 'package:getx_tutorial_app/screens/notification_screen.dart';
import 'package:getx_tutorial_app/screens/profile_screen.dart';
import 'package:getx_tutorial_app/screens/saved_item_screen.dart';
import 'package:getx_tutorial_app/widgets/custom_navbar.dart';
import 'package:getx_tutorial_app/widgets/listing_screen_card.dart';

class ListingScreen extends StatelessWidget {
  final ListController controller = Get.put(ListController());
  int currentIndex = 1;
  ListingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //Get.put(ListController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Get.off(() => HomeScreen());
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        actions: [
          Container(
            width: 40.w,
            height: 40.h,
            margin: EdgeInsets.only(right: 19.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              //color: Color(0xffF7F8F8),
              color: Theme.of(context).colorScheme.surface.withOpacity(1),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(NotificationScreen());
                  },
                  icon: Icon(Icons.notifications_outlined),
                  color: Theme.of(context).colorScheme.onSurface,
                ),

                Container(
                  width: 5.w,
                  height: 5.h,
                  margin: EdgeInsets.only(right: 5.w, top: 6.h),
                  decoration: BoxDecoration(
                    color: Color(0xffFF0000),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(margin: EdgeInsets.only(top: 25.88.h)), //35.88
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Property Listings",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      width: 57.w,
                      height: 57.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.5.r),
                        color: Color(0xffC4C4C4),
                        image: DecorationImage(
                          image: AssetImage("assets/images/homeava.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
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
                          color: Color(0xffDDDDDDD).withOpacity(0.10),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            controller.searchHouses(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search_rounded,
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
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 37.h),
                Expanded(
                  child: GetBuilder<ListController>(
                    id: "searchResults",
                    builder: (controller) {
                      return GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: controller.searchResults.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 14.03.h,
                          childAspectRatio: 187.03 / 206.97,
                        ),
                        itemBuilder: (context, index) {
                          return ListingScreenCard(
                            home: controller.searchResults[index],
                          );
                        },
                      );
                    },
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
              Get.to(() => HomeScreen());
              break;
            case 1:
              //Alraedy on screen ListingScreen
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
