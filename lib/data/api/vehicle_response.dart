import "package:freezed_annotation/freezed_annotation.dart";

part "vehicle_response.freezed.dart";

part "vehicle_response.g.dart";

@immutable
@Freezed(toJson: false)
class VehicleResponse with _$VehicleResponse {
  const factory VehicleResponse(
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
    @JsonKey(name: "vehicle_class") String vehicleClass,
    @JsonKey(name: "pilots") List<String> pilots,
    @JsonKey(name: "films") List<String> films,
    @JsonKey(name: "created") String createdDate,
    @JsonKey(name: "edited") String updatedDate,
    @JsonKey(name: "url") String url,
  ) = _VehicleResponse;

  const VehicleResponse._();

  factory VehicleResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleResponseFromJson(json);
}
