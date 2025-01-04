import 'package:flutter/material.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/models/actor.dart';
import 'package:movie_app/utils/utils.dart';

class InfoActor extends StatelessWidget {
  const InfoActor({
    super.key,
    required this.actor,
  });
  final Actor actor;
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
              Utils.getRating(actor, MediaType.actor),
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
            Icon(Icons.location_pin, color: Colors.white,),
            const SizedBox(
              width: 5,
            ),
            Text(
              actor.placeOfBirth,
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
              Utils.getDate(actor, MediaType.actor),
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