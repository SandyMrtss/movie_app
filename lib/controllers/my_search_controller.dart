import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/main.dart';

class MySearchController extends GetxController {
  TextEditingController searchTextController = TextEditingController();
  var searchText = ''.obs;
  var results = <Object>[].obs;
  var isLoading = false.obs;
  MediaType currentObject = MediaType.Movies;
  bool hasSearched = false;

  void search(String query, MediaType mediaType) async {
    isLoading.value = true;
    hasSearched = true;
    currentObject = mediaType;
    switch(mediaType){
      case(MediaType.Movies):
        results.value = (await ApiService.getSearchedMovies(query)) ?? [];
      case MediaType.TVSeries:
        results.value = (await ApiService.getSearchedTvSeries(query)) ?? [];
      case MediaType.Actors:
        results.value = (await ApiService.getSearchedActors(query)) ?? [];
    }
    isLoading.value = false;
  }

  void clearSelection(){
    isLoading = false.obs;
    searchText = ''.obs;
    hasSearched = false;
    results.clear();
  }
}