// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActorDtoImpl _$$ActorDtoImplFromJson(Map<String, dynamic> json) =>
    _$ActorDtoImpl(
      id: (json['id'] as num).toInt(),
      adult: json['adult'] as bool,
      gender: (json['gender'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
      castId: (json['cast_id'] as num).toInt(),
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
    );

Map<String, dynamic> _$$ActorDtoImplToJson(_$ActorDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'adult': instance.adult,
      'gender': instance.gender,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
    };
