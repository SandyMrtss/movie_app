import 'package:flutter/material.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/utils.dart';

class InfoMovie extends StatelessWidget {
  const InfoMovie({
    super.key,
    required this.movie,
  });
  final Movie movie;
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
              Utils.getRating(movie, MediaType.Movies),
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
              Utils.getGenres(movie, MediaType.Movies),
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
            Icon(Icons.calendar_today_outlined, color: Colors.white,),
            const SizedBox(
              width: 5,
            ),
            Text(
              Utils.getDate(movie, MediaType.Movies),
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