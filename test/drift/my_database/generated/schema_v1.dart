// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class Characters extends Table with TableInfo<Characters, CharactersData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Characters(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<int> animeId = GeneratedColumn<int>(
    'anime_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> animeName = GeneratedColumn<String>(
    'anime_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, animeId, animeName, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharactersData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharactersData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      animeId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}anime_id'],
          )!,
      animeName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}anime_name'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
    );
  }

  @override
  Characters createAlias(String alias) {
    return Characters(attachedDatabase, alias);
  }
}

class CharactersData extends DataClass implements Insertable<CharactersData> {
  final int id;
  final int animeId;
  final String animeName;
  final String name;
  const CharactersData({
    required this.id,
    required this.animeId,
    required this.animeName,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['anime_id'] = Variable<int>(animeId);
    map['anime_name'] = Variable<String>(animeName);
    map['name'] = Variable<String>(name);
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      animeId: Value(animeId),
      animeName: Value(animeName),
      name: Value(name),
    );
  }

  factory CharactersData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharactersData(
      id: serializer.fromJson<int>(json['id']),
      animeId: serializer.fromJson<int>(json['animeId']),
      animeName: serializer.fromJson<String>(json['animeName']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'animeId': serializer.toJson<int>(animeId),
      'animeName': serializer.toJson<String>(animeName),
      'name': serializer.toJson<String>(name),
    };
  }

  CharactersData copyWith({
    int? id,
    int? animeId,
    String? animeName,
    String? name,
  }) => CharactersData(
    id: id ?? this.id,
    animeId: animeId ?? this.animeId,
    animeName: animeName ?? this.animeName,
    name: name ?? this.name,
  );
  CharactersData copyWithCompanion(CharactersCompanion data) {
    return CharactersData(
      id: data.id.present ? data.id.value : this.id,
      animeId: data.animeId.present ? data.animeId.value : this.animeId,
      animeName: data.animeName.present ? data.animeName.value : this.animeName,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharactersData(')
          ..write('id: $id, ')
          ..write('animeId: $animeId, ')
          ..write('animeName: $animeName, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, animeId, animeName, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharactersData &&
          other.id == this.id &&
          other.animeId == this.animeId &&
          other.animeName == this.animeName &&
          other.name == this.name);
}

class CharactersCompanion extends UpdateCompanion<CharactersData> {
  final Value<int> id;
  final Value<int> animeId;
  final Value<String> animeName;
  final Value<String> name;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.animeId = const Value.absent(),
    this.animeName = const Value.absent(),
    this.name = const Value.absent(),
  });
  CharactersCompanion.insert({
    this.id = const Value.absent(),
    required int animeId,
    required String animeName,
    required String name,
  }) : animeId = Value(animeId),
       animeName = Value(animeName),
       name = Value(name);
  static Insertable<CharactersData> custom({
    Expression<int>? id,
    Expression<int>? animeId,
    Expression<String>? animeName,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (animeId != null) 'anime_id': animeId,
      if (animeName != null) 'anime_name': animeName,
      if (name != null) 'name': name,
    });
  }

  CharactersCompanion copyWith({
    Value<int>? id,
    Value<int>? animeId,
    Value<String>? animeName,
    Value<String>? name,
  }) {
    return CharactersCompanion(
      id: id ?? this.id,
      animeId: animeId ?? this.animeId,
      animeName: animeName ?? this.animeName,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (animeId.present) {
      map['anime_id'] = Variable<int>(animeId.value);
    }
    if (animeName.present) {
      map['anime_name'] = Variable<String>(animeName.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('animeId: $animeId, ')
          ..write('animeName: $animeName, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class CharacterPictures extends Table
    with TableInfo<CharacterPictures, CharacterPicturesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CharacterPictures(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  late final GeneratedColumn<int> characterId = GeneratedColumn<int>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id)',
    ),
  );
  late final GeneratedColumn<String> pictureUri = GeneratedColumn<String>(
    'picture_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, characterId, pictureUri];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_pictures';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterPicturesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterPicturesData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      characterId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}character_id'],
          )!,
      pictureUri:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}picture_uri'],
          )!,
    );
  }

  @override
  CharacterPictures createAlias(String alias) {
    return CharacterPictures(attachedDatabase, alias);
  }
}

class CharacterPicturesData extends DataClass
    implements Insertable<CharacterPicturesData> {
  final int id;
  final int characterId;
  final String pictureUri;
  const CharacterPicturesData({
    required this.id,
    required this.characterId,
    required this.pictureUri,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['character_id'] = Variable<int>(characterId);
    map['picture_uri'] = Variable<String>(pictureUri);
    return map;
  }

  CharacterPicturesCompanion toCompanion(bool nullToAbsent) {
    return CharacterPicturesCompanion(
      id: Value(id),
      characterId: Value(characterId),
      pictureUri: Value(pictureUri),
    );
  }

  factory CharacterPicturesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterPicturesData(
      id: serializer.fromJson<int>(json['id']),
      characterId: serializer.fromJson<int>(json['characterId']),
      pictureUri: serializer.fromJson<String>(json['pictureUri']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'characterId': serializer.toJson<int>(characterId),
      'pictureUri': serializer.toJson<String>(pictureUri),
    };
  }

  CharacterPicturesData copyWith({
    int? id,
    int? characterId,
    String? pictureUri,
  }) => CharacterPicturesData(
    id: id ?? this.id,
    characterId: characterId ?? this.characterId,
    pictureUri: pictureUri ?? this.pictureUri,
  );
  CharacterPicturesData copyWithCompanion(CharacterPicturesCompanion data) {
    return CharacterPicturesData(
      id: data.id.present ? data.id.value : this.id,
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      pictureUri:
          data.pictureUri.present ? data.pictureUri.value : this.pictureUri,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterPicturesData(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('pictureUri: $pictureUri')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, characterId, pictureUri);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterPicturesData &&
          other.id == this.id &&
          other.characterId == this.characterId &&
          other.pictureUri == this.pictureUri);
}

class CharacterPicturesCompanion
    extends UpdateCompanion<CharacterPicturesData> {
  final Value<int> id;
  final Value<int> characterId;
  final Value<String> pictureUri;
  const CharacterPicturesCompanion({
    this.id = const Value.absent(),
    this.characterId = const Value.absent(),
    this.pictureUri = const Value.absent(),
  });
  CharacterPicturesCompanion.insert({
    this.id = const Value.absent(),
    required int characterId,
    required String pictureUri,
  }) : characterId = Value(characterId),
       pictureUri = Value(pictureUri);
  static Insertable<CharacterPicturesData> custom({
    Expression<int>? id,
    Expression<int>? characterId,
    Expression<String>? pictureUri,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterId != null) 'character_id': characterId,
      if (pictureUri != null) 'picture_uri': pictureUri,
    });
  }

  CharacterPicturesCompanion copyWith({
    Value<int>? id,
    Value<int>? characterId,
    Value<String>? pictureUri,
  }) {
    return CharacterPicturesCompanion(
      id: id ?? this.id,
      characterId: characterId ?? this.characterId,
      pictureUri: pictureUri ?? this.pictureUri,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<int>(characterId.value);
    }
    if (pictureUri.present) {
      map['picture_uri'] = Variable<String>(pictureUri.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterPicturesCompanion(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('pictureUri: $pictureUri')
          ..write(')'))
        .toString();
  }
}

class RankedCharacters extends Table
    with TableInfo<RankedCharacters, RankedCharactersData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RankedCharacters(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> characterId = GeneratedColumn<int>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id)',
    ),
  );
  late final GeneratedColumn<int> rank = GeneratedColumn<int>(
    'rank',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [characterId, rank];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ranked_characters';
  @override
  Set<GeneratedColumn> get $primaryKey => {characterId};
  @override
  RankedCharactersData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RankedCharactersData(
      characterId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}character_id'],
          )!,
      rank:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}rank'],
          )!,
    );
  }

  @override
  RankedCharacters createAlias(String alias) {
    return RankedCharacters(attachedDatabase, alias);
  }
}

class RankedCharactersData extends DataClass
    implements Insertable<RankedCharactersData> {
  final int characterId;
  final int rank;
  const RankedCharactersData({required this.characterId, required this.rank});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<int>(characterId);
    map['rank'] = Variable<int>(rank);
    return map;
  }

  RankedCharactersCompanion toCompanion(bool nullToAbsent) {
    return RankedCharactersCompanion(
      characterId: Value(characterId),
      rank: Value(rank),
    );
  }

  factory RankedCharactersData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RankedCharactersData(
      characterId: serializer.fromJson<int>(json['characterId']),
      rank: serializer.fromJson<int>(json['rank']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<int>(characterId),
      'rank': serializer.toJson<int>(rank),
    };
  }

  RankedCharactersData copyWith({int? characterId, int? rank}) =>
      RankedCharactersData(
        characterId: characterId ?? this.characterId,
        rank: rank ?? this.rank,
      );
  RankedCharactersData copyWithCompanion(RankedCharactersCompanion data) {
    return RankedCharactersData(
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      rank: data.rank.present ? data.rank.value : this.rank,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RankedCharactersData(')
          ..write('characterId: $characterId, ')
          ..write('rank: $rank')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, rank);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RankedCharactersData &&
          other.characterId == this.characterId &&
          other.rank == this.rank);
}

class RankedCharactersCompanion extends UpdateCompanion<RankedCharactersData> {
  final Value<int> characterId;
  final Value<int> rank;
  const RankedCharactersCompanion({
    this.characterId = const Value.absent(),
    this.rank = const Value.absent(),
  });
  RankedCharactersCompanion.insert({
    this.characterId = const Value.absent(),
    required int rank,
  }) : rank = Value(rank);
  static Insertable<RankedCharactersData> custom({
    Expression<int>? characterId,
    Expression<int>? rank,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (rank != null) 'rank': rank,
    });
  }

  RankedCharactersCompanion copyWith({
    Value<int>? characterId,
    Value<int>? rank,
  }) {
    return RankedCharactersCompanion(
      characterId: characterId ?? this.characterId,
      rank: rank ?? this.rank,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['character_id'] = Variable<int>(characterId.value);
    }
    if (rank.present) {
      map['rank'] = Variable<int>(rank.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RankedCharactersCompanion(')
          ..write('characterId: $characterId, ')
          ..write('rank: $rank')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV1 extends GeneratedDatabase {
  DatabaseAtV1(QueryExecutor e) : super(e);
  late final Characters characters = Characters(this);
  late final CharacterPictures characterPictures = CharacterPictures(this);
  late final RankedCharacters rankedCharacters = RankedCharacters(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    characters,
    characterPictures,
    rankedCharacters,
  ];
  @override
  int get schemaVersion => 1;
}
