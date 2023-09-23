import "package:injectable/injectable.dart";
import "package:rxdart_ext/rxdart_ext.dart";
import "package:swapiinfo/data/api/list_response.dart";
import "package:swapiinfo/data/api/mapper.dart";
import "package:swapiinfo/data/api/people_response.dart";
import "package:swapiinfo/data/api/planet_response.dart";
import "package:swapiinfo/data/api/service.dart";
import "package:swapiinfo/data/api/starship_response.dart";
import "package:swapiinfo/data/api/vehicle_response.dart";
import "package:swapiinfo/domain/models/character.dart";
import "package:swapiinfo/domain/models/character_detail.dart";
import "package:swapiinfo/domain/models/homeworld.dart";
import "package:swapiinfo/domain/models/starship.dart";
import "package:swapiinfo/domain/models/vehicle.dart";
import "package:swapiinfo/domain/repository/repository.dart";

@Injectable(as: Repository)
class RepositoryImpl implements Repository {
  final ApiService _service;

  RepositoryImpl(this._service);

  @override
  Single<List<Character>> getCharacters() {
    return _service.getPeoples().map((ListResponse<PeopleResponse> event) {
      final List<PeopleResponse> results = event.results;

      return results.map((PeopleResponse item) {
        return item.asCharacter();
      }).toList(growable: false);
    });
  }

  @override
  Single<CharacterDetail> getCharacterById(String id) {
    return _service.getPeople(id).map((PeopleResponse event) {
      return event.asCharacterDetail();
    });
  }

  @override
  Single<Starship> getStarshipById(String id) {
    return _service
        .getStarship(id)
        .map((StarshipResponse event) => event.asStarship());
  }

  @override
  Single<Vehicle> getVehicleById(String id) {
    return _service
        .getVehicle(id)
        .map((VehicleResponse event) => event.asVehicle());
  }

  @override
  Single<Homeworld> getHomeworldById(String id) {
    return _service
        .getPlanet(id)
        .map((PlanetResponse event) => event.asHomeworld());
  }
}
