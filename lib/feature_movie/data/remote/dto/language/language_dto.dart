import 'package:cineverse/feature_movie/data/local/entity/language_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_dto.freezed.dart';
part 'language_dto.g.dart';

@freezed
class LanguageDto with _$LanguageDto {
  const factory LanguageDto({
    @JsonKey(name: 'iso_639_1') required String iso6391,
    @JsonKey(name: 'english_name') required String englishName,
    required String name,
  }) = _LanguageDto;

  factory LanguageDto.fromJson(Map<String, dynamic> json) =>
      _$LanguageDtoFromJson(json);

  // Custom method to convert DTO to ObjectBox Entity
  const LanguageDto._(); // Private constructor for custom methods

  LanguageEntity toEntity() {
    return LanguageEntity(
      iso6391: iso6391,
      englishName: englishName,
      name: name,
    );
  }
}
