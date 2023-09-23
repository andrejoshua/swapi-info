import "dart:convert";
import "dart:io";

import "package:flutter_test/flutter_test.dart";
import "package:get_it/get_it.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:swapiinfo/data/api/service.dart";
import "package:swapiinfo/data/feature/repository.dart";
import "package:swapiinfo/data/http/client.dart";
import "package:swapiinfo/domain/models/character.dart";
import "package:swapiinfo/domain/models/character_detail.dart";
import "package:swapiinfo/domain/repository/repository.dart";

import "people_test.mocks.dart";

final GetIt getIt = GetIt.instance;

// This repository test ensures that the service-to-domain mapping in the repository does not show any errors
@GenerateMocks(<Type>[ApiClient])
void main() {
  group("Repository people test", () {
    setUpAll(() async {
      final MockApiClient stub = MockApiClient();

      final File peoplesFile = File("test_resources/peoples.json");
      final dynamic peoplesJson = jsonDecode(await peoplesFile.readAsString());

      when(stub.get("people/")).thenAnswer((_) =>
          Future<Map<String, dynamic>>.delayed(
              const Duration(seconds: 1), () => peoplesJson));

      final File peopleFile = File("test_resources/people.json");
      final dynamic peopleJson = jsonDecode(await peopleFile.readAsString());

      when(stub.get("people/1")).thenAnswer((_) =>
          Future<Map<String, dynamic>>.delayed(
              const Duration(seconds: 1), () => peopleJson));

      getIt.registerFactory<ApiService>(() => ApiService(stub));
    });

    // This test ensures that no domain mapping is incorrect
    // The test should be failed if there is any wrong domain mapping
    test("When requesting get multiple people, return successful mapping",
        () async {
      final Repository service = RepositoryImpl(getIt.get<ApiService>());

      final List<Character> results = await service.getCharacters().single;

      expect(results, isNotEmpty);
    });

    // This test ensures that no domain mapping is incorrect
    // The test should be failed if there is any wrong domain mapping
    test("When requesting get single people, return successful mapping",
        () async {
      final Repository service = RepositoryImpl(getIt.get<ApiService>());

      final CharacterDetail result = await service.getCharacterById("1").single;
      expect(result.name, isNotEmpty);
    });
  });
}
