import 'package:drift/drift.dart';

@DataClassName('Character')
class Characters extends Table {
  IntColumn get id => integer()();
  IntColumn get animeId => integer()();
  TextColumn get animeName => text()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CharacterPicture')
class CharacterPictures extends Table {
  IntColumn get characterId => integer().references(Characters, #id)();
  TextColumn get pictureUri => text()();

  @override
  Set<Column> get primaryKey => {characterId, pictureUri};
}

@DataClassName('RankedCharacter')
class RankedCharacters extends Table {
  IntColumn get characterId => integer().references(Characters, #id)();
  IntColumn get rank => integer()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {characterId};
}

// Tables can mix-in common definitions if needed
mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get id => integer().autoIncrement()();
}
