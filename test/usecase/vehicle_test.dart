import "package:flutter_test/flutter_test.dart";
import "package:get_it/get_it.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:rxdart_ext/rxdart_ext.dart";
import "package:swapiinfo/domain/models/vehicle.dart";
import "package:swapiinfo/domain/repository/repository.dart";
import "package:swapiinfo/domain/usecase/get_vehicles_by_ids.dart";

import "vehicle_test.mocks.dart";

final GetIt getIt = GetIt.instance;

@GenerateMocks(<Type>[Repository])
void main() {
  group("Vehicle Usecase Test", () {
    setUp(() {
      final MockRepository stub = MockRepository();
      when(stub.getVehicleById(any)).thenAnswer((_) => Single<Vehicle>.value(
          const Vehicle("Snowspeeder", "t-47 airspeeder", 2000)));

      getIt.registerFactory<Repository>(() => stub);
    });

    // This test is run just to ensure the zip method runs correctly
    test("When executing with 5 ids, return 5 total results", () async {
      final GetVehiclesByIdsUseCase sut =
          GetVehiclesByIdsUseCase(getIt.get<Repository>());

      final List<Vehicle> results =
          await sut.execute(<String>["1", "2", "3", "4", "5"]).single;

      expect(results.length, 5);
    });
  });
}
