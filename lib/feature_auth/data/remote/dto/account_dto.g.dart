// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountDtoImpl _$$AccountDtoImplFromJson(Map<String, dynamic> json) =>
    _$AccountDtoImpl(
      id: (json['id'] as num).toInt(),
      iso6391: json['iso_639_1'] as String,
      iso31661: json['iso_3166_1'] as String,
      name: json['name'] as String,
      includeAdult: json['include_adult'] as bool,
      username: json['username'] as String,
      avatar: Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccountDtoImplToJson(_$AccountDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'include_adult': instance.includeAdult,
      'username': instance.username,
      'avatar': instance.avatar,
    };

_$AvatarImpl _$$AvatarImplFromJson(Map<String, dynamic> json) => _$AvatarImpl(
      gravatar: Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
      tmdb: TMDBAvatar.fromJson(json['tmdb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AvatarImplToJson(_$AvatarImpl instance) =>
    <String, dynamic>{
      'gravatar': instance.gravatar,
      'tmdb': instance.tmdb,
    };

_$GravatarImpl _$$GravatarImplFromJson(Map<String, dynamic> json) =>
    _$GravatarImpl(
      hash: json['hash'] as String,
    );

Map<String, dynamic> _$$GravatarImplToJson(_$GravatarImpl instance) =>
    <String, dynamic>{
      'hash': instance.hash,
    };

_$TMDBAvatarImpl _$$TMDBAvatarImplFromJson(Map<String, dynamic> json) =>
    _$TMDBAvatarImpl(
      avatarPath: json['avatar_path'] as String?,
    );

Map<String, dynamic> _$$TMDBAvatarImplToJson(_$TMDBAvatarImpl instance) =>
    <String, dynamic>{
      'avatar_path': instance.avatarPath,
    };
