import 'package:cineverse/feature_movie/data/local/entity/actor_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor_dto.freezed.dart';
part 'actor_dto.g.dart';

@freezed
class ActorDto with _$ActorDto {
  const factory ActorDto({
    required int id,
    required bool adult,
    required int gender,
    @JsonKey(name: 'known_for_department') required String knownForDepartment,
    required String name,
    @JsonKey(name: 'original_name') required String originalName,
    required double popularity,
    @JsonKey(name: 'profile_path') required String? profilePath,
    @JsonKey(name: 'cast_id') required int castId,
    required String character,
    @JsonKey(name: 'credit_id') required String creditId,
  }) = _ActorDto;

  factory ActorDto.fromJson(Map<String, dynamic> json) =>
      _$ActorDtoFromJson(json);

  const ActorDto._();

  ActorEntity toEntity() {
    return ActorEntity(
      id: id,
      adult: adult,
      gender: gender,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
      castId: castId,
      character: character,
      creditId: creditId,
    );
  }
}
