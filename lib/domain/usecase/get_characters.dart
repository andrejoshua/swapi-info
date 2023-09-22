import "package:injectable/injectable.dart";
import "package:rxdart_ext/rxdart_ext.dart";

import "../models/character.dart";
import "../repository/repository.dart";

@injectable
class GetCharactersUseCase {
  final Repository _repository;

  GetCharactersUseCase(this._repository);

  Single<List<Character>> execute() {
    return _repository.getCharacters();
  }
}
