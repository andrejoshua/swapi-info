import "package:flutter_test/flutter_test.dart";
import "package:get_it/get_it.dart";
import "package:mockito/annotations.dart";
import "package:swapiinfo/domain/models/character.dart";
import "package:swapiinfo/domain/repository/repository.dart";
import "package:swapiinfo/domain/usecase/search_character_by_name.dart";

final GetIt getIt = GetIt.instance;

// These tests is run to ensure the search comes out accurately
@GenerateMocks(<Type>[Repository])
void main() {
  group("Search Usecase test", () {
    final List<Character> allCharacters = <Character>[
      const Character("1", "Luke"),
      const Character("2", "Obi"),
      const Character("3", "Anakin")
    ];

    test("When executing with keyword 'ke', return 1 total result", () async {
      final SearchCharactersByName sut = SearchCharactersByName();

      final List<Character> results =
          await sut.execute("ke", allCharacters).single;

      expect(results.length, 1);
    });

    test("When executing with empty keyword, return all results", () async {
      final SearchCharactersByName sut = SearchCharactersByName();

      final List<Character> results =
          await sut.execute("", allCharacters).single;

      expect(results.length, allCharacters.length);
    });
  });
}
