import 'package:cineverse/feature_movie/data/local/cache/actor_cache_entity.dart';
import 'package:cineverse/feature_movie/domain/model/actor.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ActorEntity {
  @Id()
  int objectboxId = 0;

  int id;
  bool adult;
  int gender;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int castId;
  String character;
  String creditId;
  // int order;

  ActorEntity({
    required this.id,
    required this.adult,
    required this.gender,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    // required this.order,
  });

  final ToOne<ActorCacheEntity> cache = ToOne<ActorCacheEntity>();

  Actor toModel() {
    return Actor(
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
      // order: order,
    );
  }
}
