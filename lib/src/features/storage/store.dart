import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'store.mapper.dart';

class Store {
  final SharedPreferences _prefs;
  static const String _tiersKey = 'tiers';

  Store(this._prefs);

  Future<void> addTier({
    required String name,
    List<int> characterIds = const [],
  }) async {
    final tier = Tier(name: name, characterIds: characterIds);

    // Get existing tiers or empty list if none exist
    final String existingTiersJson = _prefs.getString(_tiersKey) ?? '[]';
    TierMapper.ensureInitialized();
    final List<Tier> tiers = MapperContainer.globals.fromJson(
      existingTiersJson,
    );

    // Add new tier
    tiers.add(tier);

    // Save updated tiers list
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
  final List<int> characterIds;

  const Tier({required this.name, required this.characterIds});

  static const fromMap = TierMapper.fromMap;
  static const fromJson = TierMapper.fromJson;
}
