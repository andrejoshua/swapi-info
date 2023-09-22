import "package:freezed_annotation/freezed_annotation.dart";

part "starship_response.freezed.dart";

part "starship_response.g.dart";

@immutable
@Freezed(toJson: false)
class StarshipResponse with _$StarshipResponse {
  const factory StarshipResponse(
    @JsonKey(name: "name") String name,
    @JsonKey(name: "model") String model,
    @JsonKey(name: "manufacturer") String manufacturer,
    @JsonKey(name: "cost_in_credits") String costInCredits,
    @JsonKey(name: "length") String length,
    @JsonKey(name: "max_atmosphering_speed") String maxAtmospheringSpeed,
    @JsonKey(name: "crew") String crew,
    @JsonKey(name: "passengers") String passengersCount,
    @JsonKey(name: "cargo_capacity") String cargoCapacity,
    @JsonKey(name: "consumables") String consumables,
    @JsonKey(name: "hyperdrive_rating") String hyperdriveRating,
    @JsonKey(name: "MGLT") String mglt,
    @JsonKey(name: "starship_class") String starshipClass,
    @JsonKey(name: "pilots") List<String> pilots,
    @JsonKey(name: "films") List<String> films,
    @JsonKey(name: "created") String createdDate,
    @JsonKey(name: "edited") String updatedDate,
    @JsonKey(name: "url") String url,
  ) = _StarshipResponse;

  const StarshipResponse._();

  factory StarshipResponse.fromJson(Map<String, dynamic> json) =>
      _$StarshipResponseFromJson(json);
}
