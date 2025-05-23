// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenreDto _$GenreDtoFromJson(Map<String, dynamic> json) {
  return _GenreDto.fromJson(json);
}

/// @nodoc
mixin _$GenreDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreDtoCopyWith<GenreDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreDtoCopyWith<$Res> {
  factory $GenreDtoCopyWith(GenreDto value, $Res Function(GenreDto) then) =
      _$GenreDtoCopyWithImpl<$Res, GenreDto>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$GenreDtoCopyWithImpl<$Res, $Val extends GenreDto>
    implements $GenreDtoCopyWith<$Res> {
  _$GenreDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenreDtoImplCopyWith<$Res>
    implements $GenreDtoCopyWith<$Res> {
  factory _$$GenreDtoImplCopyWith(
          _$GenreDtoImpl value, $Res Function(_$GenreDtoImpl) then) =
      __$$GenreDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$GenreDtoImplCopyWithImpl<$Res>
    extends _$GenreDtoCopyWithImpl<$Res, _$GenreDtoImpl>
    implements _$$GenreDtoImplCopyWith<$Res> {
  __$$GenreDtoImplCopyWithImpl(
      _$GenreDtoImpl _value, $Res Function(_$GenreDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$GenreDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreDtoImpl extends _GenreDto {
  const _$GenreDtoImpl({required this.id, required this.name}) : super._();

  factory _$GenreDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'GenreDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreDtoImplCopyWith<_$GenreDtoImpl> get copyWith =>
      __$$GenreDtoImplCopyWithImpl<_$GenreDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreDtoImplToJson(
      this,
    );
  }
}

abstract class _GenreDto extends GenreDto {
  const factory _GenreDto({required final int id, required final String name}) =
      _$GenreDtoImpl;
  const _GenreDto._() : super._();

  factory _GenreDto.fromJson(Map<String, dynamic> json) =
      _$GenreDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$GenreDtoImplCopyWith<_$GenreDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
