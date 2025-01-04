import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/api/api.dart';
import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/models/actor.dart';
import 'package:movie_app/controllers/actors_controller.dart';
import 'package:movie_app/widgets/my_tab_bar.dart';
import 'package:movie_app/widgets/tab_builder.dart';

class DetailsScreenActor extends StatelessWidget {
  const DetailsScreenActor({
    super.key,
    required this.actor,
  });
  final Actor actor;

  Widget genderIcon(){
    Icon icon;
    double size = 20;
    Color color = Colors.white;
    switch(actor.gender){
      case(1):
        icon = Icon(Icons.female_outlined, size: size, color: color,);
      case(2):
        icon = Icon(Icons.male_outlined, size: size, color: color,);
      case(3):
        icon = Icon(Icons.transgender_outlined, size: size, color: color,);
      default:
        icon = Icon(Icons.question_mark_outlined, size: size, color: color,);
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
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
                    Text(
                      actor.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 23,
                      ),
                    ),
                    Tooltip(
                      message: 'Save to favourites',
                      triggerMode: TooltipTriggerMode.tap,
                      child: IconButton(
                        onPressed: () {
                          Get.find<ActorsController>().addToFavouritesList(actor);
                        },
                        icon: Obx(
                              () =>
                          Get.find<ActorsController>().isInFavouritesList(actor)
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Image.network(
                        Api.imageBaseUrl + actor.profilePath,
                        height: Get.height/2,
                        fit: BoxFit.fitHeight,
                        loadingBuilder: (_, __, ___) {
                          // ignore: no_wildcard_variable_uses
                          if (___ == null) return __;
                          return FadeShimmer(
                            width: Get.width/2,
                            height: Get.height/2,
                            highlightColor: const Color(0xff22272f),
                            baseColor: const Color(0xff20252d),
                          );
                        },
                        errorBuilder: (_, __, ___) => const Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.broken_image,
                            size: 250,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child:
                            SizedBox(
                              height: Get.height/2 -26,
                              child:
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Text(
                                      actor.biography,
                                      textAlign: TextAlign.justify,
                                  ),
                                ),
                            ),
                        )
                    ),
                  ]
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Opacity(
                opacity: .6,
                child: SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined, color: Colors.white, size: 15,),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            actor.birthday,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Text('|'),
                      genderIcon(),
                      const Text('|'),
                      Row(
                        children: [
                          Icon(Icons.location_pin, color: Colors.white, size: 20,),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            actor.placeOfBirth,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              DefaultTabController(
                length: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTabBar(tabs: [Tab(text:'Movies',), Tab(text:'TV Series',),],),
                    SizedBox(
                      height:
                      400,
                      child: TabBarView(
                          children: [
                            TabBuilder(future: ApiService.getActorMovies(actor.id.toString()), mediaType: MediaType.movie,),
                            TabBuilder(future: ApiService.getActorTvSeries(actor.id.toString()), mediaType: MediaType.tv),
                          ]
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}