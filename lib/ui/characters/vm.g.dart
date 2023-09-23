// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersViewModel on _CharactersViewModel, Store {
  Computed<List<Character>>? _$allCharactersComputed;

  @override
  List<Character> get allCharacters => (_$allCharactersComputed ??=
          Computed<List<Character>>(() => super.allCharacters,
              name: '_CharactersViewModel.allCharacters'))
      .value;

  late final _$_allCharactersAtom =
      Atom(name: '_CharactersViewModel._allCharacters', context: context);

  @override
  ObservableList<Character> get _allCharacters {
    _$_allCharactersAtom.reportRead();
    return super._allCharacters;
  }

  @override
  set _allCharacters(ObservableList<Character> value) {
    _$_allCharactersAtom.reportWrite(value, super._allCharacters, () {
      super._allCharacters = value;
    });
  }

  late final _$_CharactersViewModelActionController =
      ActionController(name: '_CharactersViewModel', context: context);

  @override
  void load() {
    final _$actionInfo = _$_CharactersViewModelActionController.startAction(
        name: '_CharactersViewModel.load');
    try {
      return super.load();
    } finally {
      _$_CharactersViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  @protected
  void _setCharacters(List<Character> characters) {
    final _$actionInfo = _$_CharactersViewModelActionController.startAction(
        name: '_CharactersViewModel._setCharacters');
    try {
      return super._setCharacters(characters);
    } finally {
      _$_CharactersViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allCharacters: ${allCharacters}
    ''';
  }
}
