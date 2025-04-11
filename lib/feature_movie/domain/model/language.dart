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

  @override
  List<Object?> get props => [iso6391, englishName, name];

  @override
  bool? get stringify => true;

  @override
  String toString() =>
      'Language(iso6391: $iso6391, englishName: $englishName, name: $name)';
}
