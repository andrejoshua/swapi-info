// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterDetailViewModel on _CharacterDetailViewModel, Store {
  Computed<String>? _$nameComputed;

  @override
  String get name => (_$nameComputed ??= Computed<String>(() => super.name,
          name: '_CharacterDetailViewModel.name'))
      .value;
  Computed<String>? _$genderComputed;

  @override
  String get gender =>
      (_$genderComputed ??= Computed<String>(() => super.gender,
              name: '_CharacterDetailViewModel.gender'))
          .value;
  Computed<List<Vehicle>>? _$vehiclesComputed;

  @override
  List<Vehicle> get vehicles =>
      (_$vehiclesComputed ??= Computed<List<Vehicle>>(() => super.vehicles,
              name: '_CharacterDetailViewModel.vehicles'))
          .value;
  Computed<List<Starship>>? _$starshipsComputed;

  @override
  List<Starship> get starships =>
      (_$starshipsComputed ??= Computed<List<Starship>>(() => super.starships,
              name: '_CharacterDetailViewModel.starships'))
          .value;
  Computed<Homeworld?>? _$homeworldComputed;

  @override
  Homeworld? get homeworld =>
      (_$homeworldComputed ??= Computed<Homeworld?>(() => super.homeworld,
              name: '_CharacterDetailViewModel.homeworld'))
          .value;

  late final _$_detailAtom =
      Atom(name: '_CharacterDetailViewModel._detail', context: context);

  @override
  CharacterDetail? get _detail {
    _$_detailAtom.reportRead();
    return super._detail;
  }

  @override
  set _detail(CharacterDetail? value) {
    _$_detailAtom.reportWrite(value, super._detail, () {
      super._detail = value;
    });
  }

  late final _$_vehiclesAtom =
      Atom(name: '_CharacterDetailViewModel._vehicles', context: context);

  @override
  ObservableList<Vehicle> get _vehicles {
    _$_vehiclesAtom.reportRead();
    return super._vehicles;
  }

  @override
  set _vehicles(ObservableList<Vehicle> value) {
    _$_vehiclesAtom.reportWrite(value, super._vehicles, () {
      super._vehicles = value;
    });
  }

  late final _$_starshipsAtom =
      Atom(name: '_CharacterDetailViewModel._starships', context: context);

  @override
  ObservableList<Starship> get _starships {
    _$_starshipsAtom.reportRead();
    return super._starships;
  }

  @override
  set _starships(ObservableList<Starship> value) {
    _$_starshipsAtom.reportWrite(value, super._starships, () {
      super._starships = value;
    });
  }

  late final _$_homeworldAtom =
      Atom(name: '_CharacterDetailViewModel._homeworld', context: context);

  @override
  Homeworld? get _homeworld {
    _$_homeworldAtom.reportRead();
    return super._homeworld;
  }

  @override
  set _homeworld(Homeworld? value) {
    _$_homeworldAtom.reportWrite(value, super._homeworld, () {
      super._homeworld = value;
    });
  }

  late final _$_CharacterDetailViewModelActionController =
      ActionController(name: '_CharacterDetailViewModel', context: context);

  @override
  void load(String id) {
    final _$actionInfo = _$_CharacterDetailViewModelActionController
        .startAction(name: '_CharacterDetailViewModel.load');
    try {
      return super.load(id);
    } finally {
      _$_CharacterDetailViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  @protected
  void _setCharacter(CharacterDetail detail) {
    final _$actionInfo = _$_CharacterDetailViewModelActionController
        .startAction(name: '_CharacterDetailViewModel._setCharacter');
    try {
      return super._setCharacter(detail);
    } finally {
      _$_CharacterDetailViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  @protected
  void _loadVehicles(List<String> vehicleIds) {
    final _$actionInfo = _$_CharacterDetailViewModelActionController
        .startAction(name: '_CharacterDetailViewModel._loadVehicles');
    try {
      return super._loadVehicles(vehicleIds);
    } finally {
      _$_CharacterDetailViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  @protected
  void _setVehicles(List<Vehicle> vehicles) {
    final _$actionInfo = _$_CharacterDetailViewModelActionController
        .startAction(name: '_CharacterDetailViewModel._setVehicles');
    try {
      return super._setVehicles(vehicles);
    } finally {
      _$_CharacterDetailViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  @protected
  void _loadStarships(List<String> starshipIds) {
    final _$actionInfo = _$_CharacterDetailViewModelActionController
        .startAction(name: '_CharacterDetailViewModel._loadStarships');
    try {
      return super._loadStarships(starshipIds);
    } finally {
      _$_CharacterDetailViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  @protected
  void _setStarships(List<Starship> starships) {
    final _$actionInfo = _$_CharacterDetailViewModelActionController
        .startAction(name: '_CharacterDetailViewModel._setStarships');
    try {
      return super._setStarships(starships);
    } finally {
      _$_CharacterDetailViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  @protected
  void _loadHomeworld(String id) {
    final _$actionInfo = _$_CharacterDetailViewModelActionController
        .startAction(name: '_CharacterDetailViewModel._loadHomeworld');
    try {
      return super._loadHomeworld(id);
    } finally {
      _$_CharacterDetailViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  @protected
  void _setHomeworld(Homeworld homeworld) {
    final _$actionInfo = _$_CharacterDetailViewModelActionController
        .startAction(name: '_CharacterDetailViewModel._setHomeworld');
    try {
      return super._setHomeworld(homeworld);
    } finally {
      _$_CharacterDetailViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
gender: ${gender},
vehicles: ${vehicles},
starships: ${starships},
homeworld: ${homeworld}
    ''';
  }
}
