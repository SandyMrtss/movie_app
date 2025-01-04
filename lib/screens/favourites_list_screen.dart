import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/controllers/actors_controller.dart';
import 'package:movie_app/controllers/movies_controller.dart';
import 'package:movie_app/controllers/series_controller.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/widgets/favourites_list.dart';
import 'package:movie_app/widgets/my_tab_bar.dart';


class FavouritesListScreen extends StatelessWidget {
  Widget nothingInListText(String mediaType){
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child:
      Text(
        'No favourite $mediaType yet',
        style: TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  const FavouritesListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 42,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Your favourites',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 33,
                  height: 33,
                ),
              ],
            ),
            DefaultTabController(
                length: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTabBar(tabs: [Tab(text: 'Actors'), Tab(text: 'Movies'), Tab(text: 'TV Series'), ]),
                  SizedBox(
                    height: Get.height,
                    child: TabBarView(
                      children: [
                        if (Get.find<ActorsController>().favouritesList.isEmpty)
                          nothingInListText('actors')
                        else
                          FavouritesList(
                            list: Get.find<ActorsController>().favouritesList, mediaType: MediaType.actor,
                          ),
                        if (Get.find<MoviesController>().favouritesList.isEmpty)
                            nothingInListText('movies')
                        else
                        FavouritesList(
                          list: Get.find<MoviesController>().favouritesList, mediaType: MediaType.movie,
                        ),
                        if (Get.find<SeriesController>().favouritesList.isEmpty)
                          nothingInListText('TV series')
                        else
                          FavouritesList(
                            list: Get.find<SeriesController>().favouritesList, mediaType: MediaType.tv,
                        ),
                      ]
                    ),
                  ),
                ]
              )
            ),
          ],
        ),
      ),
    ));
  }
}