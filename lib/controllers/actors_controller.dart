import 'package:get/get.dart';
import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/models/actor.dart';

class ActorsController extends GetxController {
  var isLoading = false.obs;
  var mainPopularActors = <Actor>[].obs;
  var actorsList = <Actor>[].obs;
  @override
  void onInit() async {
    isLoading.value = true;
    mainPopularActors.value = (await ApiService.getPopularActors())!;
    isLoading.value = false;
    super.onInit();
  }

  bool isInWatchList(Actor movie) {
    return actorsList.any((m) => m.id == movie.id);
  }

  void addToWatchList(Actor movie) {
    if (actorsList.any((m) => m.id == movie.id)) {
      actorsList.remove(movie);
      Get.snackbar('Success', 'removed from watch list',
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 500));
    } else {
      actorsList.add(movie);
      Get.snackbar('Success', 'added to watch list',
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 500));
    }
  }
}