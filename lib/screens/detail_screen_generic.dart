import 'package:flutter/cupertino.dart';
import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/tv_series.dart';
import 'package:movie_app/screens/details_screen/details_screen_actor.dart';
import 'package:movie_app/screens/details_screen/details_screen_series.dart';

import '../models/actor.dart';
import 'details_screen/details_screen_movie.dart';

class DetailsScreenGeneric{

  static Widget getDetailScreen(Object object, MediaType mediaType){
    switch(mediaType) {
      case MediaType.movie:
        Movie movie = object as Movie;
        return DetailsScreenMovie(movie: movie,);
      case (MediaType.tv):
        TvSeries tvSeries = object as TvSeries;
        return DetailsScreenSeries(tvSeries: tvSeries,);
      case (MediaType.actor):
        Actor actor = object as Actor;
        return DetailsScreenActor(actor: actor,);
    }
  }

}