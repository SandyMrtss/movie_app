import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/controllers/bottom_navigator_controller.dart';
import 'package:movie_app/controllers/my_search_controller.dart';
import 'package:movie_app/widgets/home_screen/search_box.dart';
import 'package:movie_app/widgets/list_searched_items.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  MediaType? _selectedMedia = MediaType.movie;

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
                  message: 'Search your wanted movie here!',
                  triggerMode: TooltipTriggerMode.tap,
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Filter by'),
                SizedBox(width: 8,),
                SizedBox(
                  width: 100,
                  child: DropdownButton<MediaType>(
                    value: _selectedMedia,
                    isExpanded: true,
                    alignment: AlignmentDirectional.centerStart,
                    dropdownColor: Color(0xFF262729),
                    style: TextStyle(color: Colors.white),
                    items: MediaType.values.map((MediaType mediaType){
                      return DropdownMenuItem<MediaType>(
                        value: mediaType,
                        child: Text(mediaType.name, ));
                      }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedMedia = newValue;
                      });
                    }
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            SearchBox(
              onSubmit: () {
                 String search = Get.find<MySearchController>().searchTextController.text;
                 Get.find<MySearchController>().searchTextController.text = '';
                 Get.find<MySearchController>().search(search, _selectedMedia!);
                 FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(height: 25,),
            Obx(
              (() => Get.find<MySearchController>().isLoading.value
                ? const CircularProgressIndicator()
                : Get.find<MySearchController>().results.isEmpty && Get.find<MySearchController>().hasSearched
                ? SizedBox(
                  width: Get.width / 1.5,
                  child: Column(
                    children: [
                      const SizedBox(height: 40,),
                      SvgPicture.asset(
                        'assets/no.svg',
                        height: 120,
                        width: 120,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        'Sorry, we couldn\'t find what you were looking for :(',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          wordSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  )
                  : Get.find<MySearchController>().results.isEmpty && !Get.find<MySearchController>().hasSearched
                  ? const Opacity(
                    opacity: .8,
                    child: Text(
                      'Pick a filter and search by title or name',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                   )
                  : ListSearchedItems(mediaType: Get.find<MySearchController>().currentObject))
            ),
          ],
        ),
      ),
    );
  }
}