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
    }
    return _instance!;
  }

  @override
  final String id = 'Tier';

  static String _$name(Tier v) => v.name;
  static const Field<Tier, String> _f$name = Field('name', _$name);
  static List<int> _$characterIds(Tier v) => v.characterIds;
  static const Field<Tier, List<int>> _f$characterIds =
      Field('characterIds', _$characterIds);

  @override
  final MappableFields<Tier> fields = const {
    #name: _f$name,
    #characterIds: _f$characterIds,
  };

  static Tier _instantiate(DecodingData data) {
    return Tier(
        name: data.dec(_f$name), characterIds: data.dec(_f$characterIds));
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
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get characterIds;
  $R call({String? name, List<int>? characterIds});
  TierCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TierCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Tier, $Out>
    implements TierCopyWith<$R, Tier, $Out> {
  _TierCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Tier> $mapper = TierMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get characterIds =>
      ListCopyWith(
          $value.characterIds,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(characterIds: v));
  @override
  $R call({String? name, List<int>? characterIds}) => $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (characterIds != null) #characterIds: characterIds
      }));
  @override
  Tier $make(CopyWithData data) => Tier(
      name: data.get(#name, or: $value.name),
      characterIds: data.get(#characterIds, or: $value.characterIds));

  @override
  TierCopyWith<$R2, Tier, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TierCopyWithImpl($value, $cast, t);
}
