// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharacterDetail {
  String get name => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  List<String> get starshipIds => throw _privateConstructorUsedError;
  List<String> get vehicleIds => throw _privateConstructorUsedError;
  String get homeworldId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterDetailCopyWith<CharacterDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDetailCopyWith<$Res> {
  factory $CharacterDetailCopyWith(
          CharacterDetail value, $Res Function(CharacterDetail) then) =
      _$CharacterDetailCopyWithImpl<$Res, CharacterDetail>;
  @useResult
  $Res call(
      {String name,
      String gender,
      List<String> starshipIds,
      List<String> vehicleIds,
      String homeworldId});
}

/// @nodoc
class _$CharacterDetailCopyWithImpl<$Res, $Val extends CharacterDetail>
    implements $CharacterDetailCopyWith<$Res> {
  _$CharacterDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? gender = null,
    Object? starshipIds = null,
    Object? vehicleIds = null,
    Object? homeworldId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      starshipIds: null == starshipIds
          ? _value.starshipIds
          : starshipIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vehicleIds: null == vehicleIds
          ? _value.vehicleIds
          : vehicleIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      homeworldId: null == homeworldId
          ? _value.homeworldId
          : homeworldId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterDetailCopyWith<$Res>
    implements $CharacterDetailCopyWith<$Res> {
  factory _$$_CharacterDetailCopyWith(
          _$_CharacterDetail value, $Res Function(_$_CharacterDetail) then) =
      __$$_CharacterDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String gender,
      List<String> starshipIds,
      List<String> vehicleIds,
      String homeworldId});
}

/// @nodoc
class __$$_CharacterDetailCopyWithImpl<$Res>
    extends _$CharacterDetailCopyWithImpl<$Res, _$_CharacterDetail>
    implements _$$_CharacterDetailCopyWith<$Res> {
  __$$_CharacterDetailCopyWithImpl(
      _$_CharacterDetail _value, $Res Function(_$_CharacterDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? gender = null,
    Object? starshipIds = null,
    Object? vehicleIds = null,
    Object? homeworldId = null,
  }) {
    return _then(_$_CharacterDetail(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      null == starshipIds
          ? _value._starshipIds
          : starshipIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == vehicleIds
          ? _value._vehicleIds
          : vehicleIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == homeworldId
          ? _value.homeworldId
          : homeworldId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CharacterDetail extends _CharacterDetail {
  const _$_CharacterDetail(
      this.name,
      this.gender,
      final List<String> starshipIds,
      final List<String> vehicleIds,
      this.homeworldId)
      : _starshipIds = starshipIds,
        _vehicleIds = vehicleIds,
        super._();

  @override
  final String name;
  @override
  final String gender;
  final List<String> _starshipIds;
  @override
  List<String> get starshipIds {
    if (_starshipIds is EqualUnmodifiableListView) return _starshipIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_starshipIds);
  }

  final List<String> _vehicleIds;
  @override
  List<String> get vehicleIds {
    if (_vehicleIds is EqualUnmodifiableListView) return _vehicleIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vehicleIds);
  }

  @override
  final String homeworldId;

  @override
  String toString() {
    return 'CharacterDetail(name: $name, gender: $gender, starshipIds: $starshipIds, vehicleIds: $vehicleIds, homeworldId: $homeworldId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterDetail &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality()
                .equals(other._starshipIds, _starshipIds) &&
            const DeepCollectionEquality()
                .equals(other._vehicleIds, _vehicleIds) &&
            (identical(other.homeworldId, homeworldId) ||
                other.homeworldId == homeworldId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      gender,
      const DeepCollectionEquality().hash(_starshipIds),
      const DeepCollectionEquality().hash(_vehicleIds),
      homeworldId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterDetailCopyWith<_$_CharacterDetail> get copyWith =>
      __$$_CharacterDetailCopyWithImpl<_$_CharacterDetail>(this, _$identity);
}

abstract class _CharacterDetail extends CharacterDetail {
  const factory _CharacterDetail(
      final String name,
      final String gender,
      final List<String> starshipIds,
      final List<String> vehicleIds,
      final String homeworldId) = _$_CharacterDetail;
  const _CharacterDetail._() : super._();

  @override
  String get name;
  @override
  String get gender;
  @override
  List<String> get starshipIds;
  @override
  List<String> get vehicleIds;
  @override
  String get homeworldId;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterDetailCopyWith<_$_CharacterDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
