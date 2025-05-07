import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

part 'store.mapper.dart';

class Store {
  final SharedPreferences _prefs;
  static const String _rankedCharactersKey = 'ranked_characters';

  Store(this._prefs);

  Future<void> rankCharacter({
    required Character character,
    required int rank,
  }) async {
    final String existingRankedJson =
        _prefs.getString(_rankedCharactersKey) ?? '[]';
    RankedCharacterMapper.ensureInitialized();
    final List<RankedCharacter> rankedCharacters = MapperContainer.globals
        .fromJson(existingRankedJson);

    rankedCharacters.removeWhere((rc) => rc.character.id == character.id);
    final rankedCharacter = RankedCharacter(character: character, rank: rank);
    rankedCharacters.add(rankedCharacter);
    await _prefs.setString(
      _rankedCharactersKey,
      MapperContainer.globals.toJson(rankedCharacters),
    );
  }

  List<Tier> getTiers() {
    final String existingRankedJson =
        _prefs.getString(_rankedCharactersKey) ?? '[]';
    RankedCharacterMapper.ensureInitialized();
    final List<RankedCharacter> rankedCharacters = MapperContainer.globals
        .fromJson(existingRankedJson);

    final groupedByRank = groupBy(
      rankedCharacters,
      (RankedCharacter rc) => rc.rank,
    );

    return groupedByRank.entries.map((entry) {
        final characters = entry.value.map((rc) => rc.character).toList();
        return Tier(rank: entry.key, characters: characters);
      }).toList()
      ..sort((a, b) => a.rank.compareTo(b.rank));
  }
}

final storeProvider = FutureProvider<Store>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return Store(prefs);
});

@MappableClass()
class RankedCharacter with RankedCharacterMappable {
  final Character character;
  final int rank;

  const RankedCharacter({required this.character, required this.rank});

  static const fromMap = RankedCharacterMapper.fromMap;
  static const fromJson = RankedCharacterMapper.fromJson;
}

@MappableClass()
class Tier with TierMappable {
  final int rank;
  final List<Character> characters;

  const Tier({required this.rank, required this.characters});

  static const fromMap = TierMapper.fromMap;
  static const fromJson = TierMapper.fromJson;
}

class UriMapper extends SimpleMapper<Uri> {
  const UriMapper();

  @override
  Uri decode(dynamic value) {
    return Uri.parse(value as String);
  }

  @override
  dynamic encode(Uri self) {
    return self.toString();
  }
}

@MappableClass(includeCustomMappers: [UriMapper()])
class Character with CharacterMappable {
  final int id;
  final int animeId;
  final String animeName;
  final String name;
  final List<Uri> pictures;

  const Character({
    required this.id,
    required this.animeId,
    required this.animeName,
    required this.name,
    required this.pictures,
  });

  static const fromMap = CharacterMapper.fromMap;
  static const fromJson = CharacterMapper.fromJson;
}
