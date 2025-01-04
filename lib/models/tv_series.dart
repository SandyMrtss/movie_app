import 'dart:convert';

class TvSeries {
  int id;
  String name;
  String posterPath;
  String backdropPath;
  String overview;
  String firstAirDate;
  String originalLanguage;
  String originalName;
  List<String> originCountry;
  double voteAverage;
  List<int> genreIds;
  TvSeries({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.firstAirDate,
    required this.originalLanguage,
    required this.originalName,
    required this.originCountry,
    required this.voteAverage,
    required this.genreIds,
  });

  factory TvSeries.fromMap(Map<String, dynamic> map) {
    return TvSeries(
      id: map['id'] as int,
      name: map['name'] ?? '',
      posterPath: map['poster_path'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      overview: map['overview'] ?? '',
      firstAirDate: map['first_air_date'].replaceAll('-', '/') ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalName: map['original_name'] ?? '',
      originCountry: List<String>.from(map['origin_country']),
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      genreIds: List<int>.from(map['genre_ids']),
    );
  }

  factory TvSeries.fromJson(String source) => TvSeries.fromMap(json.decode(source));
}