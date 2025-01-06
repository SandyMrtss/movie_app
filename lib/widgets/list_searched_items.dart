import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/controllers/my_search_controller.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/models/actor.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/tv_series.dart';
import 'package:movie_app/screens/details_screen/details_screen_actor.dart';
import 'package:movie_app/screens/details_screen/details_screen_movie.dart';
import 'package:movie_app/screens/details_screen/details_screen_series.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/widgets/infography/infography_generic.dart';
import 'package:movie_app/widgets/my_round_image.dart';

class ListSearchedItems extends StatelessWidget {
  final MediaType mediaType;
  const ListSearchedItems({super.key, required this.mediaType});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: Get.find<MySearchController>().results.length,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (_, __) =>
        const SizedBox(height: 24),
        itemBuilder: (_, index) {
          Object obj = Get.find<MySearchController>()
              .results[index];
          print(mediaType.name);
          return GestureDetector(
            onTap: () {
              switch(mediaType) {
                  case(MediaType.Movies):
                    Movie movie = obj as Movie;
                    Get.to(DetailsScreenMovie(movie: movie));
                  case(MediaType.TVSeries):
                    TvSeries tvSeries = obj as TvSeries;
                    Get.to(DetailsScreenSeries(tvSeries: tvSeries));
                  case(MediaType.Actors):
                    Actor actor = obj as Actor;
                    Get.to(DetailsScreenActor(actor: actor));
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyRoundImage(height: 180, width: 120, imageUrl: Utils.getMainImageUrl(obj, mediaType),),
                const SizedBox(
                  width: 20,
                ),
                Infos(item: obj, mediaType: mediaType,)
              ],
            ),
          );
        });
  }
}