import 'package:get/get.dart';
import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/models/actor.dart';
import 'package:movie_app/controllers/generic_controller.dart';

class ActorsController extends GetxController implements GenericController<Actor>{
  var isLoading = false.obs;
  var mainPopularActors = <Actor>[].obs;
  var favouritesList = <Actor>[].obs;
  @override
  void onInit() async {
    isLoading.value = true;
    mainPopularActors.value = (await ApiService.getPopularActors(true))!;
    isLoading.value = false;
    super.onInit();
  }

  @override
  bool isInFavouritesList(Actor actor) {
    return favouritesList.any((m) => m.id == actor.id);
  }

  @override
  void addToFavouritesList(Actor actor) {
    if (favouritesList.any((m) => m.id == actor.id)) {
      favouritesList.remove(actor);
      GenericController.snackBarRemoved();

    } else {
      favouritesList.add(actor);
      GenericController.snackBarAdded();
    }
  }
}