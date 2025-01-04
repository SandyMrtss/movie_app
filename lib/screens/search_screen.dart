import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/controllers/bottom_navigator_controller.dart';
import 'package:movie_app/controllers/my_search_controller.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/infography/infography_generic.dart';
import 'package:movie_app/widgets/home_screen/search_box.dart';
import 'package:movie_app/screens/details_screen/details_screen_movie.dart';
import 'package:movie_app/widgets/my_round_image.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: 'Back to home',
                  onPressed: () =>
                      Get.find<BottomNavigatorController>().setIndex(0),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Search',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),
                const Tooltip(
                  message: 'Search your wanted movie here !',
                  triggerMode: TooltipTriggerMode.tap,
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SearchBox(
              onSumbit: () {
                String search =
                    Get.find<MySearchController>().searchController.text;
                Get.find<MySearchController>().searchController.text = '';
                Get.find<MySearchController>().search(search);
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(
              height: 34,
            ),
            Obx(
              (() => Get.find<MySearchController>().isLoading.value
                  ? const CircularProgressIndicator()
                  : Get.find<MySearchController>().foundedMovies.isEmpty
                  ? SizedBox(
                width: Get.width / 1.5,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    SvgPicture.asset(
                      'assets/no.svg',
                      height: 120,
                      width: 120,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'We Are Sorry, We Can Not Find The Movie :(',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        wordSpacing: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Opacity(
                      opacity: .8,
                      child: Text(
                        'Find your movie by Type title, categories, years, etc ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  : ListView.separated(
                  itemCount:
                  Get.find<MySearchController>().foundedMovies.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                  const SizedBox(height: 24),
                  itemBuilder: (_, index) {
                    Movie movie = Get.find<MySearchController>()
                        .foundedMovies[index];
                    return GestureDetector(
                      onTap: () => Get.to(DetailsScreenMovie(movie: movie)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyRoundImage(height: 180, width: 120, imageUrl: Api.imageBaseUrl + movie.posterPath,),
                          const SizedBox(
                            width: 20,
                          ),
                          Infos(item: movie, mediaType: MediaType.movie,)
                        ],
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}