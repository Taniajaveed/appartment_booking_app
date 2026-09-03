import 'package:get/get.dart';

class ReviewController extends GetxController {
  late String paymentMethod;

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;

    paymentMethod = arguments['payment'];
  }
}
