import 'package:equatable/equatable.dart';

class Genre implements Equatable {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  @override
  bool? get stringify => true;

  @override
  String toString() => 'Genre(id: $id, name: $name)';
}
