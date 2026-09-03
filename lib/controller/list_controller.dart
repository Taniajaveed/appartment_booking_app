import 'package:get/get.dart';
import 'package:getx_tutorial_app/model/home_model.dart';

class ListController extends GetxController {
  List<HomeModel> listScreenItems = [
    HomeModel(
      imageName: "assets/images/listingroom1.png",
      title: "Luxury Apartment",
      price: "\$340/day",
      location: "Avenue, West Side",
      bedrooms: "4",
      bathrooms: "2",
      area: "223 sqft",
      id: "7",
    ),

    HomeModel(
      imageName: "assets/images/listingroom2.png",
      title: "Modern House",
      price: "\$450/day",
      location: "Downtown",
      bedrooms: "3",
      bathrooms: "2",
      area: "250 sqft",
      id: "8",
    ),

    HomeModel(
      imageName: "assets/images/listingroom3.png",
      title: "Elite Mansion",
      price: "\$550/day",
      location: "Green Avenue",
      bedrooms: "5",
      bathrooms: "3",
      area: "320 sqft",
      id: "9",
    ),
    HomeModel(
      imageName: "assets/images/listingroom4.png",
      title: "Crystal Residence",
      price: "\$550/day",
      location: "Green Avenue",
      bedrooms: "5",
      bathrooms: "3",
      area: "320 sqft",
      id: "10",
    ),
    HomeModel(
      imageName: "assets/images/listingroom5.png",
      title: "Sunset Villa",
      price: "\$550/day",
      location: "Green Avenue",
      bedrooms: "5",
      bathrooms: "3",
      area: "320 sqft",
      id: "7",
    ),
    HomeModel(
      imageName: "assets/images/listingroom6.png",
      title: "Beautiful Villa",
      price: "\$550/day",
      location: "Green Avenue",
      bedrooms: "5",
      bathrooms: "3",
      area: "320 sqft",
      id: "8",
    ),
  ];
  List<HomeModel> searchResults = [];
  void onInit() {
    super.onInit();

    searchResults = listScreenItems;
  }

  void searchHouses(String query) {
    if (query.isEmpty) {
      searchResults = listScreenItems;
    } else {
      searchResults = listScreenItems.where((home) {
        return home.title.toLowerCase().contains(query.toLowerCase()) ||
            home.location.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    print("Query: $query");
    print("Results: ${searchResults.length}");

    update(["searchResults"]);
  }
}
