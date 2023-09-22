import "package:freezed_annotation/freezed_annotation.dart";

part "character.freezed.dart";

@immutable
@freezed
class Character with _$Character {
  const factory Character(
    String id,
    String name,
  ) = _Character;

  const Character._();
}
