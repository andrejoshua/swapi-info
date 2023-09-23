// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:injectable/injectable.dart";
import "package:mobx/mobx.dart";
import "package:rxdart/rxdart.dart";
import "package:swapiinfo/domain/models/character.dart";
import "package:swapiinfo/domain/usecase/get_characters.dart";
import "package:swapiinfo/error/custom_exception.dart";
import "package:swapiinfo/error/custom_exception_type.dart";
import "package:swapiinfo/error/handler.dart";

part "vm.g.dart";

@injectable
class CharactersViewModel = _CharactersViewModel with _$CharactersViewModel;

abstract class _CharactersViewModel with Store {
  _CharactersViewModel(this._getCharacters);

  final GetCharactersUseCase _getCharacters;

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
    _getCharacters
        .execute()
        .handleGenericError((CustomException error) => _onError(error))
        .listen((List<Character> value) => _setCharacters(value))
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
  ObservableList<Character> _allCharacters =
      ObservableList<Character>.of(<Character>[]);

  VoidCallback? _showLoading;
  VoidCallback? _hideLoading;
  Function(CustomExceptionType, String?)? _showError;

  final CompositeSubscription _subscription = CompositeSubscription();

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
