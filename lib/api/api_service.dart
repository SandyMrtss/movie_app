import 'dart:convert';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/api/api_end_points.dart';
import 'package:movie_app/models/actor.dart';
import 'package:movie_app/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/review.dart';
import 'package:movie_app/models/tv_series.dart';

class ApiService {
  static Future<List<Movie>?> getPopularMovies(bool isMain) async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}${ApiEndPoints.popularMovies}${Api.endUrl}'));
      var res = jsonDecode(response.body);
      if(isMain){
        res['results'].take(10).forEach(
              (m) => movies.add(
            Movie.fromMap(m),
          ),
        );
      }
      else{
        res['results'].skip(10).take(9).forEach(
              (m) => movies.add(
            Movie.fromMap(m),
          ),
        );
      }
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<TvSeries>?> getPopularTvSeries(bool isMain) async {
    List<TvSeries> tvSeries = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}${ApiEndPoints.popularTvSeries}${Api.endUrl}'));
      var res = jsonDecode(response.body);
      if(isMain){
        res['results'].take(10).forEach(
              (t) => tvSeries.add(
            TvSeries.fromMap(t),
          ),
        );
      }
      else{
        res['results'].skip(10).take(9).forEach(
              (t) => tvSeries.add(
            TvSeries.fromMap(t),
          ),
        );
      }
      return tvSeries;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getCustomMovies(String param) async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}movie/$param${Api.endUrl}'));
      var res = jsonDecode(response.body);
      res['results'].take(18).forEach(
            (m) => movies.add(
          Movie.fromMap(m),
        ),
      );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<TvSeries>?> getCustomTvSeries(String param) async {
    List<TvSeries> tvSeries = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}tv/$param${Api.endUrl}'));
      var res = jsonDecode(response.body);
      res['results'].take(18).forEach(
            (m) => tvSeries.add(
          TvSeries.fromMap(m),
        ),
      );
      return tvSeries;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getSearchedMovies(String query) async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}search/movie${Api.endUrl}&query=$query&include_adult=false'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
            (m) => movies.add(
          Movie.fromMap(m),
        ),
      );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Review>?> getMovieReviews(String movieId) async {
    List<Review> reviews = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}${ApiEndPoints.movieReviews(movieId)}${Api.endUrl}'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
            (r) {
          reviews.add(
            Review.fromMap(r),
          );
        },
      );
      return reviews;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Review>?> getTvSeriesReviews(String tvSeriesId) async {
    List<Review> reviews = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}${ApiEndPoints.tvSeriesReviews(tvSeriesId)}${Api.endUrl}'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
            (r) {
          reviews.add(Review.fromMap(r),);
        },
      );
      return reviews;
    } catch (e) {
      return null;
    }
  }
  static Future<List<Actor>?> getMoviesCast(String movieId) async {
    List<Actor> actors = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}${ApiEndPoints.movieCredits(movieId)}${Api.endUrl}'));
      var res = jsonDecode(response.body);
      res['cast'].forEach(
            (a) {
          actors.add(
            Actor.fromMap(a),
          );
        },
      );
      return getActorsInfo(actors);
    } catch (e) {
      return null;
    }
  }

  static Future<List<Actor>?> getTvSeriesCast(String tvSeriesId) async {
    List<Actor> actors = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}${ApiEndPoints.tvSeriesCredits(tvSeriesId)}${Api.endUrl}'));
      var res = jsonDecode(response.body);
      res['cast'].forEach(
            (a) {
          actors.add(
            Actor.fromMap(a),
          );
        },
      );
      return getActorsInfo(actors);
    } catch (e) {
      return null;
    }
  }

  static Future<List<Actor>?> getPopularActors(bool isMain) async {
    List<Actor> actors = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}${ApiEndPoints.popularActors}${Api.endUrl}'));
      var res = jsonDecode(response.body);
      if(isMain){
        res['results'].take(10).forEach(
              (m) => actors.add(
            Actor.fromMap(m),
          ),
        );
      }
      else{
        res['results'].skip(10).take(9).forEach(
              (m) => actors.add(
            Actor.fromMap(m),
          ),
        );
      }
      return getActorsInfo(actors);
    } catch (e) {
      return null;
    }
  }

  static Future<List<Actor>?> getTrendingActors() async {
    List<Actor> actors = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}${ApiEndPoints.trendingActors}${Api.endUrl}'));
      var res = jsonDecode(response.body);
      res['results'].take(18).forEach(
            (m) => actors.add(
          Actor.fromMap(m),
        ),
      );
      return getActorsInfo(actors);
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getActorMovies(String actorId) async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}${ApiEndPoints.actorMovies(actorId)}${Api.endUrl}'));
      var res = jsonDecode(response.body);
      res['cast'].forEach(
            (m) {
          movies.add(
            Movie.fromMap(m)
          );
        },
      );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<TvSeries>?> getActorTvSeries(String actorId) async {
    List<TvSeries> series = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}${ApiEndPoints.actorTvSeries(actorId)}${Api.endUrl}'));
      var res = jsonDecode(response.body);
      res['cast'].forEach(
            (m) {
              series.add(
              TvSeries.fromMap(m)
          );
        },
      );
      return series;
    } catch (e) {
      return null;
    }
  }

  static Future<Actor?> getActorById(String id) async {
    Actor actor;
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}${ApiEndPoints.actorById(id)}${Api.endUrl}'));
      actor = Actor.fromJson(response.body);
      return actor;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Actor>?> getActorsInfo(List<Actor> actors) async {
    List<Actor> actorsInfo = [];
    for (var actor in actors) {
      try{
        Actor? actorInfo = await getActorById(actor.id.toString());
        actorsInfo.add(actorInfo!);
      }
      catch(e) {}
    }
    return actorsInfo;
  }
}