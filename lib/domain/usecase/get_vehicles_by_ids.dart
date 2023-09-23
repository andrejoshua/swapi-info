import "package:injectable/injectable.dart";
import "package:rxdart_ext/rxdart_ext.dart";

import "../models/vehicle.dart";
import "../repository/repository.dart";

@injectable
class GetVehiclesByIdsUseCase {
  final Repository _repository;

  GetVehiclesByIdsUseCase(this._repository);

  Single<List<Vehicle>> execute(List<String> ids) {
    final List<Single<Vehicle>> idObs = ids.map((String id) {
      return _repository.getVehicleById(id);
    }).toList(growable: false);

    return Rx.zip(idObs, (List<Vehicle> values) => values).singleOrError();
  }
}
