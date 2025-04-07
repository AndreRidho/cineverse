import 'package:cineverse/feature_movie/data/local/entity/genre_entity.dart';
import 'package:equatable/equatable.dart';

class Genre implements Equatable {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  GenreEntity toEntity() {
    return GenreEntity(
      id: id,
      name: name,
    );
  }

  @override
  List<Object?> get props => [id, name];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
