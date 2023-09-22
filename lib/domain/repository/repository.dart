import "package:rxdart_ext/rxdart_ext.dart";

import "../models/character.dart";
import "../models/character_detail.dart";
import "../models/homeworld.dart";
import "../models/starship.dart";
import "../models/vehicle.dart";

mixin Repository {
  Single<List<Character>> getCharacters();

  Single<CharacterDetail> getCharacterById(String id);

  Single<List<Starship>> getStarshipsByIds(List<String> ids);

  Single<List<Vehicle>> getVehiclesByIds(List<String> ids);

  Single<Homeworld> getHomeworldById(String id);
}
