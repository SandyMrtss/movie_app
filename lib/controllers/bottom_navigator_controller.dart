import 'package:get/get.dart';

import 'package:movie_app/screens/home_screen/home_screen_actors.dart';
import 'package:movie_app/screens/home_screen/home_screen_movies.dart';
import 'package:movie_app/screens/home_screen/home_screen_series.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/screens/favourites_list_screen.dart';

class BottomNavigatorController extends GetxController {
  var screens = [
    HomeScreenActors(),
    HomeScreenMovies(),
    HomeScreenSeries(),
    const SearchScreen(),
    const FavouritesListScreen(),
  ];
  var index = 0.obs;
  void setIndex(i) => index.value = i;
}