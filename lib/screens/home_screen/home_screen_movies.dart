import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/controllers/bottom_navigator_controller.dart';
import 'package:movie_app/controllers/movies_controller.dart';
import 'package:movie_app/controllers/my_search_controller.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/widgets/my_tab_bar.dart';
import 'package:movie_app/widgets/home_screen/search_box.dart';
import 'package:movie_app/widgets/home_screen/top_rated_item.dart';
import 'package:movie_app/widgets/tab_builder.dart';

class HomeScreenMovies extends StatelessWidget {
  HomeScreenMovies({super.key});

  final MoviesController controller = Get.put(MoviesController());
  final MySearchController searchController = Get.put(MySearchController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 42,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Browse Movies',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SearchBox(
              onSumbit: () {
                String search =
                    Get.find<MySearchController>().searchController.text;
                Get.find<MySearchController>().searchController.text = '';
                Get.find<MySearchController>().search(search);
                Get.find<BottomNavigatorController>().setIndex(1);
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(
              height: 34,
            ),
            Obx(
              (() => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : SizedBox(
                height: 300,
                child: ListView.separated(
                  itemCount: controller.mainTopRatedMovies.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(width: 24),
                  itemBuilder: (_, index) => TopRatedItem(
                      item: controller.mainTopRatedMovies[index],
                      index: index + 1,
                      mediaType: MediaType.movie,),
                ),
              )),
            ),
            DefaultTabController(
              length: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyTabBar(tabs: [Tab(text: 'Now playing'), Tab(text: 'Upcoming'), Tab(text: 'Top rated'), Tab(text: 'Popular'),],),
                  SizedBox(
                    height: 400,
                    child: TabBarView(children: [
                      TabBuilder(
                        future: ApiService.getCustomMovies(
                            'now_playing'), mediaType: MediaType.movie,
                      ),
                      TabBuilder(
                        future: ApiService.getCustomMovies(
                            'upcoming'), mediaType: MediaType.movie,
                      ),
                      TabBuilder(
                        future: ApiService.getCustomMovies(
                            'top_rated'), mediaType: MediaType.movie,
                      ),
                      TabBuilder(
                          future: ApiService.getPopularMovies(false), mediaType: MediaType.movie,
                      ),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}