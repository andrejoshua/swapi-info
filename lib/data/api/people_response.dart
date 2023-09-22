import "package:freezed_annotation/freezed_annotation.dart";

part "people_response.freezed.dart";

part "people_response.g.dart";

@immutable
@Freezed(toJson: false)
class PeopleResponse with _$PeopleResponse {
  const factory PeopleResponse(
    @JsonKey(name: "name") String name,
    @JsonKey(name: "height") String height,
    @JsonKey(name: "mass") String mass,
    @JsonKey(name: "hair_color") String hairColor,
    @JsonKey(name: "skin_color") String skinColor,
    @JsonKey(name: "eye_color") String eyeColor,
    @JsonKey(name: "birth_year") String birthYear,
    @JsonKey(name: "gender") String gender,
    @JsonKey(name: "homeworld") String homeWorldUrl,
    @JsonKey(name: "films") List<String> films,
    @JsonKey(name: "species") List<String> species,
    @JsonKey(name: "vehicles") List<String> vehicles,
    @JsonKey(name: "starships") List<String> starships,
    @JsonKey(name: "created") String createdDate,
    @JsonKey(name: "edited") String updatedDate,
    @JsonKey(name: "url") String url,
  ) = _PeopleResponse;

  const PeopleResponse._();

  factory PeopleResponse.fromJson(Map<String, dynamic> json) =>
      _$PeopleResponseFromJson(json);
}
