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
  Single<List<Starship>> getStarshipsByIds(List<String> ids) {
    final List<Single<StarshipResponse>> idObs = ids.map((String id) {
      return _service.getStarship(id);
    }).toList(growable: false);

    return Rx.zip(idObs, (List<StarshipResponse> values) {
      return values.map((StarshipResponse item) {
        return item.asStarship();
      }).toList(growable: false);
    }).singleOrError();
  }

  @override
  Single<List<Vehicle>> getVehiclesByIds(List<String> ids) {
    final List<Single<VehicleResponse>> idObs = ids.map((String id) {
      return _service.getVehicle(id);
    }).toList(growable: false);

    return Rx.zip(idObs, (List<VehicleResponse> values) {
      return values.map((VehicleResponse item) {
        return item.asVehicle();
      }).toList(growable: false);
    }).singleOrError();
  }

  @override
  Single<Homeworld> getHomeworldById(String id) {
    return _service.getPlanet(id).map((PlanetResponse event) {
      return event.asHomeworld();
    });
  }
}
