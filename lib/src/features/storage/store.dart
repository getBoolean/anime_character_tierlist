import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'database.dart';

class Store {
  final AnimeDatabase _db;

  Store(this._db);

  Future<void> rankCharacter({
    required CharacterData character,
    required int rank,
  }) async {
    await _db.insertCharacter(character, character.pictures);
    await _db.rankCharacter(character.id, rank);
  }

  Future<List<TierData>> getTiers() async {
    return _db.getTiers();
  }
}

final storeProvider = FutureProvider<Store>((ref) async {
  final db = AnimeDatabase();
  return Store(db);
});
