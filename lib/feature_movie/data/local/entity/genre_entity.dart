import 'package:cineverse/feature_movie/data/local/cache/genre_cache_entity.dart';
import 'package:cineverse/feature_movie/domain/model/genre.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class GenreEntity {
  @Id()
  int objectboxId = 0;
  int id;
  String name;

  GenreEntity({
    required this.id,
    required this.name,
  });

  Genre toModel() {
    return Genre(
      id: id,
      name: name,
    );
  }

  final ToOne<GenreCacheEntity> cache = ToOne<GenreCacheEntity>();
}
