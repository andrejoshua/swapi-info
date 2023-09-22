import "package:injectable/injectable.dart";
import "package:rxdart_ext/rxdart_ext.dart";

import "../models/character_detail.dart";
import "../repository/repository.dart";

@injectable
class GetCharacterByIdUseCase {
  final Repository _repository;

  GetCharacterByIdUseCase(this._repository);

  Single<CharacterDetail> execute(String id) {
    return _repository.getCharacterById(id);
  }
}
