import 'package:cineverse/feature_movie/data/local/entity/language_entity.dart';
import 'package:equatable/equatable.dart';

class Language implements Equatable {
  final String iso6391;
  final String englishName;
  final String name;

  Language({
    required this.iso6391,
    required this.englishName,
    required this.name,
  });

  LanguageEntity toEntity() {
    return LanguageEntity(
      iso6391: iso6391,
      englishName: englishName,
      name: name,
    );
  }

  @override
  List<Object?> get props => [iso6391, englishName, name];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
