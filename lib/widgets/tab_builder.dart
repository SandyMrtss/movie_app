import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/tv_series.dart';

import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/actor.dart';
import 'package:movie_app/screens/detail_screen_generic.dart';
import 'package:movie_app/utils/utils.dart';

import 'name_label.dart';

class TabBuilder extends StatelessWidget {
  const TabBuilder({
    required this.future,
    required this.mediaType,
    super.key,
  });
  final Future<List<Object>?> future;
  final MediaType mediaType;
  @override
  Widget build(BuildContext context) {
    Future<List<Object>?> futureType;
    switch(mediaType) {
      case MediaType.movie:
         futureType = future as Future<List<Movie>?>;
      case (MediaType.tv):
        futureType = future as Future<List<TvSeries>?>;
      case (MediaType.actor):
        futureType = future as Future<List<Actor>?>;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 12.0),
      child: FutureBuilder<List<Object>?>(
        future: futureType,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              // shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.6,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.to(DetailsScreenGeneric.getDetailScreen(snapshot.data![index], mediaType));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                    Stack(
                      children: [
                        Image.network(
                          Api.imageBaseUrl + Utils.getMainImageUrl(snapshot.data![index], mediaType),
                          height: 300,
                          width: 180,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.broken_image,
                            size: 180,
                          ),
                          loadingBuilder: (_, __, ___) {
                            // ignore: no_wildcard_variable_uses
                            if (___ == null) return __;
                            return const FadeShimmer(
                              width: 180,
                              height: 250,
                              highlightColor: Color(0xff22272f),
                              baseColor: Color(0xff20252d),
                            );
                          },
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                         // width: 180,
                          //height: 300,
                          child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                NameLabel(item: snapshot.data![index], mediaType: mediaType)
                              ],
                            ),
                        ),
                      ],
                    ),

                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}