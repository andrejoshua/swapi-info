import "package:swapiinfo/data/api/people_response.dart";
import "package:swapiinfo/data/api/planet_response.dart";
import "package:swapiinfo/data/api/starship_response.dart";
import "package:swapiinfo/data/api/vehicle_response.dart";
import "package:swapiinfo/domain/models/character.dart";
import "package:swapiinfo/domain/models/character_detail.dart";
import "package:swapiinfo/domain/models/homeworld.dart";
import "package:swapiinfo/domain/models/starship.dart";
import "package:swapiinfo/domain/models/vehicle.dart";
import "package:swapiinfo/util/string_extensions.dart";

extension PeopleMapperExt on PeopleResponse {
  Character asCharacter() {
    return Character(url.getId(), name);
  }

  CharacterDetail asCharacterDetail() {
    final List<String> starshipIds =
        starships.map((String e) => e.getId()).toList(growable: false);
    final List<String> vehicleIds =
        vehicles.map((String e) => e.getId()).toList(growable: false);
    return CharacterDetail(
        name, gender, starshipIds, vehicleIds, homeWorldUrl.getId());
  }
}

extension StarshipMapperExt on StarshipResponse {
  Starship asStarship() {
    return Starship(model, starshipClass, double.parse(hyperdriveRating),
        int.tryParse(costInCredits), manufacturer);
  }
}

extension VehicleMapperExt on VehicleResponse {
  Vehicle asVehicle() {
    return Vehicle(name, model, int.tryParse(costInCredits));
  }
}

extension PlanetMapperExt on PlanetResponse {
  Homeworld asHomeworld() {
    return Homeworld(name, int.parse(population), climate);
  }
}
