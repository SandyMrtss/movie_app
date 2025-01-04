import 'package:flutter/material.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/utils/utils.dart';

class NameLabel extends StatelessWidget {
  const NameLabel({
    super.key,
    required this.item,
    required this.mediaType,
  });
  final Object item;
  final MediaType mediaType;
  @override
  Widget build(BuildContext context) {
    if(mediaType == MediaType.actor){
      return Expanded(
        child:
        Container(
          padding: EdgeInsets.all(2),
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [Colors.transparent, Colors.white60, Colors.white70],
            ),
          ),
          child:
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Text(
                Utils.getMainName(item, mediaType),
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                Utils.getMainName(item, mediaType),
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..strokeWidth = 0.3
                      ..color = Colors.white
                      ..style = PaintingStyle.stroke
                ),
              ),
            ],
          ),

        ),

      );
    }
    return Expanded(child: Container(height: 0,));
  }
}