// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homeworld.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Homeworld {
  String get name => throw _privateConstructorUsedError;
  int get population => throw _privateConstructorUsedError;
  String get climate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeworldCopyWith<Homeworld> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeworldCopyWith<$Res> {
  factory $HomeworldCopyWith(Homeworld value, $Res Function(Homeworld) then) =
      _$HomeworldCopyWithImpl<$Res, Homeworld>;
  @useResult
  $Res call({String name, int population, String climate});
}

/// @nodoc
class _$HomeworldCopyWithImpl<$Res, $Val extends Homeworld>
    implements $HomeworldCopyWith<$Res> {
  _$HomeworldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? population = null,
    Object? climate = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      population: null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as int,
      climate: null == climate
          ? _value.climate
          : climate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeworldCopyWith<$Res> implements $HomeworldCopyWith<$Res> {
  factory _$$_HomeworldCopyWith(
          _$_Homeworld value, $Res Function(_$_Homeworld) then) =
      __$$_HomeworldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int population, String climate});
}

/// @nodoc
class __$$_HomeworldCopyWithImpl<$Res>
    extends _$HomeworldCopyWithImpl<$Res, _$_Homeworld>
    implements _$$_HomeworldCopyWith<$Res> {
  __$$_HomeworldCopyWithImpl(
      _$_Homeworld _value, $Res Function(_$_Homeworld) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? population = null,
    Object? climate = null,
  }) {
    return _then(_$_Homeworld(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as int,
      null == climate
          ? _value.climate
          : climate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Homeworld extends _Homeworld {
  const _$_Homeworld(this.name, this.population, this.climate) : super._();

  @override
  final String name;
  @override
  final int population;
  @override
  final String climate;

  @override
  String toString() {
    return 'Homeworld(name: $name, population: $population, climate: $climate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Homeworld &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.population, population) ||
                other.population == population) &&
            (identical(other.climate, climate) || other.climate == climate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, population, climate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeworldCopyWith<_$_Homeworld> get copyWith =>
      __$$_HomeworldCopyWithImpl<_$_Homeworld>(this, _$identity);
}

abstract class _Homeworld extends Homeworld {
  const factory _Homeworld(
          final String name, final int population, final String climate) =
      _$_Homeworld;
  const _Homeworld._() : super._();

  @override
  String get name;
  @override
  int get population;
  @override
  String get climate;
  @override
  @JsonKey(ignore: true)
  _$$_HomeworldCopyWith<_$_Homeworld> get copyWith =>
      throw _privateConstructorUsedError;
}
