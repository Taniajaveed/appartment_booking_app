import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookNowController extends GetxController {
  // ----------------------------------------------------------
  // DATE
  // ----------------------------------------------------------

  final Rxn<DateTime> startDate = Rxn<DateTime>();
  final Rxn<DateTime> endDate = Rxn<DateTime>();

  // ----------------------------------------------------------
  // GUESTS
  // ----------------------------------------------------------

  final RxInt adults = 2.obs;
  final RxInt children = 3.obs;

  // ----------------------------------------------------------
  // SPECIAL REQUEST
  // ----------------------------------------------------------

  final TextEditingController specialRequestController =
      TextEditingController();

  @override
  void onClose() {
    specialRequestController.dispose();
    super.onClose();
  }

  // ----------------------------------------------------------
  // FORMAT DATE
  // ----------------------------------------------------------

  String formatDate(DateTime? date) {
    if (date == null) {
      return 'mm/dd/yyyy';
    }

    return '${date.month.toString().padLeft(2, '0')}/'
        '${date.day.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  // ----------------------------------------------------------
  // SELECT DATE
  // ----------------------------------------------------------

  Future<void> selectStartDate() async {
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: startDate.value ?? now,
      firstDate: now,
      lastDate: DateTime(2100),
    );

    if (picked == null) return;

    startDate.value = picked;

    // If old end date is before new start date,
    // remove it.
    if (endDate.value != null && endDate.value!.isBefore(picked)) {
      endDate.value = null;
    }
  }

  Future<void> selectEndDate() async {
    final firstDate = startDate.value ?? DateTime.now();

    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: endDate.value ?? firstDate,
      firstDate: firstDate,
      lastDate: DateTime(2100),
    );

    if (picked == null) return;

    endDate.value = picked;
  }

  // ----------------------------------------------------------
  // GUEST PICKER
  // ----------------------------------------------------------

  void showGuestPicker({required bool isAdult}) {
    final RxInt temporaryValue = (isAdult ? adults.value : children.value).obs;

    Get.bottomSheet(
      SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.onSurface.withOpacity(.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  isAdult ? 'Adults' : 'Children',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _counterButton(
                      icon: Icons.remove,
                      onTap: () {
                        if (temporaryValue.value > 0) {
                          temporaryValue.value--;
                        }
                      },
                    ),

                    const SizedBox(width: 28),
                    Text(
                      '${temporaryValue.value}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Get.theme.colorScheme.onSurface,
                      ),
                    ),

                    const SizedBox(width: 28),
                    _counterButton(
                      icon: Icons.add,
                      onTap: () {
                        temporaryValue.value++;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isAdult) {
                        adults.value = temporaryValue.value;
                      } else {
                        children.value = temporaryValue.value;
                      }

                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8D57E8),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _counterButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          color: Color(0xFF8D57E8),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  // ----------------------------------------------------------
  // PAY NOW
  // ----------------------------------------------------------

  void payNow() {
    if (startDate.value == null) {
      Get.snackbar(
        'Start Date',
        'Please select your start date.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (endDate.value == null) {
      Get.snackbar(
        'End Date',
        'Please select your end date.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.snackbar(
      'Booking',
      'Proceeding to payment...',
      snackPosition: SnackPosition.BOTTOM,
    );

    // Navigate to payment screen here:
    // Get.toNamed(AppRoutes.payment);
  }
}
