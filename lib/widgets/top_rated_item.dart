import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/screens/detail_screen_generic.dart';
import 'package:movie_app/widgets/index_number.dart';
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                Api.imageBaseUrl + Utils.getMainImageUrl(item, mediaType),
                fit: BoxFit.cover,
                height: 250,
                width: 180,
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
            ),
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