// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) {
  return _AccountDto.fromJson(json);
}

/// @nodoc
mixin _$AccountDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso_639_1')
  String get iso6391 => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso_3166_1')
  String get iso31661 => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'include_adult')
  bool get includeAdult => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  Avatar get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDtoCopyWith<AccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDtoCopyWith<$Res> {
  factory $AccountDtoCopyWith(
          AccountDto value, $Res Function(AccountDto) then) =
      _$AccountDtoCopyWithImpl<$Res, AccountDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'iso_639_1') String iso6391,
      @JsonKey(name: 'iso_3166_1') String iso31661,
      String name,
      @JsonKey(name: 'include_adult') bool includeAdult,
      String username,
      Avatar avatar});

  $AvatarCopyWith<$Res> get avatar;
}

/// @nodoc
class _$AccountDtoCopyWithImpl<$Res, $Val extends AccountDto>
    implements $AccountDtoCopyWith<$Res> {
  _$AccountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? iso6391 = null,
    Object? iso31661 = null,
    Object? name = null,
    Object? includeAdult = null,
    Object? username = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      iso31661: null == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      includeAdult: null == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AvatarCopyWith<$Res> get avatar {
    return $AvatarCopyWith<$Res>(_value.avatar, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountDtoImplCopyWith<$Res>
    implements $AccountDtoCopyWith<$Res> {
  factory _$$AccountDtoImplCopyWith(
          _$AccountDtoImpl value, $Res Function(_$AccountDtoImpl) then) =
      __$$AccountDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'iso_639_1') String iso6391,
      @JsonKey(name: 'iso_3166_1') String iso31661,
      String name,
      @JsonKey(name: 'include_adult') bool includeAdult,
      String username,
      Avatar avatar});

  @override
  $AvatarCopyWith<$Res> get avatar;
}

/// @nodoc
class __$$AccountDtoImplCopyWithImpl<$Res>
    extends _$AccountDtoCopyWithImpl<$Res, _$AccountDtoImpl>
    implements _$$AccountDtoImplCopyWith<$Res> {
  __$$AccountDtoImplCopyWithImpl(
      _$AccountDtoImpl _value, $Res Function(_$AccountDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? iso6391 = null,
    Object? iso31661 = null,
    Object? name = null,
    Object? includeAdult = null,
    Object? username = null,
    Object? avatar = null,
  }) {
    return _then(_$AccountDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      iso31661: null == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      includeAdult: null == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountDtoImpl extends _AccountDto {
  const _$AccountDtoImpl(
      {required this.id,
      @JsonKey(name: 'iso_639_1') required this.iso6391,
      @JsonKey(name: 'iso_3166_1') required this.iso31661,
      required this.name,
      @JsonKey(name: 'include_adult') required this.includeAdult,
      required this.username,
      required this.avatar})
      : super._();

  factory _$AccountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @override
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  @override
  final String name;
  @override
  @JsonKey(name: 'include_adult')
  final bool includeAdult;
  @override
  final String username;
  @override
  final Avatar avatar;

  @override
  String toString() {
    return 'AccountDto(id: $id, iso6391: $iso6391, iso31661: $iso31661, name: $name, includeAdult: $includeAdult, username: $username, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.iso6391, iso6391) || other.iso6391 == iso6391) &&
            (identical(other.iso31661, iso31661) ||
                other.iso31661 == iso31661) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.includeAdult, includeAdult) ||
                other.includeAdult == includeAdult) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, iso6391, iso31661, name, includeAdult, username, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDtoImplCopyWith<_$AccountDtoImpl> get copyWith =>
      __$$AccountDtoImplCopyWithImpl<_$AccountDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountDtoImplToJson(
      this,
    );
  }
}

abstract class _AccountDto extends AccountDto {
  const factory _AccountDto(
      {required final int id,
      @JsonKey(name: 'iso_639_1') required final String iso6391,
      @JsonKey(name: 'iso_3166_1') required final String iso31661,
      required final String name,
      @JsonKey(name: 'include_adult') required final bool includeAdult,
      required final String username,
      required final Avatar avatar}) = _$AccountDtoImpl;
  const _AccountDto._() : super._();

  factory _AccountDto.fromJson(Map<String, dynamic> json) =
      _$AccountDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'iso_639_1')
  String get iso6391;
  @override
  @JsonKey(name: 'iso_3166_1')
  String get iso31661;
  @override
  String get name;
  @override
  @JsonKey(name: 'include_adult')
  bool get includeAdult;
  @override
  String get username;
  @override
  Avatar get avatar;
  @override
  @JsonKey(ignore: true)
  _$$AccountDtoImplCopyWith<_$AccountDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return _Avatar.fromJson(json);
}

/// @nodoc
mixin _$Avatar {
  Gravatar get gravatar => throw _privateConstructorUsedError;
  TMDBAvatar get tmdb => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvatarCopyWith<Avatar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarCopyWith<$Res> {
  factory $AvatarCopyWith(Avatar value, $Res Function(Avatar) then) =
      _$AvatarCopyWithImpl<$Res, Avatar>;
  @useResult
  $Res call({Gravatar gravatar, TMDBAvatar tmdb});

  $GravatarCopyWith<$Res> get gravatar;
  $TMDBAvatarCopyWith<$Res> get tmdb;
}

/// @nodoc
class _$AvatarCopyWithImpl<$Res, $Val extends Avatar>
    implements $AvatarCopyWith<$Res> {
  _$AvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gravatar = null,
    Object? tmdb = null,
  }) {
    return _then(_value.copyWith(
      gravatar: null == gravatar
          ? _value.gravatar
          : gravatar // ignore: cast_nullable_to_non_nullable
              as Gravatar,
      tmdb: null == tmdb
          ? _value.tmdb
          : tmdb // ignore: cast_nullable_to_non_nullable
              as TMDBAvatar,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GravatarCopyWith<$Res> get gravatar {
    return $GravatarCopyWith<$Res>(_value.gravatar, (value) {
      return _then(_value.copyWith(gravatar: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TMDBAvatarCopyWith<$Res> get tmdb {
    return $TMDBAvatarCopyWith<$Res>(_value.tmdb, (value) {
      return _then(_value.copyWith(tmdb: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AvatarImplCopyWith<$Res> implements $AvatarCopyWith<$Res> {
  factory _$$AvatarImplCopyWith(
          _$AvatarImpl value, $Res Function(_$AvatarImpl) then) =
      __$$AvatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Gravatar gravatar, TMDBAvatar tmdb});

  @override
  $GravatarCopyWith<$Res> get gravatar;
  @override
  $TMDBAvatarCopyWith<$Res> get tmdb;
}

/// @nodoc
class __$$AvatarImplCopyWithImpl<$Res>
    extends _$AvatarCopyWithImpl<$Res, _$AvatarImpl>
    implements _$$AvatarImplCopyWith<$Res> {
  __$$AvatarImplCopyWithImpl(
      _$AvatarImpl _value, $Res Function(_$AvatarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gravatar = null,
    Object? tmdb = null,
  }) {
    return _then(_$AvatarImpl(
      gravatar: null == gravatar
          ? _value.gravatar
          : gravatar // ignore: cast_nullable_to_non_nullable
              as Gravatar,
      tmdb: null == tmdb
          ? _value.tmdb
          : tmdb // ignore: cast_nullable_to_non_nullable
              as TMDBAvatar,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvatarImpl implements _Avatar {
  const _$AvatarImpl({required this.gravatar, required this.tmdb});

  factory _$AvatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarImplFromJson(json);

  @override
  final Gravatar gravatar;
  @override
  final TMDBAvatar tmdb;

  @override
  String toString() {
    return 'Avatar(gravatar: $gravatar, tmdb: $tmdb)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarImpl &&
            (identical(other.gravatar, gravatar) ||
                other.gravatar == gravatar) &&
            (identical(other.tmdb, tmdb) || other.tmdb == tmdb));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gravatar, tmdb);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      __$$AvatarImplCopyWithImpl<_$AvatarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarImplToJson(
      this,
    );
  }
}

abstract class _Avatar implements Avatar {
  const factory _Avatar(
      {required final Gravatar gravatar,
      required final TMDBAvatar tmdb}) = _$AvatarImpl;

  factory _Avatar.fromJson(Map<String, dynamic> json) = _$AvatarImpl.fromJson;

  @override
  Gravatar get gravatar;
  @override
  TMDBAvatar get tmdb;
  @override
  @JsonKey(ignore: true)
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Gravatar _$GravatarFromJson(Map<String, dynamic> json) {
  return _Gravatar.fromJson(json);
}

/// @nodoc
mixin _$Gravatar {
  String get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GravatarCopyWith<Gravatar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GravatarCopyWith<$Res> {
  factory $GravatarCopyWith(Gravatar value, $Res Function(Gravatar) then) =
      _$GravatarCopyWithImpl<$Res, Gravatar>;
  @useResult
  $Res call({String hash});
}

/// @nodoc
class _$GravatarCopyWithImpl<$Res, $Val extends Gravatar>
    implements $GravatarCopyWith<$Res> {
  _$GravatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
  }) {
    return _then(_value.copyWith(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GravatarImplCopyWith<$Res>
    implements $GravatarCopyWith<$Res> {
  factory _$$GravatarImplCopyWith(
          _$GravatarImpl value, $Res Function(_$GravatarImpl) then) =
      __$$GravatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hash});
}

/// @nodoc
class __$$GravatarImplCopyWithImpl<$Res>
    extends _$GravatarCopyWithImpl<$Res, _$GravatarImpl>
    implements _$$GravatarImplCopyWith<$Res> {
  __$$GravatarImplCopyWithImpl(
      _$GravatarImpl _value, $Res Function(_$GravatarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
  }) {
    return _then(_$GravatarImpl(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GravatarImpl implements _Gravatar {
  const _$GravatarImpl({required this.hash});

  factory _$GravatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$GravatarImplFromJson(json);

  @override
  final String hash;

  @override
  String toString() {
    return 'Gravatar(hash: $hash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GravatarImpl &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GravatarImplCopyWith<_$GravatarImpl> get copyWith =>
      __$$GravatarImplCopyWithImpl<_$GravatarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GravatarImplToJson(
      this,
    );
  }
}

abstract class _Gravatar implements Gravatar {
  const factory _Gravatar({required final String hash}) = _$GravatarImpl;

  factory _Gravatar.fromJson(Map<String, dynamic> json) =
      _$GravatarImpl.fromJson;

  @override
  String get hash;
  @override
  @JsonKey(ignore: true)
  _$$GravatarImplCopyWith<_$GravatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TMDBAvatar _$TMDBAvatarFromJson(Map<String, dynamic> json) {
  return _TMDBAvatar.fromJson(json);
}

/// @nodoc
mixin _$TMDBAvatar {
  @JsonKey(name: 'avatar_path')
  String? get avatarPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TMDBAvatarCopyWith<TMDBAvatar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TMDBAvatarCopyWith<$Res> {
  factory $TMDBAvatarCopyWith(
          TMDBAvatar value, $Res Function(TMDBAvatar) then) =
      _$TMDBAvatarCopyWithImpl<$Res, TMDBAvatar>;
  @useResult
  $Res call({@JsonKey(name: 'avatar_path') String? avatarPath});
}

/// @nodoc
class _$TMDBAvatarCopyWithImpl<$Res, $Val extends TMDBAvatar>
    implements $TMDBAvatarCopyWith<$Res> {
  _$TMDBAvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarPath = freezed,
  }) {
    return _then(_value.copyWith(
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TMDBAvatarImplCopyWith<$Res>
    implements $TMDBAvatarCopyWith<$Res> {
  factory _$$TMDBAvatarImplCopyWith(
          _$TMDBAvatarImpl value, $Res Function(_$TMDBAvatarImpl) then) =
      __$$TMDBAvatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'avatar_path') String? avatarPath});
}

/// @nodoc
class __$$TMDBAvatarImplCopyWithImpl<$Res>
    extends _$TMDBAvatarCopyWithImpl<$Res, _$TMDBAvatarImpl>
    implements _$$TMDBAvatarImplCopyWith<$Res> {
  __$$TMDBAvatarImplCopyWithImpl(
      _$TMDBAvatarImpl _value, $Res Function(_$TMDBAvatarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarPath = freezed,
  }) {
    return _then(_$TMDBAvatarImpl(
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TMDBAvatarImpl implements _TMDBAvatar {
  const _$TMDBAvatarImpl({@JsonKey(name: 'avatar_path') this.avatarPath});

  factory _$TMDBAvatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$TMDBAvatarImplFromJson(json);

  @override
  @JsonKey(name: 'avatar_path')
  final String? avatarPath;

  @override
  String toString() {
    return 'TMDBAvatar(avatarPath: $avatarPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TMDBAvatarImpl &&
            (identical(other.avatarPath, avatarPath) ||
                other.avatarPath == avatarPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, avatarPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TMDBAvatarImplCopyWith<_$TMDBAvatarImpl> get copyWith =>
      __$$TMDBAvatarImplCopyWithImpl<_$TMDBAvatarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TMDBAvatarImplToJson(
      this,
    );
  }
}

abstract class _TMDBAvatar implements TMDBAvatar {
  const factory _TMDBAvatar(
          {@JsonKey(name: 'avatar_path') final String? avatarPath}) =
      _$TMDBAvatarImpl;

  factory _TMDBAvatar.fromJson(Map<String, dynamic> json) =
      _$TMDBAvatarImpl.fromJson;

  @override
  @JsonKey(name: 'avatar_path')
  String? get avatarPath;
  @override
  @JsonKey(ignore: true)
  _$$TMDBAvatarImplCopyWith<_$TMDBAvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
