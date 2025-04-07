import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cineverse/feature_movie/data/local/entity/genre_entity.dart';

part 'genre_dto.freezed.dart';
part 'genre_dto.g.dart';

@freezed
class GenreDto with _$GenreDto {
  const factory GenreDto({
    required int id,
    required String name,
  }) = _GenreDto;

  factory GenreDto.fromJson(Map<String, dynamic> json) =>
      _$GenreDtoFromJson(json);

  // Custom method to convert DTO to ObjectBox Entity
  const GenreDto._(); // Private constructor for custom methods

  GenreEntity toEntity() {
    return GenreEntity(
      id: id,
      name: name,
    );
  }
}
