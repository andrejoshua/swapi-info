import "package:injectable/injectable.dart";
import "package:rxdart_ext/rxdart_ext.dart";
import "package:swapiinfo/data/api/list_response.dart";
import "package:swapiinfo/data/api/planet_response.dart";
import "package:swapiinfo/data/api/vehicle_response.dart";
import "package:swapiinfo/data/http/client.dart";

import "people_response.dart";
import "starship_response.dart";

@injectable
class ApiService {
  final ApiClient _client;

  ApiService(this._client);

  Single<ListResponse<PeopleResponse>> getPeoples() {
    return Single<ListResponse<PeopleResponse>>.fromFuture(
        _client.get("people/").then((Map<String, dynamic> value) {
      return ListResponse<PeopleResponse>.fromJson(value, (Object? json) {
        return PeopleResponse.fromJson(json! as Map<String, dynamic>);
      });
    }));
  }

  Single<PeopleResponse> getPeople(String id) {
    return Single<PeopleResponse>.fromFuture(
        _client.get("people/$id").then((Map<String, dynamic> value) {
      return PeopleResponse.fromJson(value);
    }));
  }

  Single<PlanetResponse> getPlanet(String id) {
    return Single<PlanetResponse>.fromFuture(
        _client.get("planets/$id").then((Map<String, dynamic> value) {
      return PlanetResponse.fromJson(value);
    }));
  }

  Single<StarshipResponse> getStarship(String id) {
    return Single<StarshipResponse>.fromFuture(
        _client.get("starships/$id").then((Map<String, dynamic> value) {
      return StarshipResponse.fromJson(value);
    }));
  }

  Single<VehicleResponse> getVehicle(String id) {
    return Single<VehicleResponse>.fromFuture(
        _client.get("vehicles/$id").then((Map<String, dynamic> value) {
      return VehicleResponse.fromJson(value);
    }));
  }
}
