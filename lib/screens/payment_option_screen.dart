import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/controller/payment_option_controller.dart';
import 'package:getx_tutorial_app/model/booking_model.dart';
import 'package:getx_tutorial_app/screens/review_summary_screen.dart';

class PaymentOptionScreen extends StatelessWidget {
  PaymentOptionScreen({super.key});
  final PaymentController controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 18.sp,
            color: theme.colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Payment Methods',
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
              SizedBox(height: 61.h),

              /// CASH
              _sectionTitle(context, 'Cash'),

              SizedBox(height: 10.h),

              _paymentOption(
                context: context,
                title: 'Cash',
                icon: Icons.payments_outlined,
                value: 'Cash',
              ),

              SizedBox(height: 25.h),

              /// CARD
              _sectionTitle(context, 'Credit & Debit Card'),

              SizedBox(height: 10.h),

              _paymentOption(
                context: context,
                title: 'Add New Card',
                icon: Icons.credit_card,
                value: 'Card',
              ),

              SizedBox(height: 25.h),

              /// MORE OPTIONS
              _sectionTitle(context, 'More Payment Options'),

              SizedBox(height: 10.h),

              _paymentOption(
                context: context,
                title: 'Paypal',
                icon: Icons.paypal,
                value: 'Paypal',
              ),

              _paymentOption(
                context: context,
                title: 'Apple Pay',
                icon: Icons.apple,
                value: 'Apple Pay',
              ),
              const Spacer(),
              SizedBox(
                width: 342.w,
                height: 66.h,
                child: ElevatedButton(
                  onPressed: () {
                    final bookingData = Get.arguments as BookingData;

                    Get.to(
                      () => ReviewSummaryScreen(),
                      arguments: {
                        'booking': bookingData,
                        'payment': controller.selectedPayment.value,
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
              // ),
              SizedBox(height: 34.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _paymentOption({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String value,
  }) {
    //final theme = Theme.of(context);

    return Obx(() {
      final isSelected = controller.selectedPayment.value == value;

      return InkWell(
        onTap: () {
          controller.selectPayment(value);
        },
        child: Container(
          height: 43.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20.sp,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.8),
                  ),
                ),
              ),

              Container(
                width: 14.w,
                height: 14.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.9),
                    width: 1,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 6.w,
                          height: 6.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.9),
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      );
    });
  }
}
