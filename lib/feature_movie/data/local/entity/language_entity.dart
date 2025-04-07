import 'package:cineverse/feature_movie/data/local/cache/language_cache_entity.dart';
import 'package:cineverse/feature_movie/domain/model/language.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LanguageEntity {
  @Id()
  int objectboxId = 0;
  String iso6391;
  String englishName;
  String name;

  LanguageEntity({
    required this.iso6391,
    required this.englishName,
    required this.name,
  });

  Language toModel() {
    return Language(
      iso6391: iso6391,
      englishName: englishName,
      name: name,
    );
  }

  final ToOne<LanguageCacheEntity> cache = ToOne<LanguageCacheEntity>();
}
