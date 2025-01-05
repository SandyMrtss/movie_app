import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/tv_series.dart';
import 'package:movie_app/models/actor.dart';
import 'package:movie_app/screens/detail_screen_generic.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/widgets/my_round_image.dart';
import 'package:movie_app/widgets/name_label.dart';

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
      case (MediaType.TVSeries):
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
                        MyRoundImage(height: 300, width: 180, imageUrl: Utils.getMainImageUrl(snapshot.data![index], mediaType)),
                        Container(
                          alignment: Alignment.bottomCenter,
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