// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LanguageDto _$LanguageDtoFromJson(Map<String, dynamic> json) {
  return _LanguageDto.fromJson(json);
}

/// @nodoc
mixin _$LanguageDto {
  @JsonKey(name: 'iso_639_1')
  String get iso6391 => throw _privateConstructorUsedError;
  @JsonKey(name: 'english_name')
  String get englishName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageDtoCopyWith<LanguageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageDtoCopyWith<$Res> {
  factory $LanguageDtoCopyWith(
          LanguageDto value, $Res Function(LanguageDto) then) =
      _$LanguageDtoCopyWithImpl<$Res, LanguageDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'iso_639_1') String iso6391,
      @JsonKey(name: 'english_name') String englishName,
      String name});
}

/// @nodoc
class _$LanguageDtoCopyWithImpl<$Res, $Val extends LanguageDto>
    implements $LanguageDtoCopyWith<$Res> {
  _$LanguageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iso6391 = null,
    Object? englishName = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      englishName: null == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageDtoImplCopyWith<$Res>
    implements $LanguageDtoCopyWith<$Res> {
  factory _$$LanguageDtoImplCopyWith(
          _$LanguageDtoImpl value, $Res Function(_$LanguageDtoImpl) then) =
      __$$LanguageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'iso_639_1') String iso6391,
      @JsonKey(name: 'english_name') String englishName,
      String name});
}

/// @nodoc
class __$$LanguageDtoImplCopyWithImpl<$Res>
    extends _$LanguageDtoCopyWithImpl<$Res, _$LanguageDtoImpl>
    implements _$$LanguageDtoImplCopyWith<$Res> {
  __$$LanguageDtoImplCopyWithImpl(
      _$LanguageDtoImpl _value, $Res Function(_$LanguageDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iso6391 = null,
    Object? englishName = null,
    Object? name = null,
  }) {
    return _then(_$LanguageDtoImpl(
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      englishName: null == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguageDtoImpl extends _LanguageDto {
  const _$LanguageDtoImpl(
      {@JsonKey(name: 'iso_639_1') required this.iso6391,
      @JsonKey(name: 'english_name') required this.englishName,
      required this.name})
      : super._();

  factory _$LanguageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguageDtoImplFromJson(json);

  @override
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @override
  @JsonKey(name: 'english_name')
  final String englishName;
  @override
  final String name;

  @override
  String toString() {
    return 'LanguageDto(iso6391: $iso6391, englishName: $englishName, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageDtoImpl &&
            (identical(other.iso6391, iso6391) || other.iso6391 == iso6391) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, iso6391, englishName, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageDtoImplCopyWith<_$LanguageDtoImpl> get copyWith =>
      __$$LanguageDtoImplCopyWithImpl<_$LanguageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageDtoImplToJson(
      this,
    );
  }
}

abstract class _LanguageDto extends LanguageDto {
  const factory _LanguageDto(
      {@JsonKey(name: 'iso_639_1') required final String iso6391,
      @JsonKey(name: 'english_name') required final String englishName,
      required final String name}) = _$LanguageDtoImpl;
  const _LanguageDto._() : super._();

  factory _LanguageDto.fromJson(Map<String, dynamic> json) =
      _$LanguageDtoImpl.fromJson;

  @override
  @JsonKey(name: 'iso_639_1')
  String get iso6391;
  @override
  @JsonKey(name: 'english_name')
  String get englishName;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$LanguageDtoImplCopyWith<_$LanguageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
