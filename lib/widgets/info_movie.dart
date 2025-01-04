import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              Utils.getRating(movie, MediaType.movie),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: Colors.amber,
              ),
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset('assets/Ticket.svg'),
            const SizedBox(
              width: 5,
            ),
            Text(
              Utils.getGenres(movie, MediaType.movie),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.calendar_today_outlined, color: Colors.white, size: 15,),
            const SizedBox(
              width: 5,
            ),
            Text(
              Utils.getDate(movie, MediaType.movie),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ],
    );
  }
}