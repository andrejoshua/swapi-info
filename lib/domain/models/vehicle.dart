import "package:freezed_annotation/freezed_annotation.dart";

part "vehicle.freezed.dart";

@immutable
@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle(
    String name,
    String model,
    int costInCredits,
  ) = _Vehicle;

  const Vehicle._();
}
