// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actor_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActorDto _$ActorDtoFromJson(Map<String, dynamic> json) {
  return _ActorDto.fromJson(json);
}

/// @nodoc
mixin _$ActorDto {
  int get id => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String get originalName => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'cast_id')
  int get castId => throw _privateConstructorUsedError;
  String get character => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_id')
  String get creditId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActorDtoCopyWith<ActorDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActorDtoCopyWith<$Res> {
  factory $ActorDtoCopyWith(ActorDto value, $Res Function(ActorDto) then) =
      _$ActorDtoCopyWithImpl<$Res, ActorDto>;
  @useResult
  $Res call(
      {int id,
      bool adult,
      int gender,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      String name,
      @JsonKey(name: 'original_name') String originalName,
      double popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'cast_id') int castId,
      String character,
      @JsonKey(name: 'credit_id') String creditId});
}

/// @nodoc
class _$ActorDtoCopyWithImpl<$Res, $Val extends ActorDto>
    implements $ActorDtoCopyWith<$Res> {
  _$ActorDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? adult = null,
    Object? gender = null,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? profilePath = freezed,
    Object? castId = null,
    Object? character = null,
    Object? creditId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      castId: null == castId
          ? _value.castId
          : castId // ignore: cast_nullable_to_non_nullable
              as int,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActorDtoImplCopyWith<$Res>
    implements $ActorDtoCopyWith<$Res> {
  factory _$$ActorDtoImplCopyWith(
          _$ActorDtoImpl value, $Res Function(_$ActorDtoImpl) then) =
      __$$ActorDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      bool adult,
      int gender,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      String name,
      @JsonKey(name: 'original_name') String originalName,
      double popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'cast_id') int castId,
      String character,
      @JsonKey(name: 'credit_id') String creditId});
}

/// @nodoc
class __$$ActorDtoImplCopyWithImpl<$Res>
    extends _$ActorDtoCopyWithImpl<$Res, _$ActorDtoImpl>
    implements _$$ActorDtoImplCopyWith<$Res> {
  __$$ActorDtoImplCopyWithImpl(
      _$ActorDtoImpl _value, $Res Function(_$ActorDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? adult = null,
    Object? gender = null,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? profilePath = freezed,
    Object? castId = null,
    Object? character = null,
    Object? creditId = null,
  }) {
    return _then(_$ActorDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      castId: null == castId
          ? _value.castId
          : castId // ignore: cast_nullable_to_non_nullable
              as int,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActorDtoImpl extends _ActorDto {
  const _$ActorDtoImpl(
      {required this.id,
      required this.adult,
      required this.gender,
      @JsonKey(name: 'known_for_department') required this.knownForDepartment,
      required this.name,
      @JsonKey(name: 'original_name') required this.originalName,
      required this.popularity,
      @JsonKey(name: 'profile_path') required this.profilePath,
      @JsonKey(name: 'cast_id') required this.castId,
      required this.character,
      @JsonKey(name: 'credit_id') required this.creditId})
      : super._();

  factory _$ActorDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActorDtoImplFromJson(json);

  @override
  final int id;
  @override
  final bool adult;
  @override
  final int gender;
  @override
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @override
  final String name;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  final double popularity;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @override
  @JsonKey(name: 'cast_id')
  final int castId;
  @override
  final String character;
  @override
  @JsonKey(name: 'credit_id')
  final String creditId;

  @override
  String toString() {
    return 'ActorDto(id: $id, adult: $adult, gender: $gender, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActorDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.knownForDepartment, knownForDepartment) ||
                other.knownForDepartment == knownForDepartment) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.castId, castId) || other.castId == castId) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.creditId, creditId) ||
                other.creditId == creditId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      adult,
      gender,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      castId,
      character,
      creditId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActorDtoImplCopyWith<_$ActorDtoImpl> get copyWith =>
      __$$ActorDtoImplCopyWithImpl<_$ActorDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActorDtoImplToJson(
      this,
    );
  }
}

abstract class _ActorDto extends ActorDto {
  const factory _ActorDto(
          {required final int id,
          required final bool adult,
          required final int gender,
          @JsonKey(name: 'known_for_department')
          required final String knownForDepartment,
          required final String name,
          @JsonKey(name: 'original_name') required final String originalName,
          required final double popularity,
          @JsonKey(name: 'profile_path') required final String? profilePath,
          @JsonKey(name: 'cast_id') required final int castId,
          required final String character,
          @JsonKey(name: 'credit_id') required final String creditId}) =
      _$ActorDtoImpl;
  const _ActorDto._() : super._();

  factory _ActorDto.fromJson(Map<String, dynamic> json) =
      _$ActorDtoImpl.fromJson;

  @override
  int get id;
  @override
  bool get adult;
  @override
  int get gender;
  @override
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment;
  @override
  String get name;
  @override
  @JsonKey(name: 'original_name')
  String get originalName;
  @override
  double get popularity;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(name: 'cast_id')
  int get castId;
  @override
  String get character;
  @override
  @JsonKey(name: 'credit_id')
  String get creditId;
  @override
  @JsonKey(ignore: true)
  _$$ActorDtoImplCopyWith<_$ActorDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
