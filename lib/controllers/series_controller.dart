import 'package:get/get.dart';

import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/models/tv_series.dart';
import 'package:movie_app/controllers/generic_controller.dart';


class SeriesController extends GetxController implements GenericController<TvSeries>{
  var isLoading = false.obs;
  var mainTopRatedTvSeries = <TvSeries>[].obs;
  var favouritesList = <TvSeries>[].obs;
  @override
  void onInit() async {
    isLoading.value = true;
    mainTopRatedTvSeries.value = (await ApiService.getPopularTvSeries(true))!;
    isLoading.value = false;
    super.onInit();
  }

  @override
  bool isInFavouritesList(TvSeries tvSeries) {
    return favouritesList.any((t) => t.id == tvSeries.id);
  }

  @override
  void addToFavouritesList(TvSeries tvSeries) {
    if (favouritesList.any((t) => t.id == tvSeries.id)) {
      favouritesList.remove(tvSeries);
      GenericController.snackBarRemoved();
    } else {
      favouritesList.add(tvSeries);
      GenericController.snackBarAdded();
    }
  }
}