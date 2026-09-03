import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/controller/bookmark_cotroller.dart';
import 'package:getx_tutorial_app/screens/home_screen.dart';
import 'package:getx_tutorial_app/screens/listingscreen.dart';
import 'package:getx_tutorial_app/screens/profile_screen.dart';
import 'package:getx_tutorial_app/widgets/custom_navbar.dart';
import 'package:getx_tutorial_app/widgets/empty_state_widget.dart';
import 'package:getx_tutorial_app/widgets/home_card.dart';

class SavedItemScreen extends StatelessWidget {
  SavedItemScreen({super.key});
  int currentIndex = 2;

  final BookmarkController controller = Get.find<BookmarkController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,

        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.off(() => HomeScreen());
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: Text(
          "Saved Items",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
      ),

      // BODY
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            // BODY HEADING
            Text(
              "Your Saved Items",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 6.h),
            // DESCRIPTION + COUNT
            Obx(
              () => Text(
                "${controller.bookmarkedItems.length} items saved for later",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),

            SizedBox(height: 20.h),
            // SAVED CARDS
            Expanded(
              child: Obx(() {
                if (controller.bookmarkedItems.isEmpty) {
                  return EmptyStateWidget(
                    icon: Icons.bookmark_border_rounded,
                    text: "No Saved Items",
                    subtext:
                        "Bookmark items you like\nand find them here later.",
                  );
                }
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.bookmarkedItems.length,
                  separatorBuilder: (context, index) => SizedBox(height: 14.h),

                  itemBuilder: (context, index) {
                    final home = controller.bookmarkedItems[index];

                    return HomeCard(home: home);
                  },
                );
              }),
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
              //Already on Saved Item Screen
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
//Get.lazyPut() ---> by this method it will not be initialized untill it is used anywhere in app/code
//permanent: true, -----> property for neve disposing controller by default it is true
//fenix: true
//tag: , ---> for different instances of same controller get.put()
//Get.putAsync(), ---> used for shared prefrences