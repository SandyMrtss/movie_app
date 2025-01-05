import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/tv_series.dart';
import 'package:movie_app/models/actor.dart';
import 'package:movie_app/screens/detail_screen_generic.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/widgets/infography/infography_generic.dart';
import 'package:movie_app/widgets/my_round_image.dart';

class FavouritesList extends StatelessWidget {
  const FavouritesList({
    required this.list,
    required this.mediaType,
    super.key,
  });
  final List<Object> list;
  final MediaType mediaType;
  @override
  Widget build(BuildContext context) {
    List<Object> listType;
    switch(mediaType) {
      case MediaType.movie:
        listType = list as List<Movie>;
      case (MediaType.TVSeries):
        listType = list as List<TvSeries>;
      case (MediaType.actor):
        listType = list as List<Actor>;
    }
    return Padding(
      padding: const EdgeInsets.all(5),
      child:
      GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
         //shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 15,
            childAspectRatio: 2.5,
            crossAxisCount: 1,
        ),
        itemCount: listType.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Get.to(DetailsScreenGeneric.getDetailScreen(listType[index], mediaType));
          },
          child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyRoundImage(height: 180, width: 130, imageUrl: Utils.getMainImageUrl(listType[index], mediaType)),
                SizedBox(
                  width: 8,
                  height: 180,
                ),
                Infos(item: listType[index], mediaType: mediaType)
                ],
            ),
        ),
      )
    );
  }
}