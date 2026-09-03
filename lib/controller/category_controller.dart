import 'package:get/get.dart';
import 'package:getx_tutorial_app/model/search_model.dart';

class CategoryController extends GetxController {
  var selectedIndex = 0.obs;

  List<SearchModel> categoryItems = [
    SearchModel(name: "Recommended"),
    SearchModel(name: "Top Rated"),
    SearchModel(name: "Popular"),
    SearchModel(name: "New Arrivals"),
  ].obs;

  void selectCategory(int index) {
    selectedIndex.value = index;
    print("Selected: ${selectedIndex.value}");
  }
}
