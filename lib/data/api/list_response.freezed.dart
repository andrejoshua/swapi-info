// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListResponse<T> _$ListResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ListResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ListResponse<T> {
  @JsonKey(name: "count")
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: "next")
  String? get next => throw _privateConstructorUsedError;
  @JsonKey(name: "previous")
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: "results")
  List<T> get results => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListResponseCopyWith<T, ListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListResponseCopyWith<T, $Res> {
  factory $ListResponseCopyWith(
          ListResponse<T> value, $Res Function(ListResponse<T>) then) =
      _$ListResponseCopyWithImpl<T, $Res, ListResponse<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: "count") int count,
      @JsonKey(name: "next") String? next,
      @JsonKey(name: "previous") String? previous,
      @JsonKey(name: "results") List<T> results});
}

/// @nodoc
class _$ListResponseCopyWithImpl<T, $Res, $Val extends ListResponse<T>>
    implements $ListResponseCopyWith<T, $Res> {
  _$ListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListResponseCopyWith<T, $Res>
    implements $ListResponseCopyWith<T, $Res> {
  factory _$$_ListResponseCopyWith(
          _$_ListResponse<T> value, $Res Function(_$_ListResponse<T>) then) =
      __$$_ListResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "count") int count,
      @JsonKey(name: "next") String? next,
      @JsonKey(name: "previous") String? previous,
      @JsonKey(name: "results") List<T> results});
}

/// @nodoc
class __$$_ListResponseCopyWithImpl<T, $Res>
    extends _$ListResponseCopyWithImpl<T, $Res, _$_ListResponse<T>>
    implements _$$_ListResponseCopyWith<T, $Res> {
  __$$_ListResponseCopyWithImpl(
      _$_ListResponse<T> _value, $Res Function(_$_ListResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$_ListResponse<T>(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class _$_ListResponse<T> extends _ListResponse<T> {
  const _$_ListResponse(
      @JsonKey(name: "count") this.count,
      @JsonKey(name: "next") this.next,
      @JsonKey(name: "previous") this.previous,
      @JsonKey(name: "results") final List<T> results)
      : _results = results,
        super._();

  factory _$_ListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_ListResponseFromJson(json, fromJsonT);

  @override
  @JsonKey(name: "count")
  final int count;
  @override
  @JsonKey(name: "next")
  final String? next;
  @override
  @JsonKey(name: "previous")
  final String? previous;
  final List<T> _results;
  @override
  @JsonKey(name: "results")
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'ListResponse<$T>(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListResponse<T> &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListResponseCopyWith<T, _$_ListResponse<T>> get copyWith =>
      __$$_ListResponseCopyWithImpl<T, _$_ListResponse<T>>(this, _$identity);
}

abstract class _ListResponse<T> extends ListResponse<T> {
  const factory _ListResponse(
      @JsonKey(name: "count") final int count,
      @JsonKey(name: "next") final String? next,
      @JsonKey(name: "previous") final String? previous,
      @JsonKey(name: "results") final List<T> results) = _$_ListResponse<T>;
  const _ListResponse._() : super._();

  factory _ListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_ListResponse<T>.fromJson;

  @override
  @JsonKey(name: "count")
  int get count;
  @override
  @JsonKey(name: "next")
  String? get next;
  @override
  @JsonKey(name: "previous")
  String? get previous;
  @override
  @JsonKey(name: "results")
  List<T> get results;
  @override
  @JsonKey(ignore: true)
  _$$_ListResponseCopyWith<T, _$_ListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
