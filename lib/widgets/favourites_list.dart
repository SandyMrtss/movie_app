import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/tv_series.dart';
import 'package:movie_app/models/actor.dart';
import 'package:movie_app/screens/detail_screen_generic.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/widgets/infos.dart';

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
      case (MediaType.tv):
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                      Image.network(
                        Api.imageBaseUrl + Utils.getMainImageUrl(listType[index], mediaType),
                        height: 180,
                        width: 130,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.broken_image,
                          size: 180,
                        ),
                        loadingBuilder: (_, __, ___) {
                          // ignore: no_wildcard_variable_uses
                          if (___ == null) return __;
                          return const FadeShimmer(
                            width: 130,
                            height: 180,
                            highlightColor: Color(0xff22272f),
                            baseColor: Color(0xff20252d),
                          );
                        },
                      ),
                  ),
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