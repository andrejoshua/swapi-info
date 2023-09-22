import "package:freezed_annotation/freezed_annotation.dart";

part "character_detail.freezed.dart";

// To ensure smooth experience
// Starships, vehicles, and homeworld are going to be loaded separately
@immutable
@freezed
class CharacterDetail with _$CharacterDetail {
  const factory CharacterDetail(
    String name,
    String gender,
    List<String> starshipIds,
    List<String> vehicleIds,
    String homeworldId,
  ) = _CharacterDetail;

  const CharacterDetail._();
}
