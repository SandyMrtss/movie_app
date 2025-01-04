import 'dart:convert';

class Movie {
  int id;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  String originalLanguage;
  String originalTitle;
  double voteAverage;
  List<int> genreIds;
  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.originalLanguage,
    required this.originalTitle,
    required this.releaseDate,
    required this.voteAverage,
    required this.genreIds,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] ?? '',
      posterPath: map['poster_path'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      overview: map['overview'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      releaseDate: map['release_date'].replaceAll('-', '/') ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      genreIds: List<int>.from(map['genre_ids']),
    );
  }

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}