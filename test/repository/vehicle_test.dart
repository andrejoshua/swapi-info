import "dart:convert";
import "dart:io";

import "package:flutter_test/flutter_test.dart";
import "package:get_it/get_it.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:swapiinfo/data/api/service.dart";
import "package:swapiinfo/data/feature/repository.dart";
import "package:swapiinfo/data/http/client.dart";
import "package:swapiinfo/domain/models/vehicle.dart";
import "package:swapiinfo/domain/repository/repository.dart";

import "people_test.mocks.dart";

final GetIt getIt = GetIt.instance;

// This repository test ensures that the service-to-domain mapping in the repository does not show any errors
@GenerateMocks(<Type>[ApiClient])
void main() {
  group("Repository vehicle test", () {
    setUpAll(() async {
      final MockApiClient stub = MockApiClient();

      final File vehicleFile = File("test_resources/vehicle.json");
      final dynamic vehicleJson = jsonDecode(await vehicleFile.readAsString());

      when(stub.get("vehicles/1")).thenAnswer((_) =>
          Future<Map<String, dynamic>>.delayed(
              const Duration(seconds: 1), () => vehicleJson));

      getIt.registerFactory<ApiService>(() => ApiService(stub));
    });

    // This test ensures that no domain mapping is incorrect
    // The test should be failed if there is any wrong domain mapping
    test("When requesting get single vehicle, return successful mapping",
        () async {
      final Repository service = RepositoryImpl(getIt.get<ApiService>());

      final Vehicle results = await service.getVehicleById("1").single;
      expect(results.name, isNotEmpty);
    });
  });
}
