import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/controllers/bottom_navigator_controller.dart';

class Main extends StatelessWidget {
  Main({super.key});

  final BottomNavigatorController controller =
      Get.put(BottomNavigatorController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.index.value,
              children: Get.find<BottomNavigatorController>().screens,
            ),
          ),
          bottomNavigationBar: Container(
            height: 78,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFA8830F),
                  width: 1,
                ),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.index.value,
              onTap: (index) =>
                  Get.find<BottomNavigatorController>().setIndex(index),
              backgroundColor: const Color(0xFF242A32),
              selectedItemColor: const Color(0xFFA8830F),
              unselectedItemColor: const Color(0xFF67686D),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child:
                      Icon(
                        Icons.person,
                        size: 21,
                        color: controller.index.value == 0
                            ? const Color(0xFFA8830F)
                            : const Color(0xFF67686D),
                      ),
                  ),
                  label: 'Actors',
                  tooltip: 'Actors',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child:
                        Icon(
                          Icons.local_movies_sharp,
                          size: 21,
                          color: controller.index.value == 1
                              ? const Color(0xFFA8830F)
                              : const Color(0xFF67686D),
                        ),
                  ),
                  label: 'Movies',
                  tooltip: 'Movies',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child:
                        Icon(
                          Icons.tv_sharp,
                          size: 21,
                          color: controller.index.value == 2
                          ? const Color(0xFFA8830F)
                          : const Color(0xFF67686D),
                    ),
                  ),
                  label: 'TV Series',
                  tooltip: 'TV Series',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child:
                      Icon(
                        Icons.search,
                        size: 25,
                        color: controller.index.value == 3
                            ? const Color(0xFFA8830F)
                            : const Color(0xFF67686D),
                      ),
                  ),
                  label: 'Search',
                  tooltip: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child:
                        Icon(
                          Icons.favorite_outline,
                          size: 21,
                          color: controller.index.value == 4
                              ? const Color(0xFFA8830F)
                              : const Color(0xFF67686D),
                        ),
                  ),
                  label: 'Favourites',
                  tooltip: 'Your Favourites',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
