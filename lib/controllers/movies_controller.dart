import 'package:get/get.dart';

import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/controllers/generic_controller.dart';
import 'package:movie_app/models/movie.dart';

class MoviesController extends GetxController implements GenericController<Movie>{
  var isLoading = false.obs;
  var mainTopRatedMovies = <Movie>[].obs;
  var favouritesList = <Movie>[].obs;
  @override
  void onInit() async {
    isLoading.value = true;
    mainTopRatedMovies.value = (await ApiService.getPopularMovies(true))!;
    isLoading.value = false;
    super.onInit();
  }

  @override
  bool isInFavouritesList(Movie movie) {
    return favouritesList.any((m) => m.id == movie.id);
  }

  @override
  void addToFavouritesList(Movie movie) {
    if (favouritesList.any((m) => m.id == movie.id)) {
      favouritesList.remove(movie);
      GenericController.snackBarRemoved();
    } else {
      favouritesList.add(movie);
      GenericController.snackBarAdded();
    }
  }

}