import 'package:equatable/equatable.dart';

class Account implements Equatable {
  final int id;
  final String iso6391;
  final String iso31661;
  final String name;
  final bool includeAdult;
  final String username;
  final String gravatar;
  final String? avatarPath;

  Account({
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.includeAdult,
    required this.username,
    required this.gravatar,
    required this.avatarPath,
  });

  @override
  List<Object?> get props => [
        id,
        iso6391,
        iso31661,
        name,
        includeAdult,
        username,
        gravatar,
        avatarPath,
      ];

  @override
  bool? get stringify => true;
}
