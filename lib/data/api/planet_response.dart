import "package:freezed_annotation/freezed_annotation.dart";

part "planet_response.freezed.dart";

part "planet_response.g.dart";

@immutable
@Freezed(toJson: false)
class PlanetResponse with _$PlanetResponse {
  const factory PlanetResponse(
    @JsonKey(name: "name") String name,
    @JsonKey(name: "rotation_period") String rotationPeriod,
    @JsonKey(name: "orbital_period") String orbitalPeriod,
    @JsonKey(name: "diameter") String diameter,
    @JsonKey(name: "climate") String climate,
    @JsonKey(name: "gravity") String gravity,
    @JsonKey(name: "terrain") String terrain,
    @JsonKey(name: "surface_water") String surfaceWater,
    @JsonKey(name: "population") String population,
    @JsonKey(name: "residents") List<String> residents,
    @JsonKey(name: "films") List<String> films,
    @JsonKey(name: "created") String createdDate,
    @JsonKey(name: "edited") String updatedDate,
    @JsonKey(name: "url") String url,
  ) = _PlanetResponse;

  const PlanetResponse._();

  factory PlanetResponse.fromJson(Map<String, dynamic> json) =>
      _$PlanetResponseFromJson(json);
}
