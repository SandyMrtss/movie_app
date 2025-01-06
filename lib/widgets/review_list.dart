import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/models/review.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({
    super.key,
    required this.id,
    required this.mediaType,
  });
  final String id;
  final MediaType mediaType;

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder<List<Review>?>(
        future: ApiService.getReviews(id, mediaType),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isEmpty
              ? const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  'No reviews available',
                  textAlign: TextAlign.center,
                ),
              )
              : ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset('assets/avatar.svg',height: 50,width: 50,),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(
                                    snapshot.data![index].rating.toString(),
                                    style: const TextStyle(fontSize: 16, color: Color(0xff0296E5),),
                                  ),
                                  Icon( Icons.star, color: Colors.yellowAccent,),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              //const SizedBox(height: 10,),
                              SizedBox(
                                width: 370,
                                child: Text(
                                  snapshot.data![index].comment,
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        color: Colors.white,
                      ),
                    ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Loading reviews...'),
            );
          }
        },
      );

  }
}