import "package:freezed_annotation/freezed_annotation.dart";

part "list_response.freezed.dart";

part "list_response.g.dart";

@immutable
@Freezed(toJson: false, genericArgumentFactories: true)
class ListResponse<T> with _$ListResponse<T> {
  const factory ListResponse(
    @JsonKey(name: "count") int count,
    @JsonKey(name: "next") String? next,
    @JsonKey(name: "previous") String? previous,
    @JsonKey(name: "results") List<T> results,
  ) = _ListResponse<T>;

  const ListResponse._();

  factory ListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ListResponseFromJson(json, fromJsonT);
}
