// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'store.dart';

class TierMapper extends ClassMapperBase<Tier> {
  TierMapper._();

  static TierMapper? _instance;
  static TierMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TierMapper._());
      CharacterMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Tier';

  static String _$name(Tier v) => v.name;
  static const Field<Tier, String> _f$name = Field('name', _$name);
  static List<Character> _$characters(Tier v) => v.characters;
  static const Field<Tier, List<Character>> _f$characters =
      Field('characters', _$characters);

  @override
  final MappableFields<Tier> fields = const {
    #name: _f$name,
    #characters: _f$characters,
  };

  static Tier _instantiate(DecodingData data) {
    return Tier(name: data.dec(_f$name), characters: data.dec(_f$characters));
  }

  @override
  final Function instantiate = _instantiate;

  static Tier fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Tier>(map);
  }

  static Tier fromJson(String json) {
    return ensureInitialized().decodeJson<Tier>(json);
  }
}

mixin TierMappable {
  String toJson() {
    return TierMapper.ensureInitialized().encodeJson<Tier>(this as Tier);
  }

  Map<String, dynamic> toMap() {
    return TierMapper.ensureInitialized().encodeMap<Tier>(this as Tier);
  }

  TierCopyWith<Tier, Tier, Tier> get copyWith =>
      _TierCopyWithImpl(this as Tier, $identity, $identity);
  @override
  String toString() {
    return TierMapper.ensureInitialized().stringifyValue(this as Tier);
  }

  @override
  bool operator ==(Object other) {
    return TierMapper.ensureInitialized().equalsValue(this as Tier, other);
  }

  @override
  int get hashCode {
    return TierMapper.ensureInitialized().hashValue(this as Tier);
  }
}

extension TierValueCopy<$R, $Out> on ObjectCopyWith<$R, Tier, $Out> {
  TierCopyWith<$R, Tier, $Out> get $asTier =>
      $base.as((v, t, t2) => _TierCopyWithImpl(v, t, t2));
}

abstract class TierCopyWith<$R, $In extends Tier, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Character, CharacterCopyWith<$R, Character, Character>>
      get characters;
  $R call({String? name, List<Character>? characters});
  TierCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TierCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Tier, $Out>
    implements TierCopyWith<$R, Tier, $Out> {
  _TierCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Tier> $mapper = TierMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Character, CharacterCopyWith<$R, Character, Character>>
      get characters => ListCopyWith($value.characters,
          (v, t) => v.copyWith.$chain(t), (v) => call(characters: v));
  @override
  $R call({String? name, List<Character>? characters}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (characters != null) #characters: characters
      }));
  @override
  Tier $make(CopyWithData data) => Tier(
      name: data.get(#name, or: $value.name),
      characters: data.get(#characters, or: $value.characters));

  @override
  TierCopyWith<$R2, Tier, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TierCopyWithImpl($value, $cast, t);
}

class CharacterMapper extends ClassMapperBase<Character> {
  CharacterMapper._();

  static CharacterMapper? _instance;
  static CharacterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CharacterMapper._());
      MapperContainer.globals.useAll([UriMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'Character';

  static int _$id(Character v) => v.id;
  static const Field<Character, int> _f$id = Field('id', _$id);
  static String _$name(Character v) => v.name;
  static const Field<Character, String> _f$name = Field('name', _$name);
  static List<Uri> _$pictures(Character v) => v.pictures;
  static const Field<Character, List<Uri>> _f$pictures =
      Field('pictures', _$pictures);

  @override
  final MappableFields<Character> fields = const {
    #id: _f$id,
    #name: _f$name,
    #pictures: _f$pictures,
  };

  static Character _instantiate(DecodingData data) {
    return Character(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        pictures: data.dec(_f$pictures));
  }

  @override
  final Function instantiate = _instantiate;

  static Character fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Character>(map);
  }

  static Character fromJson(String json) {
    return ensureInitialized().decodeJson<Character>(json);
  }
}

mixin CharacterMappable {
  String toJson() {
    return CharacterMapper.ensureInitialized()
        .encodeJson<Character>(this as Character);
  }

  Map<String, dynamic> toMap() {
    return CharacterMapper.ensureInitialized()
        .encodeMap<Character>(this as Character);
  }

  CharacterCopyWith<Character, Character, Character> get copyWith =>
      _CharacterCopyWithImpl(this as Character, $identity, $identity);
  @override
  String toString() {
    return CharacterMapper.ensureInitialized()
        .stringifyValue(this as Character);
  }

  @override
  bool operator ==(Object other) {
    return CharacterMapper.ensureInitialized()
        .equalsValue(this as Character, other);
  }

  @override
  int get hashCode {
    return CharacterMapper.ensureInitialized().hashValue(this as Character);
  }
}

extension CharacterValueCopy<$R, $Out> on ObjectCopyWith<$R, Character, $Out> {
  CharacterCopyWith<$R, Character, $Out> get $asCharacter =>
      $base.as((v, t, t2) => _CharacterCopyWithImpl(v, t, t2));
}

abstract class CharacterCopyWith<$R, $In extends Character, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Uri, ObjectCopyWith<$R, Uri, Uri>> get pictures;
  $R call({int? id, String? name, List<Uri>? pictures});
  CharacterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CharacterCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Character, $Out>
    implements CharacterCopyWith<$R, Character, $Out> {
  _CharacterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Character> $mapper =
      CharacterMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Uri, ObjectCopyWith<$R, Uri, Uri>> get pictures =>
      ListCopyWith($value.pictures, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(pictures: v));
  @override
  $R call({int? id, String? name, List<Uri>? pictures}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (pictures != null) #pictures: pictures
      }));
  @override
  Character $make(CopyWithData data) => Character(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      pictures: data.get(#pictures, or: $value.pictures));

  @override
  CharacterCopyWith<$R2, Character, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CharacterCopyWithImpl($value, $cast, t);
}
