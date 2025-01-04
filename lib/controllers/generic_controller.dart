import 'package:get/get.dart';

abstract class GenericController<T> extends GetxController {
  bool isInFavouritesList(T object) { return false; }

  void addToFavouritesList(T object) {
  }

  static void snackBarRemoved(){
    Get.snackbar('Success', 'Removed from favourites',
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: const Duration(milliseconds: 1500),
        duration: const Duration(milliseconds: 1500));
  }
  static void snackBarAdded(){
    Get.snackbar('Success', 'Added to favourites',
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: const Duration(milliseconds: 1500),
        duration: const Duration(milliseconds: 1500));
  }
}