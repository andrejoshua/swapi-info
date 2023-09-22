import "package:injectable/injectable.dart";
import "package:rxdart_ext/rxdart_ext.dart";

import "../models/homeworld.dart";
import "../repository/repository.dart";

@injectable
class GetHomeworldByIdUseCase {
  final Repository _repository;

  GetHomeworldByIdUseCase(this._repository);

  Single<Homeworld> execute(String id) {
    return _repository.getHomeworldById(id);
  }
}
