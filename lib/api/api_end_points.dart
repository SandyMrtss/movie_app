class ApiEndPoints {
  static const products = "products";
  static const popularMovies = "movie/popular";
  static const popularTvSeries = "tv/popular";
  static const popularActors = "person/popular";
  static const trendingActors = "trending/person/week";
  static const getGenreList = "genre/movie/list";

  static String movieById(String movieId){
    return 'movie/$movieId';
  }

  static String movieReviews(String movieId){
    return '${movieById(movieId)}/reviews';
  }

  static String movieCredits(String movieId){
    return '${movieById(movieId)}/credits';
  }

  static String tvSeriesById(String tvSeriesId){
    return 'tv/$tvSeriesId';
  }

  static String tvSeriesReviews(String tvSeriesId){
    return '${tvSeriesById(tvSeriesId)}/reviews';
  }

  static String tvSeriesCredits(String tvSeriesId){
    return '${tvSeriesById(tvSeriesId)}/credits';
  }

  static String actorById(String actorId){
    return 'person/$actorId';
  }

  static String actorMovies(String actorId){
    return '${actorById(actorId)}/movie_credits';
  }

  static String actorTvSeries(String actorId){
    return '${actorById(actorId)}/tv_credits';
  }
}