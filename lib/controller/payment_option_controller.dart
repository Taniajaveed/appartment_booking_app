import 'package:get/get.dart';

class PaymentController extends GetxController {
  final selectedPayment = 'Cash'.obs;

  void selectPayment(String payment) {
    selectedPayment.value = payment;
  }
}
