import "package:freezed_annotation/freezed_annotation.dart";

part "starship.freezed.dart";

@immutable
@freezed
class Starship with _$Starship {
  const factory Starship(
    String model,
    String starshipClass,
    double hyperdriveRating,
    int costInCredits,
    String manufacturer,
  ) = _Starship;

  const Starship._();
}
