import 'package:cineverse/feature_auth/data/local/entity/account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_dto.freezed.dart';
part 'account_dto.g.dart';

@freezed
class AccountDto with _$AccountDto {
  const factory AccountDto({
    required int id,
    @JsonKey(name: 'iso_639_1') required String iso6391,
    @JsonKey(name: 'iso_3166_1') required String iso31661,
    required String name,
    @JsonKey(name: 'include_adult') required bool includeAdult,
    required String username,
    required Avatar avatar,
  }) = _AccountDto;

  factory AccountDto.fromJson(Map<String, dynamic> json) =>
      _$AccountDtoFromJson(json);

  const AccountDto._();

  AccountEntity toEntity() {
    return AccountEntity(
      id: id,
      iso6391: iso6391,
      iso31661: iso31661,
      name: name,
      includeAdult: includeAdult,
      username: username,
      gravatar: avatar.gravatar.hash,
      avatarPath: avatar.tmdb.avatarPath,
    );
  }
}

@freezed
class Avatar with _$Avatar {
  const factory Avatar({
    required Gravatar gravatar,
    required TMDBAvatar tmdb,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}

@freezed
class Gravatar with _$Gravatar {
  const factory Gravatar({
    required String hash,
  }) = _Gravatar;

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);
}

@freezed
class TMDBAvatar with _$TMDBAvatar {
  const factory TMDBAvatar({
    @JsonKey(name: 'avatar_path') String? avatarPath,
  }) = _TMDBAvatar;

  factory TMDBAvatar.fromJson(Map<String, dynamic> json) =>
      _$TMDBAvatarFromJson(json);
}
