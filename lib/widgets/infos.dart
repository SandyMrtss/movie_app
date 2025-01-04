import 'package:flutter/material.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/utils/utils.dart';

class Infos extends StatelessWidget {
  const Infos({
    super.key,
    required this.item,
    required this.mediaType,
  });
  final Object item;
  final MediaType mediaType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              Utils.getMainName(item, mediaType),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Utils.getInfography(item, mediaType),

        ],
      ),
    );
  }
}