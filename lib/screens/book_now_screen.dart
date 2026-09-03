import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/controller/book_now_controller.dart';
import 'package:getx_tutorial_app/model/booking_model.dart';
import 'package:getx_tutorial_app/screens/home_screen.dart';
import 'package:getx_tutorial_app/screens/payment_option_screen.dart';

class BookNowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookNowController>(() => BookNowController());
  }
}

class BookNowScreen extends GetView<BookNowController> {
  const BookNowScreen({super.key});
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
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Book Now",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            //color: Color(0xff373B42),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    // =================================================
                    // IMAGE
                    // =================================================
                    Container(
                      width: 380,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        image: DecorationImage(
                          image: AssetImage("assets/images/propertydetail.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: 21.h),
                    // =================================================
                    // START + END DATE
                    // =================================================
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => _dateField(
                              context: context,
                              label: 'Start Date',
                              value: controller.formatDate(
                                controller.startDate.value,
                              ),
                              onTap: controller.selectStartDate,
                            ),
                          ),
                        ),

                        SizedBox(width: 18.w),

                        Expanded(
                          child: Obx(
                            () => _dateField(
                              context: context,
                              label: 'End Date',
                              value: controller.formatDate(
                                controller.endDate.value,
                              ),
                              onTap: controller.selectEndDate,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 14.h),

                    // =================================================
                    // ADULTS + CHILDREN
                    // =================================================
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => _guestField(
                              context: context,
                              label: 'Adults',
                              value: controller.adults.value,
                              icon: Icons.person_outline,
                              onTap: () {
                                controller.showGuestPicker(isAdult: true);
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 18.w),
                        Expanded(
                          child: Obx(
                            () => _guestField(
                              context: context,
                              label: 'Children',
                              value: controller.children.value,
                              icon: Icons.child_care_outlined,
                              onTap: () {
                                controller.showGuestPicker(isAdult: false);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    // =================================================
                    // SPECIAL REQUEST
                    // =================================================
                    Text(
                      'Special Request',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),

                    SizedBox(height: 15.h),

                    Container(
                      width: 386.w,
                      height: 87.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(6.r),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(
                              context,
                            ).colorScheme.surface.withOpacity(0.6),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: controller.specialRequestController,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Special request....',
                          hintStyle: TextStyle(
                            fontSize: 10.sp,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.8),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 48.h),

                    // =================================================
                    // PAY NOW
                    // =================================================
                    Center(
                      child: SizedBox(
                        // width: double.infinity,
                        // height: 42.h,
                        width: 342,
                        height: 66,
                        child: ElevatedButton(
                          /*onPressed: controller.payNow,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),*/
                          onPressed: () {
                            final bookingData = BookingData(
                              propertyName: 'Woodland Apartment',
                              location: '1012 Ocean avenue, New york, USA',
                              image: "assets/images/propertydetail.png",
                              rating: 4.9,
                              startDate: controller.startDate.value!,
                              endDate: controller.endDate.value!,
                              adults: controller.adults.value,
                              children: controller.children.value,
                              amount: 340,
                              tax: 5,
                            );

                            Get.to(
                              () => PaymentOptionScreen(),
                              arguments: bookingData,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                          child: Text(
                            'Pay Now',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =============================================================
  // DATE FIELD
  // =============================================================

  Widget _dateField({
    required BuildContext context,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    final bool isEmpty = value == 'mm/dd/yyyy';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 7.h),
        _fieldContainer(
          context: context,
          onTap: onTap,
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 20.sp,
                color: theme.colorScheme.onSurface.withOpacity(.45),
              ),
              SizedBox(width: 10.w),
              Text(
                value,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: isEmpty
                      ? theme.colorScheme.onSurface.withOpacity(.35)
                      : theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =============================================================
  // GUEST FIELD
  // =============================================================

  Widget _guestField({
    required BuildContext context,
    required String label,
    required int value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 7.h),
        _fieldContainer(
          context: context,
          onTap: onTap,
          child: Row(
            children: [
              Icon(
                icon,
                size: 20.sp,
                color: theme.colorScheme.onSurface.withOpacity(.45),
              ),
              SizedBox(width: 10.w),
              Text(
                '$value',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: theme.colorScheme.onSurface.withOpacity(.55),
                ),
              ),
              const Spacer(),
              Icon(
                Icons.keyboard_arrow_down,
                size: 20.sp,
                color: theme.colorScheme.onSurface.withOpacity(.35),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =============================================================
  // COMMON FIELD CONTAINER
  // =============================================================

  Widget _fieldContainer({
    required BuildContext context,
    required Widget child,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 178.w,
        height: 51.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              //color: theme.shadowColor.withOpacity(.06),
              color: Theme.of(context).colorScheme.surface,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
