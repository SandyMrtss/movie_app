import 'dart:convert';

import 'package:movie_app/utils/utils.dart';

class Actor {
  int id;
  String name;
  int gender;
  String biography;
  String birthday;
  String deathDay;
  String homepage;
  String placeOfBirth;
  String profilePath;
  double popularity;

  Actor({
    required this.id,
    required this.biography,
    required this.gender,
    required this.birthday,
    required this.deathDay,
    required this.homepage,
    required this.name,
    required this.placeOfBirth,
    required this.profilePath,
    required this.popularity,
  });

  factory Actor.fromMap(Map<String, dynamic> map) {
   return Actor(
      id: map['id'] as int,
      name: map['name'] ?? '',
      gender: map['gender'] as int,
      biography: map['biography'] ?? '',
      birthday: Utils.dateFormat(map['birthday']),
      deathDay: Utils.dateFormat(map['deathday']),
      homepage: map['homepage'] ?? '',
      placeOfBirth: map['place_of_birth'] ?? 'N/A',
      profilePath: map['profile_path'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
    );
  }

  factory Actor.fromJson(String source) => Actor.fromMap(json.decode(source));
}