// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, Character> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _animeIdMeta = const VerificationMeta(
    'animeId',
  );
  @override
  late final GeneratedColumn<int> animeId = GeneratedColumn<int>(
    'anime_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _animeNameMeta = const VerificationMeta(
    'animeName',
  );
  @override
  late final GeneratedColumn<String> animeName = GeneratedColumn<String>(
    'anime_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
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
  VerificationContext validateIntegrity(
    Insertable<Character> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('anime_id')) {
      context.handle(
        _animeIdMeta,
        animeId.isAcceptableOrUnknown(data['anime_id']!, _animeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_animeIdMeta);
    }
    if (data.containsKey('anime_name')) {
      context.handle(
        _animeNameMeta,
        animeName.isAcceptableOrUnknown(data['anime_name']!, _animeNameMeta),
      );
    } else if (isInserting) {
      context.missing(_animeNameMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Character map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Character(
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
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }
}

class Character extends DataClass implements Insertable<Character> {
  final int id;
  final int animeId;
  final String animeName;
  final String name;
  const Character({
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

  factory Character.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Character(
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

  Character copyWith({
    int? id,
    int? animeId,
    String? animeName,
    String? name,
  }) => Character(
    id: id ?? this.id,
    animeId: animeId ?? this.animeId,
    animeName: animeName ?? this.animeName,
    name: name ?? this.name,
  );
  Character copyWithCompanion(CharactersCompanion data) {
    return Character(
      id: data.id.present ? data.id.value : this.id,
      animeId: data.animeId.present ? data.animeId.value : this.animeId,
      animeName: data.animeName.present ? data.animeName.value : this.animeName,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Character(')
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
      (other is Character &&
          other.id == this.id &&
          other.animeId == this.animeId &&
          other.animeName == this.animeName &&
          other.name == this.name);
}

class CharactersCompanion extends UpdateCompanion<Character> {
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
  static Insertable<Character> custom({
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

class $CharacterPicturesTable extends CharacterPictures
    with TableInfo<$CharacterPicturesTable, CharacterPicture> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterPicturesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
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
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
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
  static const VerificationMeta _pictureUriMeta = const VerificationMeta(
    'pictureUri',
  );
  @override
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
  VerificationContext validateIntegrity(
    Insertable<CharacterPicture> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('picture_uri')) {
      context.handle(
        _pictureUriMeta,
        pictureUri.isAcceptableOrUnknown(data['picture_uri']!, _pictureUriMeta),
      );
    } else if (isInserting) {
      context.missing(_pictureUriMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterPicture map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterPicture(
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
  $CharacterPicturesTable createAlias(String alias) {
    return $CharacterPicturesTable(attachedDatabase, alias);
  }
}

class CharacterPicture extends DataClass
    implements Insertable<CharacterPicture> {
  final int id;
  final int characterId;
  final String pictureUri;
  const CharacterPicture({
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

  factory CharacterPicture.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterPicture(
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

  CharacterPicture copyWith({int? id, int? characterId, String? pictureUri}) =>
      CharacterPicture(
        id: id ?? this.id,
        characterId: characterId ?? this.characterId,
        pictureUri: pictureUri ?? this.pictureUri,
      );
  CharacterPicture copyWithCompanion(CharacterPicturesCompanion data) {
    return CharacterPicture(
      id: data.id.present ? data.id.value : this.id,
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      pictureUri:
          data.pictureUri.present ? data.pictureUri.value : this.pictureUri,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterPicture(')
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
      (other is CharacterPicture &&
          other.id == this.id &&
          other.characterId == this.characterId &&
          other.pictureUri == this.pictureUri);
}

class CharacterPicturesCompanion extends UpdateCompanion<CharacterPicture> {
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
  static Insertable<CharacterPicture> custom({
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

class $RankedCharactersTable extends RankedCharacters
    with TableInfo<$RankedCharactersTable, RankedCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RankedCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
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
  static const VerificationMeta _rankMeta = const VerificationMeta('rank');
  @override
  late final GeneratedColumn<int> rank = GeneratedColumn<int>(
    'rank',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [characterId, rank, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ranked_characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<RankedCharacter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    }
    if (data.containsKey('rank')) {
      context.handle(
        _rankMeta,
        rank.isAcceptableOrUnknown(data['rank']!, _rankMeta),
      );
    } else if (isInserting) {
      context.missing(_rankMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId};
  @override
  RankedCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RankedCharacter(
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
      sortOrder:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sort_order'],
          )!,
    );
  }

  @override
  $RankedCharactersTable createAlias(String alias) {
    return $RankedCharactersTable(attachedDatabase, alias);
  }
}

class RankedCharacter extends DataClass implements Insertable<RankedCharacter> {
  final int characterId;
  final int rank;
  final int sortOrder;
  const RankedCharacter({
    required this.characterId,
    required this.rank,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<int>(characterId);
    map['rank'] = Variable<int>(rank);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  RankedCharactersCompanion toCompanion(bool nullToAbsent) {
    return RankedCharactersCompanion(
      characterId: Value(characterId),
      rank: Value(rank),
      sortOrder: Value(sortOrder),
    );
  }

  factory RankedCharacter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RankedCharacter(
      characterId: serializer.fromJson<int>(json['characterId']),
      rank: serializer.fromJson<int>(json['rank']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<int>(characterId),
      'rank': serializer.toJson<int>(rank),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  RankedCharacter copyWith({int? characterId, int? rank, int? sortOrder}) =>
      RankedCharacter(
        characterId: characterId ?? this.characterId,
        rank: rank ?? this.rank,
        sortOrder: sortOrder ?? this.sortOrder,
      );
  RankedCharacter copyWithCompanion(RankedCharactersCompanion data) {
    return RankedCharacter(
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      rank: data.rank.present ? data.rank.value : this.rank,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RankedCharacter(')
          ..write('characterId: $characterId, ')
          ..write('rank: $rank, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, rank, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RankedCharacter &&
          other.characterId == this.characterId &&
          other.rank == this.rank &&
          other.sortOrder == this.sortOrder);
}

class RankedCharactersCompanion extends UpdateCompanion<RankedCharacter> {
  final Value<int> characterId;
  final Value<int> rank;
  final Value<int> sortOrder;
  const RankedCharactersCompanion({
    this.characterId = const Value.absent(),
    this.rank = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  RankedCharactersCompanion.insert({
    this.characterId = const Value.absent(),
    required int rank,
    this.sortOrder = const Value.absent(),
  }) : rank = Value(rank);
  static Insertable<RankedCharacter> custom({
    Expression<int>? characterId,
    Expression<int>? rank,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (rank != null) 'rank': rank,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  RankedCharactersCompanion copyWith({
    Value<int>? characterId,
    Value<int>? rank,
    Value<int>? sortOrder,
  }) {
    return RankedCharactersCompanion(
      characterId: characterId ?? this.characterId,
      rank: rank ?? this.rank,
      sortOrder: sortOrder ?? this.sortOrder,
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
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RankedCharactersCompanion(')
          ..write('characterId: $characterId, ')
          ..write('rank: $rank, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

abstract class _$AnimeDatabase extends GeneratedDatabase {
  _$AnimeDatabase(QueryExecutor e) : super(e);
  $AnimeDatabaseManager get managers => $AnimeDatabaseManager(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $CharacterPicturesTable characterPictures =
      $CharacterPicturesTable(this);
  late final $RankedCharactersTable rankedCharacters = $RankedCharactersTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    characters,
    characterPictures,
    rankedCharacters,
  ];
}

typedef $$CharactersTableCreateCompanionBuilder =
    CharactersCompanion Function({
      Value<int> id,
      required int animeId,
      required String animeName,
      required String name,
    });
typedef $$CharactersTableUpdateCompanionBuilder =
    CharactersCompanion Function({
      Value<int> id,
      Value<int> animeId,
      Value<String> animeName,
      Value<String> name,
    });

final class $$CharactersTableReferences
    extends BaseReferences<_$AnimeDatabase, $CharactersTable, Character> {
  $$CharactersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CharacterPicturesTable, List<CharacterPicture>>
  _characterPicturesRefsTable(_$AnimeDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.characterPictures,
        aliasName: $_aliasNameGenerator(
          db.characters.id,
          db.characterPictures.characterId,
        ),
      );

  $$CharacterPicturesTableProcessedTableManager get characterPicturesRefs {
    final manager = $$CharacterPicturesTableTableManager(
      $_db,
      $_db.characterPictures,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterPicturesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RankedCharactersTable, List<RankedCharacter>>
  _rankedCharactersRefsTable(_$AnimeDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.rankedCharacters,
        aliasName: $_aliasNameGenerator(
          db.characters.id,
          db.rankedCharacters.characterId,
        ),
      );

  $$RankedCharactersTableProcessedTableManager get rankedCharactersRefs {
    final manager = $$RankedCharactersTableTableManager(
      $_db,
      $_db.rankedCharacters,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _rankedCharactersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CharactersTableFilterComposer
    extends Composer<_$AnimeDatabase, $CharactersTable> {
  $$CharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get animeId => $composableBuilder(
    column: $table.animeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get animeName => $composableBuilder(
    column: $table.animeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> characterPicturesRefs(
    Expression<bool> Function($$CharacterPicturesTableFilterComposer f) f,
  ) {
    final $$CharacterPicturesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterPictures,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterPicturesTableFilterComposer(
            $db: $db,
            $table: $db.characterPictures,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> rankedCharactersRefs(
    Expression<bool> Function($$RankedCharactersTableFilterComposer f) f,
  ) {
    final $$RankedCharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rankedCharacters,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RankedCharactersTableFilterComposer(
            $db: $db,
            $table: $db.rankedCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CharactersTableOrderingComposer
    extends Composer<_$AnimeDatabase, $CharactersTable> {
  $$CharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get animeId => $composableBuilder(
    column: $table.animeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get animeName => $composableBuilder(
    column: $table.animeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CharactersTableAnnotationComposer
    extends Composer<_$AnimeDatabase, $CharactersTable> {
  $$CharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get animeId =>
      $composableBuilder(column: $table.animeId, builder: (column) => column);

  GeneratedColumn<String> get animeName =>
      $composableBuilder(column: $table.animeName, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> characterPicturesRefs<T extends Object>(
    Expression<T> Function($$CharacterPicturesTableAnnotationComposer a) f,
  ) {
    final $$CharacterPicturesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.characterPictures,
          getReferencedColumn: (t) => t.characterId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterPicturesTableAnnotationComposer(
                $db: $db,
                $table: $db.characterPictures,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> rankedCharactersRefs<T extends Object>(
    Expression<T> Function($$RankedCharactersTableAnnotationComposer a) f,
  ) {
    final $$RankedCharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rankedCharacters,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RankedCharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.rankedCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CharactersTableTableManager
    extends
        RootTableManager<
          _$AnimeDatabase,
          $CharactersTable,
          Character,
          $$CharactersTableFilterComposer,
          $$CharactersTableOrderingComposer,
          $$CharactersTableAnnotationComposer,
          $$CharactersTableCreateCompanionBuilder,
          $$CharactersTableUpdateCompanionBuilder,
          (Character, $$CharactersTableReferences),
          Character,
          PrefetchHooks Function({
            bool characterPicturesRefs,
            bool rankedCharactersRefs,
          })
        > {
  $$CharactersTableTableManager(_$AnimeDatabase db, $CharactersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> animeId = const Value.absent(),
                Value<String> animeName = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => CharactersCompanion(
                id: id,
                animeId: animeId,
                animeName: animeName,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int animeId,
                required String animeName,
                required String name,
              }) => CharactersCompanion.insert(
                id: id,
                animeId: animeId,
                animeName: animeName,
                name: name,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CharactersTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            characterPicturesRefs = false,
            rankedCharactersRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (characterPicturesRefs) db.characterPictures,
                if (rankedCharactersRefs) db.rankedCharacters,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (characterPicturesRefs)
                    await $_getPrefetchedData<
                      Character,
                      $CharactersTable,
                      CharacterPicture
                    >(
                      currentTable: table,
                      referencedTable: $$CharactersTableReferences
                          ._characterPicturesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).characterPicturesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.characterId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (rankedCharactersRefs)
                    await $_getPrefetchedData<
                      Character,
                      $CharactersTable,
                      RankedCharacter
                    >(
                      currentTable: table,
                      referencedTable: $$CharactersTableReferences
                          ._rankedCharactersRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).rankedCharactersRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.characterId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AnimeDatabase,
      $CharactersTable,
      Character,
      $$CharactersTableFilterComposer,
      $$CharactersTableOrderingComposer,
      $$CharactersTableAnnotationComposer,
      $$CharactersTableCreateCompanionBuilder,
      $$CharactersTableUpdateCompanionBuilder,
      (Character, $$CharactersTableReferences),
      Character,
      PrefetchHooks Function({
        bool characterPicturesRefs,
        bool rankedCharactersRefs,
      })
    >;
typedef $$CharacterPicturesTableCreateCompanionBuilder =
    CharacterPicturesCompanion Function({
      Value<int> id,
      required int characterId,
      required String pictureUri,
    });
typedef $$CharacterPicturesTableUpdateCompanionBuilder =
    CharacterPicturesCompanion Function({
      Value<int> id,
      Value<int> characterId,
      Value<String> pictureUri,
    });

final class $$CharacterPicturesTableReferences
    extends
        BaseReferences<
          _$AnimeDatabase,
          $CharacterPicturesTable,
          CharacterPicture
        > {
  $$CharacterPicturesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharactersTable _characterIdTable(_$AnimeDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(
          db.characterPictures.characterId,
          db.characters.id,
        ),
      );

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<int>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CharacterPicturesTableFilterComposer
    extends Composer<_$AnimeDatabase, $CharacterPicturesTable> {
  $$CharacterPicturesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pictureUri => $composableBuilder(
    column: $table.pictureUri,
    builder: (column) => ColumnFilters(column),
  );

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterPicturesTableOrderingComposer
    extends Composer<_$AnimeDatabase, $CharacterPicturesTable> {
  $$CharacterPicturesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pictureUri => $composableBuilder(
    column: $table.pictureUri,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterPicturesTableAnnotationComposer
    extends Composer<_$AnimeDatabase, $CharacterPicturesTable> {
  $$CharacterPicturesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pictureUri => $composableBuilder(
    column: $table.pictureUri,
    builder: (column) => column,
  );

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterPicturesTableTableManager
    extends
        RootTableManager<
          _$AnimeDatabase,
          $CharacterPicturesTable,
          CharacterPicture,
          $$CharacterPicturesTableFilterComposer,
          $$CharacterPicturesTableOrderingComposer,
          $$CharacterPicturesTableAnnotationComposer,
          $$CharacterPicturesTableCreateCompanionBuilder,
          $$CharacterPicturesTableUpdateCompanionBuilder,
          (CharacterPicture, $$CharacterPicturesTableReferences),
          CharacterPicture,
          PrefetchHooks Function({bool characterId})
        > {
  $$CharacterPicturesTableTableManager(
    _$AnimeDatabase db,
    $CharacterPicturesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CharacterPicturesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$CharacterPicturesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$CharacterPicturesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> characterId = const Value.absent(),
                Value<String> pictureUri = const Value.absent(),
              }) => CharacterPicturesCompanion(
                id: id,
                characterId: characterId,
                pictureUri: pictureUri,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int characterId,
                required String pictureUri,
              }) => CharacterPicturesCompanion.insert(
                id: id,
                characterId: characterId,
                pictureUri: pictureUri,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CharacterPicturesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({characterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (characterId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.characterId,
                            referencedTable: $$CharacterPicturesTableReferences
                                ._characterIdTable(db),
                            referencedColumn:
                                $$CharacterPicturesTableReferences
                                    ._characterIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CharacterPicturesTableProcessedTableManager =
    ProcessedTableManager<
      _$AnimeDatabase,
      $CharacterPicturesTable,
      CharacterPicture,
      $$CharacterPicturesTableFilterComposer,
      $$CharacterPicturesTableOrderingComposer,
      $$CharacterPicturesTableAnnotationComposer,
      $$CharacterPicturesTableCreateCompanionBuilder,
      $$CharacterPicturesTableUpdateCompanionBuilder,
      (CharacterPicture, $$CharacterPicturesTableReferences),
      CharacterPicture,
      PrefetchHooks Function({bool characterId})
    >;
typedef $$RankedCharactersTableCreateCompanionBuilder =
    RankedCharactersCompanion Function({
      Value<int> characterId,
      required int rank,
      Value<int> sortOrder,
    });
typedef $$RankedCharactersTableUpdateCompanionBuilder =
    RankedCharactersCompanion Function({
      Value<int> characterId,
      Value<int> rank,
      Value<int> sortOrder,
    });

final class $$RankedCharactersTableReferences
    extends
        BaseReferences<
          _$AnimeDatabase,
          $RankedCharactersTable,
          RankedCharacter
        > {
  $$RankedCharactersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharactersTable _characterIdTable(_$AnimeDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(db.rankedCharacters.characterId, db.characters.id),
      );

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<int>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RankedCharactersTableFilterComposer
    extends Composer<_$AnimeDatabase, $RankedCharactersTable> {
  $$RankedCharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RankedCharactersTableOrderingComposer
    extends Composer<_$AnimeDatabase, $RankedCharactersTable> {
  $$RankedCharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RankedCharactersTableAnnotationComposer
    extends Composer<_$AnimeDatabase, $RankedCharactersTable> {
  $$RankedCharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get rank =>
      $composableBuilder(column: $table.rank, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RankedCharactersTableTableManager
    extends
        RootTableManager<
          _$AnimeDatabase,
          $RankedCharactersTable,
          RankedCharacter,
          $$RankedCharactersTableFilterComposer,
          $$RankedCharactersTableOrderingComposer,
          $$RankedCharactersTableAnnotationComposer,
          $$RankedCharactersTableCreateCompanionBuilder,
          $$RankedCharactersTableUpdateCompanionBuilder,
          (RankedCharacter, $$RankedCharactersTableReferences),
          RankedCharacter,
          PrefetchHooks Function({bool characterId})
        > {
  $$RankedCharactersTableTableManager(
    _$AnimeDatabase db,
    $RankedCharactersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$RankedCharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$RankedCharactersTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$RankedCharactersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> characterId = const Value.absent(),
                Value<int> rank = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => RankedCharactersCompanion(
                characterId: characterId,
                rank: rank,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> characterId = const Value.absent(),
                required int rank,
                Value<int> sortOrder = const Value.absent(),
              }) => RankedCharactersCompanion.insert(
                characterId: characterId,
                rank: rank,
                sortOrder: sortOrder,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$RankedCharactersTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({characterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (characterId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.characterId,
                            referencedTable: $$RankedCharactersTableReferences
                                ._characterIdTable(db),
                            referencedColumn:
                                $$RankedCharactersTableReferences
                                    ._characterIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RankedCharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AnimeDatabase,
      $RankedCharactersTable,
      RankedCharacter,
      $$RankedCharactersTableFilterComposer,
      $$RankedCharactersTableOrderingComposer,
      $$RankedCharactersTableAnnotationComposer,
      $$RankedCharactersTableCreateCompanionBuilder,
      $$RankedCharactersTableUpdateCompanionBuilder,
      (RankedCharacter, $$RankedCharactersTableReferences),
      RankedCharacter,
      PrefetchHooks Function({bool characterId})
    >;

class $AnimeDatabaseManager {
  final _$AnimeDatabase _db;
  $AnimeDatabaseManager(this._db);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db, _db.characters);
  $$CharacterPicturesTableTableManager get characterPictures =>
      $$CharacterPicturesTableTableManager(_db, _db.characterPictures);
  $$RankedCharactersTableTableManager get rankedCharacters =>
      $$RankedCharactersTableTableManager(_db, _db.rankedCharacters);
}
