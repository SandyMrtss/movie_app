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
        children: [
          SizedBox(height: 5,),
          SizedBox(
            width: 270,
            child: Text(
              Utils.getMainName(item, mediaType),
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Utils.getInfography(item, mediaType),

        ],
      ),
    );
  }
}