// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:injectable/injectable.dart";
import "package:mobx/mobx.dart";
import "package:rxdart/rxdart.dart";
import "package:swapiinfo/domain/models/character.dart";
import "package:swapiinfo/domain/usecase/get_characters.dart";
import "package:swapiinfo/domain/usecase/search_character_by_name.dart";
import "package:swapiinfo/error/custom_exception.dart";
import "package:swapiinfo/error/custom_exception_type.dart";
import "package:swapiinfo/error/handler.dart";
import "package:swapiinfo/util/constants.dart";

part "vm.g.dart";

@injectable
class CharactersViewModel = _CharactersViewModel with _$CharactersViewModel;

abstract class _CharactersViewModel with Store {
  _CharactersViewModel(this._getCharacters, this._searchCharacters);

  final GetCharactersUseCase _getCharacters;
  final SearchCharactersByName _searchCharacters;

  @computed
  List<Character> get allCharacters => _allCharacters;

  void setCallbacks(VoidCallback showLoading, VoidCallback hideLoading,
      Function(CustomExceptionType, String?) showError) {
    _showLoading = showLoading;
    _hideLoading = hideLoading;
    _showError = showError;
  }

  @action
  void load() {
    _showLoading?.call();

    // Loads character data
    _getCharacters
        .execute()
        .handleGenericError((CustomException error) => _onError(error))
        .listen((List<Character> value) {
      _setOriginalCharacters(value);
      _setCharacters(value);
    }).addTo(_subscription);

    // The search reaction will be active at load time
    // Once the subject retrieves the keyword, this will later be moved to search characters stream
    _searchOnChange
        .map((String event) => event.trim())
        .distinct()
        .debounceTime(kDurationSearchDebounce)
        .flatMap((String value) =>
            _searchCharacters.execute(value, _originalCharacters))
        .listen((List<Character> value) {
      _setCharacters(value);
    }).addTo(_subscription);
  }

  void setKeyword(String keyword) {
    // We put keyword at the subject
    // The reaction should have been set in the load function
    _searchOnChange.add(keyword);
  }

  void destroy() {
    // Removing loading callback
    _showLoading = null;
    _hideLoading = null;
    _subscription.dispose();
  }

  List<Character> _originalCharacters = <Character>[];

  @observable
  @protected
  ObservableList<Character> _allCharacters =
      ObservableList<Character>.of(<Character>[]);

  VoidCallback? _showLoading;
  VoidCallback? _hideLoading;
  Function(CustomExceptionType, String?)? _showError;

  final BehaviorSubject<String> _searchOnChange = BehaviorSubject<String>();
  final CompositeSubscription _subscription = CompositeSubscription();

  void _setOriginalCharacters(List<Character> characters) {
    _originalCharacters.clear();
    _originalCharacters.addAll(characters);
    _hideLoading?.call();
  }

  @action
  @protected
  void _setCharacters(List<Character> characters) {
    _allCharacters.clear();
    _allCharacters.addAll(characters);
    _hideLoading?.call();
  }

  void _onError(CustomException error) {
    _showError?.call(error.type, error.message);
  }
}
