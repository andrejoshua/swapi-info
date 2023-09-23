import "package:freezed_annotation/freezed_annotation.dart";

part "vehicle.freezed.dart";

@immutable
@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle(
    String name,
    String model,
    // Cost in credits may return unknown
    int? costInCredits,
  ) = _Vehicle;

  const Vehicle._();
}
