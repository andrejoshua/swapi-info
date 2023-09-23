import "package:flutter_test/flutter_test.dart";
import "package:get_it/get_it.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:rxdart_ext/rxdart_ext.dart";
import "package:swapiinfo/domain/models/starship.dart";
import "package:swapiinfo/domain/repository/repository.dart";
import "package:swapiinfo/domain/usecase/get_starships_by_ids.dart";

import "starship_test.mocks.dart";

final GetIt getIt = GetIt.instance;

@GenerateMocks(<Type>[Repository])
void main() {
  group("Starship Usecase test", () {
    setUp(() {
      final MockRepository stub = MockRepository();
      when(stub.getStarshipById(any)).thenAnswer((_) => Single<Starship>.value(
          const Starship(
              "X-wing", "Starfighter", 1.0, 1000, "Incom Corporation")));

      getIt.registerFactory<Repository>(() => stub);
    });

    // This test is run just to ensure the zip method runs correctly
    test("When executing with 5 ids, return 5 total results", () async {
      final GetStarshipsByIdsUseCase sut =
          GetStarshipsByIdsUseCase(getIt.get<Repository>());

      final List<Starship> results =
          await sut.execute(<String>["1", "2", "3", "4", "5"]).single;

      expect(results.length, 5);
    });
  });
}
