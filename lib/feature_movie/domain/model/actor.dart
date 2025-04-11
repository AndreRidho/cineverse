import 'package:equatable/equatable.dart';

class Actor implements Equatable {
  final int id;
  final bool adult;
  final int gender;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  // final int order;

  Actor({
    required this.id,
    required this.adult,
    required this.gender,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    // required this.order,
  });

  @override
  List<Object?> get props => [
        id,
        adult,
        gender,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        castId,
        character,
        creditId,
        // order
      ];

  @override
  bool? get stringify => true;

  @override
  String toString() => 'Actor(id: $id, name: $name, character: $character)';
}
