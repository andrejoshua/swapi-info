// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:injectable/injectable.dart";
import "package:mobx/mobx.dart";
import "package:rxdart/rxdart.dart";
import "package:swapiinfo/domain/models/character_detail.dart";
import "package:swapiinfo/domain/models/homeworld.dart";
import "package:swapiinfo/domain/models/starship.dart";
import "package:swapiinfo/domain/models/vehicle.dart";
import "package:swapiinfo/domain/usecase/get_character_by_id.dart";
import "package:swapiinfo/domain/usecase/get_homeworld_by_id.dart";
import "package:swapiinfo/domain/usecase/get_starships_by_ids.dart";
import "package:swapiinfo/domain/usecase/get_vehicles_by_ids.dart";
import "package:swapiinfo/error/custom_exception.dart";
import "package:swapiinfo/error/custom_exception_type.dart";
import "package:swapiinfo/error/handler.dart";

part "vm.g.dart";

@injectable
class CharacterDetailViewModel = _CharacterDetailViewModel
    with _$CharacterDetailViewModel;

abstract class _CharacterDetailViewModel with Store {
  _CharacterDetailViewModel(this._getCharacterById, this._getVehiclesByIds,
      this._getStarshipsByIds, this._getHomeworldById);

  final GetCharacterByIdUseCase _getCharacterById;
  final GetVehiclesByIdsUseCase _getVehiclesByIds;
  final GetStarshipsByIdsUseCase _getStarshipsByIds;
  final GetHomeworldByIdUseCase _getHomeworldById;

  @computed
  String get name => _detail?.name ?? "-";

  @computed
  String get gender => _detail?.gender ?? "-";

  @computed
  List<Vehicle> get vehicles => _vehicles;

  @computed
  List<Starship> get starships => _starships;

  @computed
  Homeworld? get homeworld => _homeworld;

  void setCallbacks(VoidCallback showLoading, VoidCallback hideLoading,
      Function(CustomExceptionType, String?) showError) {
    _showLoading = showLoading;
    _hideLoading = hideLoading;
    _showError = showError;
  }

  @action
  void load(String id) {
    _showLoading?.call();
    _getCharacterById
        .execute(id)
        .handleGenericError((CustomException error) => _onError(error))
        .listen((CharacterDetail value) => _setCharacter(value))
        .addTo(_subscription);
  }

  void destroy() {
    // Removing loading callback
    _showLoading = null;
    _hideLoading = null;
    _subscription.dispose();
  }

  @observable
  @protected
  CharacterDetail? _detail;

  @observable
  @protected
  ObservableList<Vehicle> _vehicles = ObservableList<Vehicle>.of(<Vehicle>[]);

  @observable
  @protected
  ObservableList<Starship> _starships =
      ObservableList<Starship>.of(<Starship>[]);

  @observable
  @protected
  Homeworld? _homeworld;

  VoidCallback? _showLoading;
  VoidCallback? _hideLoading;
  Function(CustomExceptionType, String?)? _showError;

  final CompositeSubscription _subscription = CompositeSubscription();

  @action
  @protected
  void _setCharacter(CharacterDetail detail) {
    _detail = detail;
    _hideLoading?.call();

    _loadStarships(detail.starshipIds);
    _loadVehicles(detail.vehicleIds);
  }

  @action
  @protected
  void _loadVehicles(List<String> vehicleIds) {
    _getVehiclesByIds
        .execute(vehicleIds)
        .handleGenericError((CustomException p0) {
// TODO(Andre): Handle error on vehicle section
    }).listen((List<Vehicle> event) {
      _setVehicles(event);
    }).addTo(_subscription);
  }

  @action
  @protected
  void _setVehicles(List<Vehicle> vehicles) {
    _vehicles.clear();
    _vehicles.addAll(vehicles);
  }

  @action
  @protected
  void _loadStarships(List<String> starshipIds) {
    _getStarshipsByIds
        .execute(starshipIds)
        .handleGenericError((CustomException p0) {
// TODO(Andre): Handle error on starship section
    }).listen((List<Starship> event) {
      _setStarships(event);
    }).addTo(_subscription);
  }

  @action
  @protected
  void _setStarships(List<Starship> starships) {
    _starships.clear();
    _starships.addAll(starships);
  }

  @action
  @protected
  void _loadHomeworld(String id) {
    _getHomeworldById.execute(id).handleGenericError((CustomException p0) {
// TODO(Andre): Handle error on homeworld section
    }).listen((Homeworld event) {
      _setHomeworld(event);
    }).addTo(_subscription);
  }

  @action
  @protected
  void _setHomeworld(Homeworld homeworld) {
    _homeworld = homeworld;
  }

  void _onError(CustomException error) {
    _showError?.call(error.type, error.message);
  }
}
