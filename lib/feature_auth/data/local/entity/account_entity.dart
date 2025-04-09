import 'package:cineverse/feature_auth/domain/model/account.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class AccountEntity {
  @Id()
  int objectboxId = 0;

  int id;
  String iso6391;
  String iso31661;
  String name;
  bool includeAdult;
  String username;
  String gravatar;
  String? avatarPath;

  AccountEntity({
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.includeAdult,
    required this.username,
    required this.gravatar,
    required this.avatarPath,
  });

  Account toModel() {
    return Account(
      id: id,
      iso6391: iso6391,
      iso31661: iso31661,
      name: name,
      includeAdult: includeAdult,
      username: username,
      gravatar: gravatar,
      avatarPath: avatarPath,
    );
  }
}
