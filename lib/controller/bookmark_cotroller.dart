import 'package:get/state_manager.dart';
import 'package:getx_tutorial_app/model/home_model.dart';

class BookmarkController extends GetxController {
  var notifications = <String>[].obs;
  var bookmarkedItems = <HomeModel>[].obs;

  List<HomeModel> previousItems = [];

  @override
  void onInit() {
    super.onInit();

    ever(bookmarkedItems, (currentItems) {
      // Find added item
      final addedItems = currentItems.where(
        (item) => !previousItems.any((oldItem) => oldItem.id == item.id),
      );

      if (addedItems.isNotEmpty) {
        final addedItem = addedItems.first;

        notifications.insert(0, '${addedItem.title} added to your bookmarks');
      }

      // Find removed item
      final removedItems = previousItems.where(
        (oldItem) =>
            !currentItems.any((currentItem) => currentItem.id == oldItem.id),
      );

      if (removedItems.isNotEmpty) {
        final removedItem = removedItems.first;

        notifications.insert(
          0,
          '${removedItem.title} removed from your bookmarks',
        );
      }

      // Save current list for next change
      previousItems = List<HomeModel>.from(currentItems);
    });
  }

  void toggleBookmark(HomeModel item) {
    if (bookmarkedItems.contains(item)) {
      bookmarkedItems.remove(item);
    } else {
      bookmarkedItems.add(item);
    }
  }

  bool isBookmarked(HomeModel item) {
    return bookmarkedItems.contains(item);
  }
}

// RxInt count = 0.obs;
// RxString name = "Tania".obs;
// RxBool isLoading = false.obs;
// RxDouble price = 100.0.obs;
