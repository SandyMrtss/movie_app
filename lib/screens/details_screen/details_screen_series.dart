import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/api/api.dart';
import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/controllers/series_controller.dart';
import 'package:movie_app/models/tv_series.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/widgets/my_round_image.dart';
import 'package:movie_app/widgets/my_tab_bar.dart';
import 'package:movie_app/widgets/review_list.dart';
import 'package:movie_app/widgets/tab_builder.dart';

import 'package:movie_app/main.dart';

class DetailsScreenSeries extends StatelessWidget {
  const DetailsScreenSeries({
    super.key,
    required this.tvSeries,
  });
  final TvSeries tvSeries;
  @override
  Widget build(BuildContext context) {
    ApiService.getTvSeriesCast(tvSeries.id.toString());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      tooltip: 'Go back',
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        tvSeries.originalName,
                        style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 23,),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tooltip(
                      message: 'Save to favourites',
                      triggerMode: TooltipTriggerMode.tap,
                      child: IconButton(
                        onPressed: () {
                          Get.find<SeriesController>().addToFavouritesList(tvSeries);
                        },
                        icon: Obx(
                              () =>
                          Get.find<SeriesController>().isInFavouritesList(tvSeries)
                          ? const Icon(
                            Icons.favorite,
                            color: Colors.yellow,
                            size: 33,
                          )
                          : const Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                            size: 33,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 330,
                child: Stack(
                  children: [
                    MyRoundImage(height: 250, width: Get.width, imageUrl: Api.imageBaseUrl + tvSeries.backdropPath,),
                    Positioned(
                      left: 30,
                      bottom: 0,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: MyRoundImage(height: 140, width: 110, imageUrl: Api.imageBaseUrl + tvSeries.posterPath)
                      ),
                    ),
                    Positioned(
                      top: 255,
                      left: 155,
                      child: SizedBox(
                        width: 340,
                        child: Expanded(
                          child: Text(
                          tvSeries.name,
                            textAlign: TextAlign.justify,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      right: 30,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color.fromRGBO(37, 40, 54, 0.52),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star_outline, color: Colors.amberAccent,),
                            const SizedBox(width: 5,),
                            Text(
                              Utils.getRating(tvSeries, MediaType.TVSeries),
                              style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.amberAccent,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Opacity(
                opacity: .8,
                child: SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined, color: Colors.white, size: 15,),
                          const SizedBox(width: 4,),
                          Text(
                            tvSeries.firstAirDate,
                            style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 15,),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5,),
                      const Text('|', style: TextStyle(fontSize: 15, ),),
                      const SizedBox(width: 5,),
                      Row(
                        children: [
                          Icon(Icons.location_pin, color: Colors.white, size: 20,),
                          const SizedBox(width: 4,),
                          Text(
                            Utils.getOriginCountry(tvSeries),
                            style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 15,),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5,),
                      const Text('|', style: TextStyle(fontSize: 15, ),),
                      const SizedBox(width: 5,),                      Row(
                        children: [
                          Icon(Icons.language, color: Colors.white, size: 20,),
                          const SizedBox(width: 4,),
                          Text(
                            Utils.getGenres(tvSeries, MediaType.TVSeries),
                            style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 15,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyTabBar(tabs: [Tab(text: 'About'), Tab(text: 'Reviews'), Tab(text: 'Cast'),]),
                      SizedBox(
                        height: 400,
                        child: TabBarView(children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              tvSeries.overview,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          ReviewList(id: tvSeries.id.toString(), mediaType: MediaType.TVSeries),
                          TabBuilder(future: ApiService.getTvSeriesCast(tvSeries.id.toString()), mediaType: MediaType.Actors,),
                        ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}