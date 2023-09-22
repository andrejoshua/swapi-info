import "package:injectable/injectable.dart";
import "package:rxdart_ext/rxdart_ext.dart";

import "../models/starship.dart";
import "../repository/repository.dart";

@injectable
class GetStarshipsByIdsUseCase {
  final Repository _repository;

  GetStarshipsByIdsUseCase(this._repository);

  Single<List<Starship>> execute(List<String> ids) {
    return _repository.getStarshipsByIds(ids);
  }
}
