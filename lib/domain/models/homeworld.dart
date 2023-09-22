import "package:freezed_annotation/freezed_annotation.dart";

part "homeworld.freezed.dart";

@immutable
@freezed
class Homeworld with _$Homeworld {
  const factory Homeworld(
    String name,
    int population,
    String climate,
  ) = _Homeworld;

  const Homeworld._();
}
