import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/screens/detail_screen_generic.dart';
import 'package:movie_app/widgets/home_screen/index_number.dart';
import 'package:movie_app/widgets/my_round_image.dart';
import 'package:movie_app/widgets/name_label.dart';
import 'package:movie_app/utils/utils.dart';

class TopRatedItem extends StatelessWidget {
  const TopRatedItem({
    super.key,
    required this.item,
    required this.index,
    required this.mediaType,
  });

  final Object item;
  final int index;
  final MediaType mediaType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Get.to(
            DetailsScreenGeneric.getDetailScreen(item, mediaType)
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 12),
            child: MyRoundImage(height: 250, width: 180, imageUrl: Utils.getMainImageUrl(item, mediaType))
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          width: 192,
          child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IndexNumber(number: index),
                NameLabel(item: item, mediaType: mediaType)
              ],
            ),
        ),
      ],
    );
  }
}