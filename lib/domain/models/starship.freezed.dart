// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'starship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Starship {
  String get model => throw _privateConstructorUsedError;
  String get starshipClass => throw _privateConstructorUsedError;
  double get hyperdriveRating =>
      throw _privateConstructorUsedError; // Cost in credits may return unknown
  int? get costInCredits => throw _privateConstructorUsedError;
  String get manufacturer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StarshipCopyWith<Starship> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarshipCopyWith<$Res> {
  factory $StarshipCopyWith(Starship value, $Res Function(Starship) then) =
      _$StarshipCopyWithImpl<$Res, Starship>;
  @useResult
  $Res call(
      {String model,
      String starshipClass,
      double hyperdriveRating,
      int? costInCredits,
      String manufacturer});
}

/// @nodoc
class _$StarshipCopyWithImpl<$Res, $Val extends Starship>
    implements $StarshipCopyWith<$Res> {
  _$StarshipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? starshipClass = null,
    Object? hyperdriveRating = null,
    Object? costInCredits = freezed,
    Object? manufacturer = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      starshipClass: null == starshipClass
          ? _value.starshipClass
          : starshipClass // ignore: cast_nullable_to_non_nullable
              as String,
      hyperdriveRating: null == hyperdriveRating
          ? _value.hyperdriveRating
          : hyperdriveRating // ignore: cast_nullable_to_non_nullable
              as double,
      costInCredits: freezed == costInCredits
          ? _value.costInCredits
          : costInCredits // ignore: cast_nullable_to_non_nullable
              as int?,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StarshipCopyWith<$Res> implements $StarshipCopyWith<$Res> {
  factory _$$_StarshipCopyWith(
          _$_Starship value, $Res Function(_$_Starship) then) =
      __$$_StarshipCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      String starshipClass,
      double hyperdriveRating,
      int? costInCredits,
      String manufacturer});
}

/// @nodoc
class __$$_StarshipCopyWithImpl<$Res>
    extends _$StarshipCopyWithImpl<$Res, _$_Starship>
    implements _$$_StarshipCopyWith<$Res> {
  __$$_StarshipCopyWithImpl(
      _$_Starship _value, $Res Function(_$_Starship) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? starshipClass = null,
    Object? hyperdriveRating = null,
    Object? costInCredits = freezed,
    Object? manufacturer = null,
  }) {
    return _then(_$_Starship(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      null == starshipClass
          ? _value.starshipClass
          : starshipClass // ignore: cast_nullable_to_non_nullable
              as String,
      null == hyperdriveRating
          ? _value.hyperdriveRating
          : hyperdriveRating // ignore: cast_nullable_to_non_nullable
              as double,
      freezed == costInCredits
          ? _value.costInCredits
          : costInCredits // ignore: cast_nullable_to_non_nullable
              as int?,
      null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Starship extends _Starship {
  const _$_Starship(this.model, this.starshipClass, this.hyperdriveRating,
      this.costInCredits, this.manufacturer)
      : super._();

  @override
  final String model;
  @override
  final String starshipClass;
  @override
  final double hyperdriveRating;
// Cost in credits may return unknown
  @override
  final int? costInCredits;
  @override
  final String manufacturer;

  @override
  String toString() {
    return 'Starship(model: $model, starshipClass: $starshipClass, hyperdriveRating: $hyperdriveRating, costInCredits: $costInCredits, manufacturer: $manufacturer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Starship &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.starshipClass, starshipClass) ||
                other.starshipClass == starshipClass) &&
            (identical(other.hyperdriveRating, hyperdriveRating) ||
                other.hyperdriveRating == hyperdriveRating) &&
            (identical(other.costInCredits, costInCredits) ||
                other.costInCredits == costInCredits) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, starshipClass,
      hyperdriveRating, costInCredits, manufacturer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StarshipCopyWith<_$_Starship> get copyWith =>
      __$$_StarshipCopyWithImpl<_$_Starship>(this, _$identity);
}

abstract class _Starship extends Starship {
  const factory _Starship(
      final String model,
      final String starshipClass,
      final double hyperdriveRating,
      final int? costInCredits,
      final String manufacturer) = _$_Starship;
  const _Starship._() : super._();

  @override
  String get model;
  @override
  String get starshipClass;
  @override
  double get hyperdriveRating;
  @override // Cost in credits may return unknown
  int? get costInCredits;
  @override
  String get manufacturer;
  @override
  @JsonKey(ignore: true)
  _$$_StarshipCopyWith<_$_Starship> get copyWith =>
      throw _privateConstructorUsedError;
}
