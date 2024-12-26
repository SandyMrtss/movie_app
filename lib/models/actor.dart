import 'dart:convert';

class Actor {
  int id;
  String name;
  String biography;
  String birthday; //TODO: change to date
  String deathDay; //TODO: change to date
  String homepage;
  String placeOfBirth;
  String profilePath;
  double popularity;
  List<int>? movieIds; //TODO: get from another API call
  Actor({
    required this.id,
    required this.biography,
    required this.birthday,
    required this.deathDay,
    required this.homepage,
    required this.name,
    required this.placeOfBirth,
    required this.profilePath,
    required this.popularity,
    //required this.movieIds,
  });

  factory Actor.fromMap(Map<String, dynamic> map) {
    return Actor(
      id: map['id'] as int,
      name: map['name'] ?? '',
      biography: map['biography'] ?? '',
      birthday: map['birthday'] ?? '',
      deathDay: map['deathday'] ?? '',
      homepage: map['homepage'] ?? '',
      placeOfBirth: map['place_of_birth'] ?? '',
      profilePath: map['profile_path'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
    //  movieIds: List<int>.from(map['genre_ids']),
    );
  }

  factory Actor.fromJson(String source) => Actor.fromMap(json.decode(source));
}