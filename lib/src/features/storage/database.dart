import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';
import 'dart:io';

part 'database.g.dart';

class Characters extends Table {
  IntColumn get id => integer()();
  IntColumn get animeId => integer()();
  TextColumn get animeName => text()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class CharacterPictures extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get characterId => integer().references(Characters, #id)();
  TextColumn get pictureUri => text()();
}

class RankedCharacters extends Table {
  IntColumn get characterId => integer().references(Characters, #id)();
  IntColumn get rank => integer()();

  @override
  Set<Column> get primaryKey => {characterId};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'anime_characters.db'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Characters, CharacterPictures, RankedCharacters])
class AnimeDatabase extends _$AnimeDatabase {
  AnimeDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<CharacterData>> getAllCharacters() async {
    final charactersQuery = select(characters);
    final List<CharacterData> allCharacters = [];

    final results = await charactersQuery.get();
    for (final characterRow in results) {
      final pictures =
          await (select(characterPictures)
            ..where((p) => p.characterId.equals(characterRow.id))).get();

      allCharacters.add(
        CharacterData(
          id: characterRow.id,
          animeId: characterRow.animeId,
          animeName: characterRow.animeName,
          name: characterRow.name,
          pictures: pictures.map((p) => Uri.parse(p.pictureUri)).toList(),
        ),
      );
    }

    return allCharacters;
  }

  Future<void> insertCharacter(
    CharacterData character,
    List<Uri> pictures,
  ) async {
    await transaction(() async {
      // Insert character first
      await into(characters).insert(
        CharactersCompanion(
          id: Value(character.id),
          animeId: Value(character.animeId),
          animeName: Value(character.animeName),
          name: Value(character.name),
        ),
      );

      // Insert pictures
      for (final pictureUri in pictures) {
        await into(characterPictures).insert(
          CharacterPicturesCompanion(
            characterId: Value(character.id),
            pictureUri: Value(pictureUri.toString()),
          ),
        );
      }
    });
  }

  Future<void> rankCharacter(int characterId, int rank) async {
    await into(rankedCharacters).insertOnConflictUpdate(
      RankedCharactersCompanion(
        characterId: Value(characterId),
        rank: Value(rank),
      ),
    );
  }

  Future<List<TierData>> getTiers() async {
    final query = select(rankedCharacters).join([
      innerJoin(
        characters,
        characters.id.equalsExp(rankedCharacters.characterId),
      ),
    ]);

    final results = await query.get();

    // Group results by rank
    final groupedResults = <int, List<CharacterData>>{};
    for (final row in results) {
      final characterRow = row.readTable(characters);
      final pictures =
          await (select(characterPictures)
            ..where((p) => p.characterId.equals(characterRow.id))).get();

      final character = CharacterData(
        id: characterRow.id,
        animeId: characterRow.animeId,
        animeName: characterRow.animeName,
        name: characterRow.name,
        pictures: pictures.map((p) => Uri.parse(p.pictureUri)).toList(),
      );
      final rank = row.readTable(rankedCharacters).rank;

      groupedResults.putIfAbsent(rank, () => []).add(character);
    }

    return groupedResults.entries
        .map((entry) => TierData(rank: entry.key, characters: entry.value))
        .toList()
      ..sort((a, b) => a.rank.compareTo(b.rank));
  }
}

// Data classes for the API
class CharacterData {
  final int id;
  final int animeId;
  final String animeName;
  final String name;
  final List<Uri> pictures;

  const CharacterData({
    required this.id,
    required this.animeId,
    required this.animeName,
    required this.name,
    required this.pictures,
  });
}

class TierData {
  final int rank;
  final List<CharacterData> characters;

  const TierData({required this.rank, required this.characters});
}
