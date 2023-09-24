import "package:injectable/injectable.dart";
import "package:rxdart_ext/rxdart_ext.dart";
import "package:swapiinfo/domain/models/character.dart";

@injectable
class SearchCharactersByName {
  Single<List<Character>> execute(String keyword, List<Character> data) {
    return Single<List<Character>>.fromCallable(() => data
        .where((Character element) =>
            element.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList(growable: false));
  }
}
