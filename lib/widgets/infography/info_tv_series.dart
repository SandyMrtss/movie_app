import 'package:flutter/material.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/models/tv_series.dart';
import 'package:movie_app/utils/utils.dart';

class InfoTvSeries extends StatelessWidget {
  const InfoTvSeries({
    super.key,
    required this.tvSeries,
  });
  final TvSeries tvSeries;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.star_outline, color: Colors.amberAccent,),
            const SizedBox(
              width: 5,
            ),
            Text(
              Utils.getRating(tvSeries, MediaType.tv),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.amber,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4,),
        Row(
          children: [
            Icon(Icons.language, color: Colors.white,),
            const SizedBox(
              width: 5,
            ),
            Text(
              Utils.getGenres(tvSeries, MediaType.tv),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4,),
        Row(
          children: [
            Icon(Icons.calendar_today_outlined, color: Colors.white, size: 15,),
            const SizedBox(
              width: 5,
            ),
            Text(
              Utils.getDate(tvSeries, MediaType.tv),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}