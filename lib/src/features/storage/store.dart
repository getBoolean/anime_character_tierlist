import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

part 'store.mapper.dart';

class Store {
  final SharedPreferences _prefs;
  static const String _tiersKey = 'tiers';

  Store(this._prefs);

  Future<void> addTier({
    required String name,
    List<Character> characters = const [],
  }) async {
    final tier = Tier(name: name, characters: characters);
    final String existingTiersJson = _prefs.getString(_tiersKey) ?? '[]';
    TierMapper.ensureInitialized();
    final List<Tier> tiers = MapperContainer.globals.fromJson(
      existingTiersJson,
    );

    tiers.add(tier);
    await _prefs.setString(_tiersKey, MapperContainer.globals.toJson(tiers));
  }

  Future<void> addCharacterToTier({
    required String tierName,
    required Character character,
  }) async {
    final String existingTiersJson = _prefs.getString(_tiersKey) ?? '[]';
    TierMapper.ensureInitialized();
    final List<Tier> tiers = MapperContainer.globals.fromJson(
      existingTiersJson,
    );

    final tierIndex = tiers.indexWhere((t) => t.name == tierName);
    if (tierIndex == -1) {
      throw Exception('Tier not found: $tierName');
    }

    final oldTier = tiers[tierIndex];
    if (!oldTier.characters.any((c) => c.id == character.id)) {
      final newTier = Tier(
        name: oldTier.name,
        characters: [...oldTier.characters, character],
      );
      tiers[tierIndex] = newTier;
      await _prefs.setString(_tiersKey, MapperContainer.globals.toJson(tiers));
    }
  }

  Future<void> updateCharactersInTier({
    required String tierName,
    required List<Character> characters,
  }) async {
    final String existingTiersJson = _prefs.getString(_tiersKey) ?? '[]';
    TierMapper.ensureInitialized();
    final List<Tier> tiers = MapperContainer.globals.fromJson(
      existingTiersJson,
    );

    final tierIndex = tiers.indexWhere((t) => t.name == tierName);
    if (tierIndex == -1) {
      throw Exception('Tier not found: $tierName');
    }

    tiers[tierIndex] = Tier(name: tierName, characters: characters);
    await _prefs.setString(_tiersKey, MapperContainer.globals.toJson(tiers));
  }

  // TODO: save ranking process to disk

  // rank character a > character b
  // implicit character tiers (rank character a == character b)
  // how to store this?

  // favorite characters per anime

  // save each tier as list of character ids, order matters
}

final storeProvider = FutureProvider<Store>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return Store(prefs);
});

@MappableClass()
class Tier with TierMappable {
  final String name;
  final List<Character> characters;

  const Tier({required this.name, required this.characters});

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
  final String name;
  final List<Uri> pictures;

  const Character({
    required this.id,
    required this.name,
    required this.pictures,
  });

  static const fromMap = CharacterMapper.fromMap;
  static const fromJson = CharacterMapper.fromJson;
}
