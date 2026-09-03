import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/controller/review_summary_controller.dart';
import 'package:getx_tutorial_app/model/booking_model.dart';

class ReviewSummaryScreen extends StatelessWidget {
  ReviewSummaryScreen({super.key});

  final ReviewController controller = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final arguments = Get.arguments;
    final BookingData booking = arguments['booking'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20.sp,
            color: theme.colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Review Summary',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 55.5.h),

              /// PROPERTY
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      booking.image,
                      width: 91.w,
                      height: 89.h,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 10.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18.sp,
                              color: Color(0xffEEA651),
                            ),

                            SizedBox(width: 3.w),

                            Text(
                              booking.rating.toString(),
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5.h),

                        Text(
                          booking.propertyName,
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 18.sp,
                              color: theme.colorScheme.primary,
                            ),

                            SizedBox(width: 2.w),

                            Expanded(
                              child: Text(
                                booking.location,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          '\$${booking.amount.toStringAsFixed(2)}/month',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 39.h),

              /// BOOKING DATE
              _infoRow(context, 'Booking Date', _formatDate(booking.startDate)),

              _infoRow(context, 'Check In', _formatDate(booking.startDate)),

              _infoRow(context, 'Check out', _formatDate(booking.endDate)),

              _infoRow(context, 'Adult', booking.adults.toString()),

              _infoRow(context, 'Children', booking.children.toString()),

              SizedBox(height: 28.h),

              /// AMOUNT
              _infoRow(
                context,
                'Amount',
                '\$${booking.amount.toStringAsFixed(2)}',
              ),

              _infoRow(context, 'Tax', '\$${booking.tax.toStringAsFixed(2)}'),

              SizedBox(height: 18.h),

              _infoRow(
                context,
                'Total',
                '\$${booking.total.toStringAsFixed(2)}',
                isBold: true,
              ),

              SizedBox(height: 25.h),

              /// PAYMENT METHOD
              Row(
                children: [
                  Icon(
                    Icons.payments_outlined,
                    size: 20.sp,
                    color: theme.colorScheme.primary,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    controller.paymentMethod,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              /// CONTINUE
              Padding(
                padding: EdgeInsets.only(left: 18.w, right: 18.w, bottom: 15.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Final booking API call
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(
    BuildContext context,
    String title,
    String value, {
    bool isBold = false,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 11.h),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.75),
            ),
          ),

          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${_month(date.month)} ${date.day}, ${date.year}';
  }

  String _month(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return months[month];
  }
}
