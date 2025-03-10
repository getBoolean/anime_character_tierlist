// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mal_models.dart';

class MalPageMapper extends ClassMapperBase<MalPage> {
  MalPageMapper._();

  static MalPageMapper? _instance;
  static MalPageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalPageMapper._());
      MalSeasonalAnimePageMapper.ensureInitialized();
      MalPagingMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalPage';
  @override
  Function get typeFactory => <T>(f) => f<MalPage<T>>();

  static List<dynamic> _$data(MalPage v) => v.data;
  static dynamic _arg$data<T>(f) => f<List<T>>();
  static const Field<MalPage, List<dynamic>> _f$data =
      Field('data', _$data, arg: _arg$data);
  static MalPaging _$paging(MalPage v) => v.paging;
  static const Field<MalPage, MalPaging> _f$paging = Field('paging', _$paging);

  @override
  final MappableFields<MalPage> fields = const {
    #data: _f$data,
    #paging: _f$paging,
  };

  static MalPage<T> _instantiate<T>(DecodingData data) {
    return MalPage(data: data.dec(_f$data), paging: data.dec(_f$paging));
  }

  @override
  final Function instantiate = _instantiate;

  static MalPage<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalPage<T>>(map);
  }

  static MalPage<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<MalPage<T>>(json);
  }
}

mixin MalPageMappable<T> {
  String toJson() {
    return MalPageMapper.ensureInitialized()
        .encodeJson<MalPage<T>>(this as MalPage<T>);
  }

  Map<String, dynamic> toMap() {
    return MalPageMapper.ensureInitialized()
        .encodeMap<MalPage<T>>(this as MalPage<T>);
  }

  MalPageCopyWith<MalPage<T>, MalPage<T>, MalPage<T>, T> get copyWith =>
      _MalPageCopyWithImpl(this as MalPage<T>, $identity, $identity);
  @override
  String toString() {
    return MalPageMapper.ensureInitialized().stringifyValue(this as MalPage<T>);
  }

  @override
  bool operator ==(Object other) {
    return MalPageMapper.ensureInitialized()
        .equalsValue(this as MalPage<T>, other);
  }

  @override
  int get hashCode {
    return MalPageMapper.ensureInitialized().hashValue(this as MalPage<T>);
  }
}

extension MalPageValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, MalPage<T>, $Out> {
  MalPageCopyWith<$R, MalPage<T>, $Out, T> get $asMalPage =>
      $base.as((v, t, t2) => _MalPageCopyWithImpl(v, t, t2));
}

abstract class MalPageCopyWith<$R, $In extends MalPage<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>?> get data;
  MalPagingCopyWith<$R, MalPaging, MalPaging> get paging;
  $R call({List<T>? data, MalPaging? paging});
  MalPageCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MalPageCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, MalPage<T>, $Out>
    implements MalPageCopyWith<$R, MalPage<T>, $Out, T> {
  _MalPageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalPage> $mapper =
      MalPageMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>?> get data => ListCopyWith(
      $value.data,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(data: v));
  @override
  MalPagingCopyWith<$R, MalPaging, MalPaging> get paging =>
      $value.paging.copyWith.$chain((v) => call(paging: v));
  @override
  $R call({List<T>? data, MalPaging? paging}) => $apply(FieldCopyWithData(
      {if (data != null) #data: data, if (paging != null) #paging: paging}));
  @override
  MalPage<T> $make(CopyWithData data) => MalPage(
      data: data.get(#data, or: $value.data),
      paging: data.get(#paging, or: $value.paging));

  @override
  MalPageCopyWith<$R2, MalPage<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalPageCopyWithImpl($value, $cast, t);
}

class MalPagingMapper extends ClassMapperBase<MalPaging> {
  MalPagingMapper._();

  static MalPagingMapper? _instance;
  static MalPagingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalPagingMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalPaging';

  static String? _$next(MalPaging v) => v.next;
  static const Field<MalPaging, String> _f$next = Field('next', _$next);

  @override
  final MappableFields<MalPaging> fields = const {
    #next: _f$next,
  };

  static MalPaging _instantiate(DecodingData data) {
    return MalPaging(next: data.dec(_f$next));
  }

  @override
  final Function instantiate = _instantiate;

  static MalPaging fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalPaging>(map);
  }

  static MalPaging fromJson(String json) {
    return ensureInitialized().decodeJson<MalPaging>(json);
  }
}

mixin MalPagingMappable {
  String toJson() {
    return MalPagingMapper.ensureInitialized()
        .encodeJson<MalPaging>(this as MalPaging);
  }

  Map<String, dynamic> toMap() {
    return MalPagingMapper.ensureInitialized()
        .encodeMap<MalPaging>(this as MalPaging);
  }

  MalPagingCopyWith<MalPaging, MalPaging, MalPaging> get copyWith =>
      _MalPagingCopyWithImpl(this as MalPaging, $identity, $identity);
  @override
  String toString() {
    return MalPagingMapper.ensureInitialized()
        .stringifyValue(this as MalPaging);
  }

  @override
  bool operator ==(Object other) {
    return MalPagingMapper.ensureInitialized()
        .equalsValue(this as MalPaging, other);
  }

  @override
  int get hashCode {
    return MalPagingMapper.ensureInitialized().hashValue(this as MalPaging);
  }
}

extension MalPagingValueCopy<$R, $Out> on ObjectCopyWith<$R, MalPaging, $Out> {
  MalPagingCopyWith<$R, MalPaging, $Out> get $asMalPaging =>
      $base.as((v, t, t2) => _MalPagingCopyWithImpl(v, t, t2));
}

abstract class MalPagingCopyWith<$R, $In extends MalPaging, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? next});
  MalPagingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MalPagingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalPaging, $Out>
    implements MalPagingCopyWith<$R, MalPaging, $Out> {
  _MalPagingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalPaging> $mapper =
      MalPagingMapper.ensureInitialized();
  @override
  $R call({Object? next = $none}) =>
      $apply(FieldCopyWithData({if (next != $none) #next: next}));
  @override
  MalPaging $make(CopyWithData data) =>
      MalPaging(next: data.get(#next, or: $value.next));

  @override
  MalPagingCopyWith<$R2, MalPaging, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalPagingCopyWithImpl($value, $cast, t);
}

class MalSeasonalAnimePageMapper extends ClassMapperBase<MalSeasonalAnimePage> {
  MalSeasonalAnimePageMapper._();

  static MalSeasonalAnimePageMapper? _instance;
  static MalSeasonalAnimePageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalSeasonalAnimePageMapper._());
      MalPageMapper.ensureInitialized();
      MalAnimeMapper.ensureInitialized();
      MalPagingMapper.ensureInitialized();
      MalAnimeSeasonMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalSeasonalAnimePage';

  static List<MalAnime> _$data(MalSeasonalAnimePage v) => v.data;
  static const Field<MalSeasonalAnimePage, List<MalAnime>> _f$data =
      Field('data', _$data);
  static MalPaging _$paging(MalSeasonalAnimePage v) => v.paging;
  static const Field<MalSeasonalAnimePage, MalPaging> _f$paging =
      Field('paging', _$paging);
  static MalAnimeSeason _$season(MalSeasonalAnimePage v) => v.season;
  static const Field<MalSeasonalAnimePage, MalAnimeSeason> _f$season =
      Field('season', _$season);

  @override
  final MappableFields<MalSeasonalAnimePage> fields = const {
    #data: _f$data,
    #paging: _f$paging,
    #season: _f$season,
  };

  static MalSeasonalAnimePage _instantiate(DecodingData data) {
    return MalSeasonalAnimePage(
        data: data.dec(_f$data),
        paging: data.dec(_f$paging),
        season: data.dec(_f$season));
  }

  @override
  final Function instantiate = _instantiate;

  static MalSeasonalAnimePage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalSeasonalAnimePage>(map);
  }

  static MalSeasonalAnimePage fromJson(String json) {
    return ensureInitialized().decodeJson<MalSeasonalAnimePage>(json);
  }
}

mixin MalSeasonalAnimePageMappable {
  String toJson() {
    return MalSeasonalAnimePageMapper.ensureInitialized()
        .encodeJson<MalSeasonalAnimePage>(this as MalSeasonalAnimePage);
  }

  Map<String, dynamic> toMap() {
    return MalSeasonalAnimePageMapper.ensureInitialized()
        .encodeMap<MalSeasonalAnimePage>(this as MalSeasonalAnimePage);
  }

  MalSeasonalAnimePageCopyWith<MalSeasonalAnimePage, MalSeasonalAnimePage,
          MalSeasonalAnimePage>
      get copyWith => _MalSeasonalAnimePageCopyWithImpl(
          this as MalSeasonalAnimePage, $identity, $identity);
  @override
  String toString() {
    return MalSeasonalAnimePageMapper.ensureInitialized()
        .stringifyValue(this as MalSeasonalAnimePage);
  }

  @override
  bool operator ==(Object other) {
    return MalSeasonalAnimePageMapper.ensureInitialized()
        .equalsValue(this as MalSeasonalAnimePage, other);
  }

  @override
  int get hashCode {
    return MalSeasonalAnimePageMapper.ensureInitialized()
        .hashValue(this as MalSeasonalAnimePage);
  }
}

extension MalSeasonalAnimePageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalSeasonalAnimePage, $Out> {
  MalSeasonalAnimePageCopyWith<$R, MalSeasonalAnimePage, $Out>
      get $asMalSeasonalAnimePage =>
          $base.as((v, t, t2) => _MalSeasonalAnimePageCopyWithImpl(v, t, t2));
}

abstract class MalSeasonalAnimePageCopyWith<
    $R,
    $In extends MalSeasonalAnimePage,
    $Out> implements MalPageCopyWith<$R, $In, $Out, MalAnime> {
  @override
  ListCopyWith<$R, MalAnime, MalAnimeCopyWith<$R, MalAnime, MalAnime>> get data;
  @override
  MalPagingCopyWith<$R, MalPaging, MalPaging> get paging;
  MalAnimeSeasonCopyWith<$R, MalAnimeSeason, MalAnimeSeason> get season;
  @override
  $R call({List<MalAnime>? data, MalPaging? paging, MalAnimeSeason? season});
  MalSeasonalAnimePageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalSeasonalAnimePageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalSeasonalAnimePage, $Out>
    implements MalSeasonalAnimePageCopyWith<$R, MalSeasonalAnimePage, $Out> {
  _MalSeasonalAnimePageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalSeasonalAnimePage> $mapper =
      MalSeasonalAnimePageMapper.ensureInitialized();
  @override
  ListCopyWith<$R, MalAnime, MalAnimeCopyWith<$R, MalAnime, MalAnime>>
      get data => ListCopyWith(
          $value.data, (v, t) => v.copyWith.$chain(t), (v) => call(data: v));
  @override
  MalPagingCopyWith<$R, MalPaging, MalPaging> get paging =>
      $value.paging.copyWith.$chain((v) => call(paging: v));
  @override
  MalAnimeSeasonCopyWith<$R, MalAnimeSeason, MalAnimeSeason> get season =>
      $value.season.copyWith.$chain((v) => call(season: v));
  @override
  $R call({List<MalAnime>? data, MalPaging? paging, MalAnimeSeason? season}) =>
      $apply(FieldCopyWithData({
        if (data != null) #data: data,
        if (paging != null) #paging: paging,
        if (season != null) #season: season
      }));
  @override
  MalSeasonalAnimePage $make(CopyWithData data) => MalSeasonalAnimePage(
      data: data.get(#data, or: $value.data),
      paging: data.get(#paging, or: $value.paging),
      season: data.get(#season, or: $value.season));

  @override
  MalSeasonalAnimePageCopyWith<$R2, MalSeasonalAnimePage, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MalSeasonalAnimePageCopyWithImpl($value, $cast, t);
}

class MalAnimeMapper extends ClassMapperBase<MalAnime> {
  MalAnimeMapper._();

  static MalAnimeMapper? _instance;
  static MalAnimeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalAnimeMapper._());
      MalUserAnimeMapper.ensureInitialized();
      MalEntryNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalAnime';

  static MalEntryNode _$node(MalAnime v) => v.node;
  static const Field<MalAnime, MalEntryNode> _f$node = Field('node', _$node);

  @override
  final MappableFields<MalAnime> fields = const {
    #node: _f$node,
  };

  static MalAnime _instantiate(DecodingData data) {
    return MalAnime(node: data.dec(_f$node));
  }

  @override
  final Function instantiate = _instantiate;

  static MalAnime fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalAnime>(map);
  }

  static MalAnime fromJson(String json) {
    return ensureInitialized().decodeJson<MalAnime>(json);
  }
}

mixin MalAnimeMappable {
  String toJson() {
    return MalAnimeMapper.ensureInitialized()
        .encodeJson<MalAnime>(this as MalAnime);
  }

  Map<String, dynamic> toMap() {
    return MalAnimeMapper.ensureInitialized()
        .encodeMap<MalAnime>(this as MalAnime);
  }

  MalAnimeCopyWith<MalAnime, MalAnime, MalAnime> get copyWith =>
      _MalAnimeCopyWithImpl(this as MalAnime, $identity, $identity);
  @override
  String toString() {
    return MalAnimeMapper.ensureInitialized().stringifyValue(this as MalAnime);
  }

  @override
  bool operator ==(Object other) {
    return MalAnimeMapper.ensureInitialized()
        .equalsValue(this as MalAnime, other);
  }

  @override
  int get hashCode {
    return MalAnimeMapper.ensureInitialized().hashValue(this as MalAnime);
  }
}

extension MalAnimeValueCopy<$R, $Out> on ObjectCopyWith<$R, MalAnime, $Out> {
  MalAnimeCopyWith<$R, MalAnime, $Out> get $asMalAnime =>
      $base.as((v, t, t2) => _MalAnimeCopyWithImpl(v, t, t2));
}

abstract class MalAnimeCopyWith<$R, $In extends MalAnime, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MalEntryNodeCopyWith<$R, MalEntryNode, MalEntryNode> get node;
  $R call({MalEntryNode? node});
  MalAnimeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MalAnimeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalAnime, $Out>
    implements MalAnimeCopyWith<$R, MalAnime, $Out> {
  _MalAnimeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalAnime> $mapper =
      MalAnimeMapper.ensureInitialized();
  @override
  MalEntryNodeCopyWith<$R, MalEntryNode, MalEntryNode> get node =>
      $value.node.copyWith.$chain((v) => call(node: v));
  @override
  $R call({MalEntryNode? node}) =>
      $apply(FieldCopyWithData({if (node != null) #node: node}));
  @override
  MalAnime $make(CopyWithData data) =>
      MalAnime(node: data.get(#node, or: $value.node));

  @override
  MalAnimeCopyWith<$R2, MalAnime, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalAnimeCopyWithImpl($value, $cast, t);
}

class MalEntryNodeMapper extends ClassMapperBase<MalEntryNode> {
  MalEntryNodeMapper._();

  static MalEntryNodeMapper? _instance;
  static MalEntryNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalEntryNodeMapper._());
      MalEntryDetailsMapper.ensureInitialized();
      MalPictureMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalEntryNode';

  static int _$id(MalEntryNode v) => v.id;
  static const Field<MalEntryNode, int> _f$id = Field('id', _$id);
  static String _$title(MalEntryNode v) => v.title;
  static const Field<MalEntryNode, String> _f$title = Field('title', _$title);
  static MalPicture _$mainPicture(MalEntryNode v) => v.mainPicture;
  static const Field<MalEntryNode, MalPicture> _f$mainPicture =
      Field('mainPicture', _$mainPicture, key: r'main_picture');

  @override
  final MappableFields<MalEntryNode> fields = const {
    #id: _f$id,
    #title: _f$title,
    #mainPicture: _f$mainPicture,
  };

  static MalEntryNode _instantiate(DecodingData data) {
    return MalEntryNode(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        mainPicture: data.dec(_f$mainPicture));
  }

  @override
  final Function instantiate = _instantiate;

  static MalEntryNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalEntryNode>(map);
  }

  static MalEntryNode fromJson(String json) {
    return ensureInitialized().decodeJson<MalEntryNode>(json);
  }
}

mixin MalEntryNodeMappable {
  String toJson() {
    return MalEntryNodeMapper.ensureInitialized()
        .encodeJson<MalEntryNode>(this as MalEntryNode);
  }

  Map<String, dynamic> toMap() {
    return MalEntryNodeMapper.ensureInitialized()
        .encodeMap<MalEntryNode>(this as MalEntryNode);
  }

  MalEntryNodeCopyWith<MalEntryNode, MalEntryNode, MalEntryNode> get copyWith =>
      _MalEntryNodeCopyWithImpl(this as MalEntryNode, $identity, $identity);
  @override
  String toString() {
    return MalEntryNodeMapper.ensureInitialized()
        .stringifyValue(this as MalEntryNode);
  }

  @override
  bool operator ==(Object other) {
    return MalEntryNodeMapper.ensureInitialized()
        .equalsValue(this as MalEntryNode, other);
  }

  @override
  int get hashCode {
    return MalEntryNodeMapper.ensureInitialized()
        .hashValue(this as MalEntryNode);
  }
}

extension MalEntryNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalEntryNode, $Out> {
  MalEntryNodeCopyWith<$R, MalEntryNode, $Out> get $asMalEntryNode =>
      $base.as((v, t, t2) => _MalEntryNodeCopyWithImpl(v, t, t2));
}

abstract class MalEntryNodeCopyWith<$R, $In extends MalEntryNode, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MalPictureCopyWith<$R, MalPicture, MalPicture> get mainPicture;
  $R call({int? id, String? title, MalPicture? mainPicture});
  MalEntryNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MalEntryNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalEntryNode, $Out>
    implements MalEntryNodeCopyWith<$R, MalEntryNode, $Out> {
  _MalEntryNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalEntryNode> $mapper =
      MalEntryNodeMapper.ensureInitialized();
  @override
  MalPictureCopyWith<$R, MalPicture, MalPicture> get mainPicture =>
      $value.mainPicture.copyWith.$chain((v) => call(mainPicture: v));
  @override
  $R call({int? id, String? title, MalPicture? mainPicture}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (mainPicture != null) #mainPicture: mainPicture
      }));
  @override
  MalEntryNode $make(CopyWithData data) => MalEntryNode(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      mainPicture: data.get(#mainPicture, or: $value.mainPicture));

  @override
  MalEntryNodeCopyWith<$R2, MalEntryNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalEntryNodeCopyWithImpl($value, $cast, t);
}

class MalPictureMapper extends ClassMapperBase<MalPicture> {
  MalPictureMapper._();

  static MalPictureMapper? _instance;
  static MalPictureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalPictureMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalPicture';

  static String _$medium(MalPicture v) => v.medium;
  static const Field<MalPicture, String> _f$medium = Field('medium', _$medium);
  static String _$large(MalPicture v) => v.large;
  static const Field<MalPicture, String> _f$large = Field('large', _$large);

  @override
  final MappableFields<MalPicture> fields = const {
    #medium: _f$medium,
    #large: _f$large,
  };

  static MalPicture _instantiate(DecodingData data) {
    return MalPicture(medium: data.dec(_f$medium), large: data.dec(_f$large));
  }

  @override
  final Function instantiate = _instantiate;

  static MalPicture fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalPicture>(map);
  }

  static MalPicture fromJson(String json) {
    return ensureInitialized().decodeJson<MalPicture>(json);
  }
}

mixin MalPictureMappable {
  String toJson() {
    return MalPictureMapper.ensureInitialized()
        .encodeJson<MalPicture>(this as MalPicture);
  }

  Map<String, dynamic> toMap() {
    return MalPictureMapper.ensureInitialized()
        .encodeMap<MalPicture>(this as MalPicture);
  }

  MalPictureCopyWith<MalPicture, MalPicture, MalPicture> get copyWith =>
      _MalPictureCopyWithImpl(this as MalPicture, $identity, $identity);
  @override
  String toString() {
    return MalPictureMapper.ensureInitialized()
        .stringifyValue(this as MalPicture);
  }

  @override
  bool operator ==(Object other) {
    return MalPictureMapper.ensureInitialized()
        .equalsValue(this as MalPicture, other);
  }

  @override
  int get hashCode {
    return MalPictureMapper.ensureInitialized().hashValue(this as MalPicture);
  }
}

extension MalPictureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalPicture, $Out> {
  MalPictureCopyWith<$R, MalPicture, $Out> get $asMalPicture =>
      $base.as((v, t, t2) => _MalPictureCopyWithImpl(v, t, t2));
}

abstract class MalPictureCopyWith<$R, $In extends MalPicture, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? medium, String? large});
  MalPictureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MalPictureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalPicture, $Out>
    implements MalPictureCopyWith<$R, MalPicture, $Out> {
  _MalPictureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalPicture> $mapper =
      MalPictureMapper.ensureInitialized();
  @override
  $R call({String? medium, String? large}) => $apply(FieldCopyWithData(
      {if (medium != null) #medium: medium, if (large != null) #large: large}));
  @override
  MalPicture $make(CopyWithData data) => MalPicture(
      medium: data.get(#medium, or: $value.medium),
      large: data.get(#large, or: $value.large));

  @override
  MalPictureCopyWith<$R2, MalPicture, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalPictureCopyWithImpl($value, $cast, t);
}

class MalAnimeSeasonMapper extends ClassMapperBase<MalAnimeSeason> {
  MalAnimeSeasonMapper._();

  static MalAnimeSeasonMapper? _instance;
  static MalAnimeSeasonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalAnimeSeasonMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalAnimeSeason';

  static int _$year(MalAnimeSeason v) => v.year;
  static const Field<MalAnimeSeason, int> _f$year = Field('year', _$year);
  static String _$season(MalAnimeSeason v) => v.season;
  static const Field<MalAnimeSeason, String> _f$season =
      Field('season', _$season);

  @override
  final MappableFields<MalAnimeSeason> fields = const {
    #year: _f$year,
    #season: _f$season,
  };

  static MalAnimeSeason _instantiate(DecodingData data) {
    return MalAnimeSeason(year: data.dec(_f$year), season: data.dec(_f$season));
  }

  @override
  final Function instantiate = _instantiate;

  static MalAnimeSeason fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalAnimeSeason>(map);
  }

  static MalAnimeSeason fromJson(String json) {
    return ensureInitialized().decodeJson<MalAnimeSeason>(json);
  }
}

mixin MalAnimeSeasonMappable {
  String toJson() {
    return MalAnimeSeasonMapper.ensureInitialized()
        .encodeJson<MalAnimeSeason>(this as MalAnimeSeason);
  }

  Map<String, dynamic> toMap() {
    return MalAnimeSeasonMapper.ensureInitialized()
        .encodeMap<MalAnimeSeason>(this as MalAnimeSeason);
  }

  MalAnimeSeasonCopyWith<MalAnimeSeason, MalAnimeSeason, MalAnimeSeason>
      get copyWith => _MalAnimeSeasonCopyWithImpl(
          this as MalAnimeSeason, $identity, $identity);
  @override
  String toString() {
    return MalAnimeSeasonMapper.ensureInitialized()
        .stringifyValue(this as MalAnimeSeason);
  }

  @override
  bool operator ==(Object other) {
    return MalAnimeSeasonMapper.ensureInitialized()
        .equalsValue(this as MalAnimeSeason, other);
  }

  @override
  int get hashCode {
    return MalAnimeSeasonMapper.ensureInitialized()
        .hashValue(this as MalAnimeSeason);
  }
}

extension MalAnimeSeasonValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalAnimeSeason, $Out> {
  MalAnimeSeasonCopyWith<$R, MalAnimeSeason, $Out> get $asMalAnimeSeason =>
      $base.as((v, t, t2) => _MalAnimeSeasonCopyWithImpl(v, t, t2));
}

abstract class MalAnimeSeasonCopyWith<$R, $In extends MalAnimeSeason, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? year, String? season});
  MalAnimeSeasonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalAnimeSeasonCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalAnimeSeason, $Out>
    implements MalAnimeSeasonCopyWith<$R, MalAnimeSeason, $Out> {
  _MalAnimeSeasonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalAnimeSeason> $mapper =
      MalAnimeSeasonMapper.ensureInitialized();
  @override
  $R call({int? year, String? season}) => $apply(FieldCopyWithData(
      {if (year != null) #year: year, if (season != null) #season: season}));
  @override
  MalAnimeSeason $make(CopyWithData data) => MalAnimeSeason(
      year: data.get(#year, or: $value.year),
      season: data.get(#season, or: $value.season));

  @override
  MalAnimeSeasonCopyWith<$R2, MalAnimeSeason, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalAnimeSeasonCopyWithImpl($value, $cast, t);
}

class MalUserAnimeMapper extends ClassMapperBase<MalUserAnime> {
  MalUserAnimeMapper._();

  static MalUserAnimeMapper? _instance;
  static MalUserAnimeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalUserAnimeMapper._());
      MalAnimeMapper.ensureInitialized();
      MalEntryNodeMapper.ensureInitialized();
      MalListStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalUserAnime';

  static MalEntryNode _$node(MalUserAnime v) => v.node;
  static const Field<MalUserAnime, MalEntryNode> _f$node =
      Field('node', _$node);
  static MalListStatus _$listStatus(MalUserAnime v) => v.listStatus;
  static const Field<MalUserAnime, MalListStatus> _f$listStatus =
      Field('listStatus', _$listStatus, key: r'list_status');

  @override
  final MappableFields<MalUserAnime> fields = const {
    #node: _f$node,
    #listStatus: _f$listStatus,
  };

  static MalUserAnime _instantiate(DecodingData data) {
    return MalUserAnime(
        node: data.dec(_f$node), listStatus: data.dec(_f$listStatus));
  }

  @override
  final Function instantiate = _instantiate;

  static MalUserAnime fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalUserAnime>(map);
  }

  static MalUserAnime fromJson(String json) {
    return ensureInitialized().decodeJson<MalUserAnime>(json);
  }
}

mixin MalUserAnimeMappable {
  String toJson() {
    return MalUserAnimeMapper.ensureInitialized()
        .encodeJson<MalUserAnime>(this as MalUserAnime);
  }

  Map<String, dynamic> toMap() {
    return MalUserAnimeMapper.ensureInitialized()
        .encodeMap<MalUserAnime>(this as MalUserAnime);
  }

  MalUserAnimeCopyWith<MalUserAnime, MalUserAnime, MalUserAnime> get copyWith =>
      _MalUserAnimeCopyWithImpl(this as MalUserAnime, $identity, $identity);
  @override
  String toString() {
    return MalUserAnimeMapper.ensureInitialized()
        .stringifyValue(this as MalUserAnime);
  }

  @override
  bool operator ==(Object other) {
    return MalUserAnimeMapper.ensureInitialized()
        .equalsValue(this as MalUserAnime, other);
  }

  @override
  int get hashCode {
    return MalUserAnimeMapper.ensureInitialized()
        .hashValue(this as MalUserAnime);
  }
}

extension MalUserAnimeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalUserAnime, $Out> {
  MalUserAnimeCopyWith<$R, MalUserAnime, $Out> get $asMalUserAnime =>
      $base.as((v, t, t2) => _MalUserAnimeCopyWithImpl(v, t, t2));
}

abstract class MalUserAnimeCopyWith<$R, $In extends MalUserAnime, $Out>
    implements MalAnimeCopyWith<$R, $In, $Out> {
  @override
  MalEntryNodeCopyWith<$R, MalEntryNode, MalEntryNode> get node;
  MalListStatusCopyWith<$R, MalListStatus, MalListStatus> get listStatus;
  @override
  $R call({MalEntryNode? node, MalListStatus? listStatus});
  MalUserAnimeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MalUserAnimeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalUserAnime, $Out>
    implements MalUserAnimeCopyWith<$R, MalUserAnime, $Out> {
  _MalUserAnimeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalUserAnime> $mapper =
      MalUserAnimeMapper.ensureInitialized();
  @override
  MalEntryNodeCopyWith<$R, MalEntryNode, MalEntryNode> get node =>
      $value.node.copyWith.$chain((v) => call(node: v));
  @override
  MalListStatusCopyWith<$R, MalListStatus, MalListStatus> get listStatus =>
      $value.listStatus.copyWith.$chain((v) => call(listStatus: v));
  @override
  $R call({MalEntryNode? node, MalListStatus? listStatus}) =>
      $apply(FieldCopyWithData({
        if (node != null) #node: node,
        if (listStatus != null) #listStatus: listStatus
      }));
  @override
  MalUserAnime $make(CopyWithData data) => MalUserAnime(
      node: data.get(#node, or: $value.node),
      listStatus: data.get(#listStatus, or: $value.listStatus));

  @override
  MalUserAnimeCopyWith<$R2, MalUserAnime, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalUserAnimeCopyWithImpl($value, $cast, t);
}

class MalListStatusMapper extends ClassMapperBase<MalListStatus> {
  MalListStatusMapper._();

  static MalListStatusMapper? _instance;
  static MalListStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalListStatusMapper._());
      MalAnimeListStatusMapper.ensureInitialized();
      MalMangaDetailsListStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalListStatus';

  static String _$status(MalListStatus v) => v.status;
  static const Field<MalListStatus, String> _f$status =
      Field('status', _$status);
  static int _$score(MalListStatus v) => v.score;
  static const Field<MalListStatus, int> _f$score = Field('score', _$score);
  static DateTime _$updatedAt(MalListStatus v) => v.updatedAt;
  static const Field<MalListStatus, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: r'updated_at');

  @override
  final MappableFields<MalListStatus> fields = const {
    #status: _f$status,
    #score: _f$score,
    #updatedAt: _f$updatedAt,
  };

  static MalListStatus _instantiate(DecodingData data) {
    return MalListStatus(
        status: data.dec(_f$status),
        score: data.dec(_f$score),
        updatedAt: data.dec(_f$updatedAt));
  }

  @override
  final Function instantiate = _instantiate;

  static MalListStatus fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalListStatus>(map);
  }

  static MalListStatus fromJson(String json) {
    return ensureInitialized().decodeJson<MalListStatus>(json);
  }
}

mixin MalListStatusMappable {
  String toJson() {
    return MalListStatusMapper.ensureInitialized()
        .encodeJson<MalListStatus>(this as MalListStatus);
  }

  Map<String, dynamic> toMap() {
    return MalListStatusMapper.ensureInitialized()
        .encodeMap<MalListStatus>(this as MalListStatus);
  }

  MalListStatusCopyWith<MalListStatus, MalListStatus, MalListStatus>
      get copyWith => _MalListStatusCopyWithImpl(
          this as MalListStatus, $identity, $identity);
  @override
  String toString() {
    return MalListStatusMapper.ensureInitialized()
        .stringifyValue(this as MalListStatus);
  }

  @override
  bool operator ==(Object other) {
    return MalListStatusMapper.ensureInitialized()
        .equalsValue(this as MalListStatus, other);
  }

  @override
  int get hashCode {
    return MalListStatusMapper.ensureInitialized()
        .hashValue(this as MalListStatus);
  }
}

extension MalListStatusValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalListStatus, $Out> {
  MalListStatusCopyWith<$R, MalListStatus, $Out> get $asMalListStatus =>
      $base.as((v, t, t2) => _MalListStatusCopyWithImpl(v, t, t2));
}

abstract class MalListStatusCopyWith<$R, $In extends MalListStatus, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? status, int? score, DateTime? updatedAt});
  MalListStatusCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MalListStatusCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalListStatus, $Out>
    implements MalListStatusCopyWith<$R, MalListStatus, $Out> {
  _MalListStatusCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalListStatus> $mapper =
      MalListStatusMapper.ensureInitialized();
  @override
  $R call({String? status, int? score, DateTime? updatedAt}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (score != null) #score: score,
        if (updatedAt != null) #updatedAt: updatedAt
      }));
  @override
  MalListStatus $make(CopyWithData data) => MalListStatus(
      status: data.get(#status, or: $value.status),
      score: data.get(#score, or: $value.score),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt));

  @override
  MalListStatusCopyWith<$R2, MalListStatus, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalListStatusCopyWithImpl($value, $cast, t);
}

class MalEntryDetailsMapper extends ClassMapperBase<MalEntryDetails> {
  MalEntryDetailsMapper._();

  static MalEntryDetailsMapper? _instance;
  static MalEntryDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalEntryDetailsMapper._());
      MalEntryNodeMapper.ensureInitialized();
      MalAnimeDetailsMapper.ensureInitialized();
      MalMangaDetailsMapper.ensureInitialized();
      MalPictureMapper.ensureInitialized();
      MalAlternativeTitlesMapper.ensureInitialized();
      MalGenreMapper.ensureInitialized();
      MalListStatusMapper.ensureInitialized();
      MalAnimeRelatedMapper.ensureInitialized();
      MalMangaDetailsRelatedMapper.ensureInitialized();
      MalAnimeRecommendationMapper.ensureInitialized();
      MalStudioMapper.ensureInitialized();
      MalAnimeStatisticsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalEntryDetails';

  static int _$id(MalEntryDetails v) => v.id;
  static const Field<MalEntryDetails, int> _f$id = Field('id', _$id);
  static String _$title(MalEntryDetails v) => v.title;
  static const Field<MalEntryDetails, String> _f$title =
      Field('title', _$title);
  static MalPicture _$mainPicture(MalEntryDetails v) => v.mainPicture;
  static const Field<MalEntryDetails, MalPicture> _f$mainPicture =
      Field('mainPicture', _$mainPicture, key: r'main_picture');
  static MalAlternativeTitles _$alternativeTitles(MalEntryDetails v) =>
      v.alternativeTitles;
  static const Field<MalEntryDetails, MalAlternativeTitles>
      _f$alternativeTitles = Field('alternativeTitles', _$alternativeTitles,
          key: r'alternative_titles');
  static DateTime _$startDate(MalEntryDetails v) => v.startDate;
  static const Field<MalEntryDetails, DateTime> _f$startDate =
      Field('startDate', _$startDate, key: r'start_date');
  static DateTime _$endDate(MalEntryDetails v) => v.endDate;
  static const Field<MalEntryDetails, DateTime> _f$endDate =
      Field('endDate', _$endDate, key: r'end_date');
  static String _$synopsis(MalEntryDetails v) => v.synopsis;
  static const Field<MalEntryDetails, String> _f$synopsis =
      Field('synopsis', _$synopsis);
  static double _$mean(MalEntryDetails v) => v.mean;
  static const Field<MalEntryDetails, double> _f$mean = Field('mean', _$mean);
  static int _$rank(MalEntryDetails v) => v.rank;
  static const Field<MalEntryDetails, int> _f$rank = Field('rank', _$rank);
  static int _$popularity(MalEntryDetails v) => v.popularity;
  static const Field<MalEntryDetails, int> _f$popularity =
      Field('popularity', _$popularity);
  static int _$numListUsers(MalEntryDetails v) => v.numListUsers;
  static const Field<MalEntryDetails, int> _f$numListUsers =
      Field('numListUsers', _$numListUsers, key: r'num_list_users');
  static int _$numScoringUsers(MalEntryDetails v) => v.numScoringUsers;
  static const Field<MalEntryDetails, int> _f$numScoringUsers =
      Field('numScoringUsers', _$numScoringUsers, key: r'num_scoring_users');
  static String _$nsfw(MalEntryDetails v) => v.nsfw;
  static const Field<MalEntryDetails, String> _f$nsfw = Field('nsfw', _$nsfw);
  static DateTime _$createdAt(MalEntryDetails v) => v.createdAt;
  static const Field<MalEntryDetails, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static DateTime _$updatedAt(MalEntryDetails v) => v.updatedAt;
  static const Field<MalEntryDetails, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: r'updated_at');
  static String _$mediaType(MalEntryDetails v) => v.mediaType;
  static const Field<MalEntryDetails, String> _f$mediaType =
      Field('mediaType', _$mediaType, key: r'media_type');
  static String _$status(MalEntryDetails v) => v.status;
  static const Field<MalEntryDetails, String> _f$status =
      Field('status', _$status);
  static List<MalGenre> _$genres(MalEntryDetails v) => v.genres;
  static const Field<MalEntryDetails, List<MalGenre>> _f$genres =
      Field('genres', _$genres);
  static MalListStatus _$myListStatus(MalEntryDetails v) => v.myListStatus;
  static const Field<MalEntryDetails, MalListStatus> _f$myListStatus =
      Field('myListStatus', _$myListStatus, key: r'my_list_status');
  static List<MalPicture> _$pictures(MalEntryDetails v) => v.pictures;
  static const Field<MalEntryDetails, List<MalPicture>> _f$pictures =
      Field('pictures', _$pictures);
  static String _$background(MalEntryDetails v) => v.background;
  static const Field<MalEntryDetails, String> _f$background =
      Field('background', _$background);
  static List<MalAnimeRelated> _$relatedAnime(MalEntryDetails v) =>
      v.relatedAnime;
  static const Field<MalEntryDetails, List<MalAnimeRelated>> _f$relatedAnime =
      Field('relatedAnime', _$relatedAnime, key: r'related_anime');
  static List<MalMangaDetailsRelated> _$relatedManga(MalEntryDetails v) =>
      v.relatedManga;
  static const Field<MalEntryDetails, List<MalMangaDetailsRelated>>
      _f$relatedManga =
      Field('relatedManga', _$relatedManga, key: r'related_manga');
  static List<MalAnimeRecommendation> _$recommendations(MalEntryDetails v) =>
      v.recommendations;
  static const Field<MalEntryDetails, List<MalAnimeRecommendation>>
      _f$recommendations = Field('recommendations', _$recommendations);
  static List<MalStudio> _$studios(MalEntryDetails v) => v.studios;
  static const Field<MalEntryDetails, List<MalStudio>> _f$studios =
      Field('studios', _$studios);
  static MalAnimeStatistics _$statistics(MalEntryDetails v) => v.statistics;
  static const Field<MalEntryDetails, MalAnimeStatistics> _f$statistics =
      Field('statistics', _$statistics);

  @override
  final MappableFields<MalEntryDetails> fields = const {
    #id: _f$id,
    #title: _f$title,
    #mainPicture: _f$mainPicture,
    #alternativeTitles: _f$alternativeTitles,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #synopsis: _f$synopsis,
    #mean: _f$mean,
    #rank: _f$rank,
    #popularity: _f$popularity,
    #numListUsers: _f$numListUsers,
    #numScoringUsers: _f$numScoringUsers,
    #nsfw: _f$nsfw,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #mediaType: _f$mediaType,
    #status: _f$status,
    #genres: _f$genres,
    #myListStatus: _f$myListStatus,
    #pictures: _f$pictures,
    #background: _f$background,
    #relatedAnime: _f$relatedAnime,
    #relatedManga: _f$relatedManga,
    #recommendations: _f$recommendations,
    #studios: _f$studios,
    #statistics: _f$statistics,
  };

  static MalEntryDetails _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('MalEntryDetails');
  }

  @override
  final Function instantiate = _instantiate;

  static MalEntryDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalEntryDetails>(map);
  }

  static MalEntryDetails fromJson(String json) {
    return ensureInitialized().decodeJson<MalEntryDetails>(json);
  }
}

mixin MalEntryDetailsMappable {
  String toJson();
  Map<String, dynamic> toMap();
  MalEntryDetailsCopyWith<MalEntryDetails, MalEntryDetails, MalEntryDetails>
      get copyWith;
}

abstract class MalEntryDetailsCopyWith<$R, $In extends MalEntryDetails, $Out>
    implements MalEntryNodeCopyWith<$R, $In, $Out> {
  @override
  MalPictureCopyWith<$R, MalPicture, MalPicture> get mainPicture;
  MalAlternativeTitlesCopyWith<$R, MalAlternativeTitles, MalAlternativeTitles>
      get alternativeTitles;
  ListCopyWith<$R, MalGenre, MalGenreCopyWith<$R, MalGenre, MalGenre>>
      get genres;
  MalListStatusCopyWith<$R, MalListStatus, MalListStatus> get myListStatus;
  ListCopyWith<$R, MalPicture, MalPictureCopyWith<$R, MalPicture, MalPicture>>
      get pictures;
  ListCopyWith<$R, MalAnimeRelated,
          MalAnimeRelatedCopyWith<$R, MalAnimeRelated, MalAnimeRelated>>
      get relatedAnime;
  ListCopyWith<
      $R,
      MalMangaDetailsRelated,
      MalMangaDetailsRelatedCopyWith<$R, MalMangaDetailsRelated,
          MalMangaDetailsRelated>> get relatedManga;
  ListCopyWith<
      $R,
      MalAnimeRecommendation,
      MalAnimeRecommendationCopyWith<$R, MalAnimeRecommendation,
          MalAnimeRecommendation>> get recommendations;
  ListCopyWith<$R, MalStudio, MalStudioCopyWith<$R, MalStudio, MalStudio>>
      get studios;
  MalAnimeStatisticsCopyWith<$R, MalAnimeStatistics, MalAnimeStatistics>
      get statistics;
  @override
  $R call(
      {int? id,
      String? title,
      MalPicture? mainPicture,
      MalAlternativeTitles? alternativeTitles,
      DateTime? startDate,
      DateTime? endDate,
      String? synopsis,
      double? mean,
      int? rank,
      int? popularity,
      int? numListUsers,
      int? numScoringUsers,
      String? nsfw,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? mediaType,
      String? status,
      List<MalGenre>? genres,
      MalListStatus? myListStatus,
      List<MalPicture>? pictures,
      String? background,
      List<MalAnimeRelated>? relatedAnime,
      List<MalMangaDetailsRelated>? relatedManga,
      List<MalAnimeRecommendation>? recommendations,
      List<MalStudio>? studios,
      MalAnimeStatistics? statistics});
  MalEntryDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class MalAlternativeTitlesMapper extends ClassMapperBase<MalAlternativeTitles> {
  MalAlternativeTitlesMapper._();

  static MalAlternativeTitlesMapper? _instance;
  static MalAlternativeTitlesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalAlternativeTitlesMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalAlternativeTitles';

  static List<String> _$synonyms(MalAlternativeTitles v) => v.synonyms;
  static const Field<MalAlternativeTitles, List<String>> _f$synonyms =
      Field('synonyms', _$synonyms);
  static String _$en(MalAlternativeTitles v) => v.en;
  static const Field<MalAlternativeTitles, String> _f$en = Field('en', _$en);
  static String _$ja(MalAlternativeTitles v) => v.ja;
  static const Field<MalAlternativeTitles, String> _f$ja = Field('ja', _$ja);

  @override
  final MappableFields<MalAlternativeTitles> fields = const {
    #synonyms: _f$synonyms,
    #en: _f$en,
    #ja: _f$ja,
  };

  static MalAlternativeTitles _instantiate(DecodingData data) {
    return MalAlternativeTitles(
        synonyms: data.dec(_f$synonyms),
        en: data.dec(_f$en),
        ja: data.dec(_f$ja));
  }

  @override
  final Function instantiate = _instantiate;

  static MalAlternativeTitles fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalAlternativeTitles>(map);
  }

  static MalAlternativeTitles fromJson(String json) {
    return ensureInitialized().decodeJson<MalAlternativeTitles>(json);
  }
}

mixin MalAlternativeTitlesMappable {
  String toJson() {
    return MalAlternativeTitlesMapper.ensureInitialized()
        .encodeJson<MalAlternativeTitles>(this as MalAlternativeTitles);
  }

  Map<String, dynamic> toMap() {
    return MalAlternativeTitlesMapper.ensureInitialized()
        .encodeMap<MalAlternativeTitles>(this as MalAlternativeTitles);
  }

  MalAlternativeTitlesCopyWith<MalAlternativeTitles, MalAlternativeTitles,
          MalAlternativeTitles>
      get copyWith => _MalAlternativeTitlesCopyWithImpl(
          this as MalAlternativeTitles, $identity, $identity);
  @override
  String toString() {
    return MalAlternativeTitlesMapper.ensureInitialized()
        .stringifyValue(this as MalAlternativeTitles);
  }

  @override
  bool operator ==(Object other) {
    return MalAlternativeTitlesMapper.ensureInitialized()
        .equalsValue(this as MalAlternativeTitles, other);
  }

  @override
  int get hashCode {
    return MalAlternativeTitlesMapper.ensureInitialized()
        .hashValue(this as MalAlternativeTitles);
  }
}

extension MalAlternativeTitlesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalAlternativeTitles, $Out> {
  MalAlternativeTitlesCopyWith<$R, MalAlternativeTitles, $Out>
      get $asMalAlternativeTitles =>
          $base.as((v, t, t2) => _MalAlternativeTitlesCopyWithImpl(v, t, t2));
}

abstract class MalAlternativeTitlesCopyWith<
    $R,
    $In extends MalAlternativeTitles,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get synonyms;
  $R call({List<String>? synonyms, String? en, String? ja});
  MalAlternativeTitlesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalAlternativeTitlesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalAlternativeTitles, $Out>
    implements MalAlternativeTitlesCopyWith<$R, MalAlternativeTitles, $Out> {
  _MalAlternativeTitlesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalAlternativeTitles> $mapper =
      MalAlternativeTitlesMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get synonyms =>
      ListCopyWith($value.synonyms, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(synonyms: v));
  @override
  $R call({List<String>? synonyms, String? en, String? ja}) =>
      $apply(FieldCopyWithData({
        if (synonyms != null) #synonyms: synonyms,
        if (en != null) #en: en,
        if (ja != null) #ja: ja
      }));
  @override
  MalAlternativeTitles $make(CopyWithData data) => MalAlternativeTitles(
      synonyms: data.get(#synonyms, or: $value.synonyms),
      en: data.get(#en, or: $value.en),
      ja: data.get(#ja, or: $value.ja));

  @override
  MalAlternativeTitlesCopyWith<$R2, MalAlternativeTitles, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MalAlternativeTitlesCopyWithImpl($value, $cast, t);
}

class MalGenreMapper extends ClassMapperBase<MalGenre> {
  MalGenreMapper._();

  static MalGenreMapper? _instance;
  static MalGenreMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalGenreMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalGenre';

  static int _$id(MalGenre v) => v.id;
  static const Field<MalGenre, int> _f$id = Field('id', _$id);
  static String _$name(MalGenre v) => v.name;
  static const Field<MalGenre, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<MalGenre> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static MalGenre _instantiate(DecodingData data) {
    return MalGenre(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static MalGenre fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalGenre>(map);
  }

  static MalGenre fromJson(String json) {
    return ensureInitialized().decodeJson<MalGenre>(json);
  }
}

mixin MalGenreMappable {
  String toJson() {
    return MalGenreMapper.ensureInitialized()
        .encodeJson<MalGenre>(this as MalGenre);
  }

  Map<String, dynamic> toMap() {
    return MalGenreMapper.ensureInitialized()
        .encodeMap<MalGenre>(this as MalGenre);
  }

  MalGenreCopyWith<MalGenre, MalGenre, MalGenre> get copyWith =>
      _MalGenreCopyWithImpl(this as MalGenre, $identity, $identity);
  @override
  String toString() {
    return MalGenreMapper.ensureInitialized().stringifyValue(this as MalGenre);
  }

  @override
  bool operator ==(Object other) {
    return MalGenreMapper.ensureInitialized()
        .equalsValue(this as MalGenre, other);
  }

  @override
  int get hashCode {
    return MalGenreMapper.ensureInitialized().hashValue(this as MalGenre);
  }
}

extension MalGenreValueCopy<$R, $Out> on ObjectCopyWith<$R, MalGenre, $Out> {
  MalGenreCopyWith<$R, MalGenre, $Out> get $asMalGenre =>
      $base.as((v, t, t2) => _MalGenreCopyWithImpl(v, t, t2));
}

abstract class MalGenreCopyWith<$R, $In extends MalGenre, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name});
  MalGenreCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MalGenreCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalGenre, $Out>
    implements MalGenreCopyWith<$R, MalGenre, $Out> {
  _MalGenreCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalGenre> $mapper =
      MalGenreMapper.ensureInitialized();
  @override
  $R call({int? id, String? name}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (name != null) #name: name}));
  @override
  MalGenre $make(CopyWithData data) => MalGenre(
      id: data.get(#id, or: $value.id), name: data.get(#name, or: $value.name));

  @override
  MalGenreCopyWith<$R2, MalGenre, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalGenreCopyWithImpl($value, $cast, t);
}

class MalAnimeRelatedMapper extends ClassMapperBase<MalAnimeRelated> {
  MalAnimeRelatedMapper._();

  static MalAnimeRelatedMapper? _instance;
  static MalAnimeRelatedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalAnimeRelatedMapper._());
      MalEntryNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalAnimeRelated';

  static String _$relationType(MalAnimeRelated v) => v.relationType;
  static const Field<MalAnimeRelated, String> _f$relationType =
      Field('relationType', _$relationType, key: r'relation_type');
  static String _$relationTypeFormatted(MalAnimeRelated v) =>
      v.relationTypeFormatted;
  static const Field<MalAnimeRelated, String> _f$relationTypeFormatted = Field(
      'relationTypeFormatted', _$relationTypeFormatted,
      key: r'relation_type_formatted');
  static MalEntryNode _$node(MalAnimeRelated v) => v.node;
  static const Field<MalAnimeRelated, MalEntryNode> _f$node =
      Field('node', _$node);

  @override
  final MappableFields<MalAnimeRelated> fields = const {
    #relationType: _f$relationType,
    #relationTypeFormatted: _f$relationTypeFormatted,
    #node: _f$node,
  };

  static MalAnimeRelated _instantiate(DecodingData data) {
    return MalAnimeRelated(
        relationType: data.dec(_f$relationType),
        relationTypeFormatted: data.dec(_f$relationTypeFormatted),
        node: data.dec(_f$node));
  }

  @override
  final Function instantiate = _instantiate;

  static MalAnimeRelated fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalAnimeRelated>(map);
  }

  static MalAnimeRelated fromJson(String json) {
    return ensureInitialized().decodeJson<MalAnimeRelated>(json);
  }
}

mixin MalAnimeRelatedMappable {
  String toJson() {
    return MalAnimeRelatedMapper.ensureInitialized()
        .encodeJson<MalAnimeRelated>(this as MalAnimeRelated);
  }

  Map<String, dynamic> toMap() {
    return MalAnimeRelatedMapper.ensureInitialized()
        .encodeMap<MalAnimeRelated>(this as MalAnimeRelated);
  }

  MalAnimeRelatedCopyWith<MalAnimeRelated, MalAnimeRelated, MalAnimeRelated>
      get copyWith => _MalAnimeRelatedCopyWithImpl(
          this as MalAnimeRelated, $identity, $identity);
  @override
  String toString() {
    return MalAnimeRelatedMapper.ensureInitialized()
        .stringifyValue(this as MalAnimeRelated);
  }

  @override
  bool operator ==(Object other) {
    return MalAnimeRelatedMapper.ensureInitialized()
        .equalsValue(this as MalAnimeRelated, other);
  }

  @override
  int get hashCode {
    return MalAnimeRelatedMapper.ensureInitialized()
        .hashValue(this as MalAnimeRelated);
  }
}

extension MalAnimeRelatedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalAnimeRelated, $Out> {
  MalAnimeRelatedCopyWith<$R, MalAnimeRelated, $Out> get $asMalAnimeRelated =>
      $base.as((v, t, t2) => _MalAnimeRelatedCopyWithImpl(v, t, t2));
}

abstract class MalAnimeRelatedCopyWith<$R, $In extends MalAnimeRelated, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MalEntryNodeCopyWith<$R, MalEntryNode, MalEntryNode> get node;
  $R call(
      {String? relationType,
      String? relationTypeFormatted,
      MalEntryNode? node});
  MalAnimeRelatedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalAnimeRelatedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalAnimeRelated, $Out>
    implements MalAnimeRelatedCopyWith<$R, MalAnimeRelated, $Out> {
  _MalAnimeRelatedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalAnimeRelated> $mapper =
      MalAnimeRelatedMapper.ensureInitialized();
  @override
  MalEntryNodeCopyWith<$R, MalEntryNode, MalEntryNode> get node =>
      $value.node.copyWith.$chain((v) => call(node: v));
  @override
  $R call(
          {String? relationType,
          String? relationTypeFormatted,
          MalEntryNode? node}) =>
      $apply(FieldCopyWithData({
        if (relationType != null) #relationType: relationType,
        if (relationTypeFormatted != null)
          #relationTypeFormatted: relationTypeFormatted,
        if (node != null) #node: node
      }));
  @override
  MalAnimeRelated $make(CopyWithData data) => MalAnimeRelated(
      relationType: data.get(#relationType, or: $value.relationType),
      relationTypeFormatted:
          data.get(#relationTypeFormatted, or: $value.relationTypeFormatted),
      node: data.get(#node, or: $value.node));

  @override
  MalAnimeRelatedCopyWith<$R2, MalAnimeRelated, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalAnimeRelatedCopyWithImpl($value, $cast, t);
}

class MalMangaDetailsRelatedMapper
    extends ClassMapperBase<MalMangaDetailsRelated> {
  MalMangaDetailsRelatedMapper._();

  static MalMangaDetailsRelatedMapper? _instance;
  static MalMangaDetailsRelatedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalMangaDetailsRelatedMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalMangaDetailsRelated';

  static String _$relationType(MalMangaDetailsRelated v) => v.relationType;
  static const Field<MalMangaDetailsRelated, String> _f$relationType =
      Field('relationType', _$relationType, key: r'relation_type');
  static String _$relationTypeFormatted(MalMangaDetailsRelated v) =>
      v.relationTypeFormatted;
  static const Field<MalMangaDetailsRelated, String> _f$relationTypeFormatted =
      Field('relationTypeFormatted', _$relationTypeFormatted,
          key: r'relation_type_formatted');

  @override
  final MappableFields<MalMangaDetailsRelated> fields = const {
    #relationType: _f$relationType,
    #relationTypeFormatted: _f$relationTypeFormatted,
  };

  static MalMangaDetailsRelated _instantiate(DecodingData data) {
    return MalMangaDetailsRelated(
        relationType: data.dec(_f$relationType),
        relationTypeFormatted: data.dec(_f$relationTypeFormatted));
  }

  @override
  final Function instantiate = _instantiate;

  static MalMangaDetailsRelated fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalMangaDetailsRelated>(map);
  }

  static MalMangaDetailsRelated fromJson(String json) {
    return ensureInitialized().decodeJson<MalMangaDetailsRelated>(json);
  }
}

mixin MalMangaDetailsRelatedMappable {
  String toJson() {
    return MalMangaDetailsRelatedMapper.ensureInitialized()
        .encodeJson<MalMangaDetailsRelated>(this as MalMangaDetailsRelated);
  }

  Map<String, dynamic> toMap() {
    return MalMangaDetailsRelatedMapper.ensureInitialized()
        .encodeMap<MalMangaDetailsRelated>(this as MalMangaDetailsRelated);
  }

  MalMangaDetailsRelatedCopyWith<MalMangaDetailsRelated, MalMangaDetailsRelated,
          MalMangaDetailsRelated>
      get copyWith => _MalMangaDetailsRelatedCopyWithImpl(
          this as MalMangaDetailsRelated, $identity, $identity);
  @override
  String toString() {
    return MalMangaDetailsRelatedMapper.ensureInitialized()
        .stringifyValue(this as MalMangaDetailsRelated);
  }

  @override
  bool operator ==(Object other) {
    return MalMangaDetailsRelatedMapper.ensureInitialized()
        .equalsValue(this as MalMangaDetailsRelated, other);
  }

  @override
  int get hashCode {
    return MalMangaDetailsRelatedMapper.ensureInitialized()
        .hashValue(this as MalMangaDetailsRelated);
  }
}

extension MalMangaDetailsRelatedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalMangaDetailsRelated, $Out> {
  MalMangaDetailsRelatedCopyWith<$R, MalMangaDetailsRelated, $Out>
      get $asMalMangaDetailsRelated =>
          $base.as((v, t, t2) => _MalMangaDetailsRelatedCopyWithImpl(v, t, t2));
}

abstract class MalMangaDetailsRelatedCopyWith<
    $R,
    $In extends MalMangaDetailsRelated,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? relationType, String? relationTypeFormatted});
  MalMangaDetailsRelatedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalMangaDetailsRelatedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalMangaDetailsRelated, $Out>
    implements
        MalMangaDetailsRelatedCopyWith<$R, MalMangaDetailsRelated, $Out> {
  _MalMangaDetailsRelatedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalMangaDetailsRelated> $mapper =
      MalMangaDetailsRelatedMapper.ensureInitialized();
  @override
  $R call({String? relationType, String? relationTypeFormatted}) =>
      $apply(FieldCopyWithData({
        if (relationType != null) #relationType: relationType,
        if (relationTypeFormatted != null)
          #relationTypeFormatted: relationTypeFormatted
      }));
  @override
  MalMangaDetailsRelated $make(CopyWithData data) => MalMangaDetailsRelated(
      relationType: data.get(#relationType, or: $value.relationType),
      relationTypeFormatted:
          data.get(#relationTypeFormatted, or: $value.relationTypeFormatted));

  @override
  MalMangaDetailsRelatedCopyWith<$R2, MalMangaDetailsRelated, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MalMangaDetailsRelatedCopyWithImpl($value, $cast, t);
}

class MalAnimeRecommendationMapper
    extends ClassMapperBase<MalAnimeRecommendation> {
  MalAnimeRecommendationMapper._();

  static MalAnimeRecommendationMapper? _instance;
  static MalAnimeRecommendationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalAnimeRecommendationMapper._());
      MalEntryNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalAnimeRecommendation';

  static MalEntryNode _$node(MalAnimeRecommendation v) => v.node;
  static const Field<MalAnimeRecommendation, MalEntryNode> _f$node =
      Field('node', _$node);
  static int _$numRecommendations(MalAnimeRecommendation v) =>
      v.numRecommendations;
  static const Field<MalAnimeRecommendation, int> _f$numRecommendations = Field(
      'numRecommendations', _$numRecommendations,
      key: r'num_recommendations');

  @override
  final MappableFields<MalAnimeRecommendation> fields = const {
    #node: _f$node,
    #numRecommendations: _f$numRecommendations,
  };

  static MalAnimeRecommendation _instantiate(DecodingData data) {
    return MalAnimeRecommendation(
        node: data.dec(_f$node),
        numRecommendations: data.dec(_f$numRecommendations));
  }

  @override
  final Function instantiate = _instantiate;

  static MalAnimeRecommendation fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalAnimeRecommendation>(map);
  }

  static MalAnimeRecommendation fromJson(String json) {
    return ensureInitialized().decodeJson<MalAnimeRecommendation>(json);
  }
}

mixin MalAnimeRecommendationMappable {
  String toJson() {
    return MalAnimeRecommendationMapper.ensureInitialized()
        .encodeJson<MalAnimeRecommendation>(this as MalAnimeRecommendation);
  }

  Map<String, dynamic> toMap() {
    return MalAnimeRecommendationMapper.ensureInitialized()
        .encodeMap<MalAnimeRecommendation>(this as MalAnimeRecommendation);
  }

  MalAnimeRecommendationCopyWith<MalAnimeRecommendation, MalAnimeRecommendation,
          MalAnimeRecommendation>
      get copyWith => _MalAnimeRecommendationCopyWithImpl(
          this as MalAnimeRecommendation, $identity, $identity);
  @override
  String toString() {
    return MalAnimeRecommendationMapper.ensureInitialized()
        .stringifyValue(this as MalAnimeRecommendation);
  }

  @override
  bool operator ==(Object other) {
    return MalAnimeRecommendationMapper.ensureInitialized()
        .equalsValue(this as MalAnimeRecommendation, other);
  }

  @override
  int get hashCode {
    return MalAnimeRecommendationMapper.ensureInitialized()
        .hashValue(this as MalAnimeRecommendation);
  }
}

extension MalAnimeRecommendationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalAnimeRecommendation, $Out> {
  MalAnimeRecommendationCopyWith<$R, MalAnimeRecommendation, $Out>
      get $asMalAnimeRecommendation =>
          $base.as((v, t, t2) => _MalAnimeRecommendationCopyWithImpl(v, t, t2));
}

abstract class MalAnimeRecommendationCopyWith<
    $R,
    $In extends MalAnimeRecommendation,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MalEntryNodeCopyWith<$R, MalEntryNode, MalEntryNode> get node;
  $R call({MalEntryNode? node, int? numRecommendations});
  MalAnimeRecommendationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalAnimeRecommendationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalAnimeRecommendation, $Out>
    implements
        MalAnimeRecommendationCopyWith<$R, MalAnimeRecommendation, $Out> {
  _MalAnimeRecommendationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalAnimeRecommendation> $mapper =
      MalAnimeRecommendationMapper.ensureInitialized();
  @override
  MalEntryNodeCopyWith<$R, MalEntryNode, MalEntryNode> get node =>
      $value.node.copyWith.$chain((v) => call(node: v));
  @override
  $R call({MalEntryNode? node, int? numRecommendations}) =>
      $apply(FieldCopyWithData({
        if (node != null) #node: node,
        if (numRecommendations != null) #numRecommendations: numRecommendations
      }));
  @override
  MalAnimeRecommendation $make(CopyWithData data) => MalAnimeRecommendation(
      node: data.get(#node, or: $value.node),
      numRecommendations:
          data.get(#numRecommendations, or: $value.numRecommendations));

  @override
  MalAnimeRecommendationCopyWith<$R2, MalAnimeRecommendation, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MalAnimeRecommendationCopyWithImpl($value, $cast, t);
}

class MalStudioMapper extends ClassMapperBase<MalStudio> {
  MalStudioMapper._();

  static MalStudioMapper? _instance;
  static MalStudioMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalStudioMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalStudio';

  static int _$id(MalStudio v) => v.id;
  static const Field<MalStudio, int> _f$id = Field('id', _$id);
  static String _$name(MalStudio v) => v.name;
  static const Field<MalStudio, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<MalStudio> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static MalStudio _instantiate(DecodingData data) {
    return MalStudio(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static MalStudio fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalStudio>(map);
  }

  static MalStudio fromJson(String json) {
    return ensureInitialized().decodeJson<MalStudio>(json);
  }
}

mixin MalStudioMappable {
  String toJson() {
    return MalStudioMapper.ensureInitialized()
        .encodeJson<MalStudio>(this as MalStudio);
  }

  Map<String, dynamic> toMap() {
    return MalStudioMapper.ensureInitialized()
        .encodeMap<MalStudio>(this as MalStudio);
  }

  MalStudioCopyWith<MalStudio, MalStudio, MalStudio> get copyWith =>
      _MalStudioCopyWithImpl(this as MalStudio, $identity, $identity);
  @override
  String toString() {
    return MalStudioMapper.ensureInitialized()
        .stringifyValue(this as MalStudio);
  }

  @override
  bool operator ==(Object other) {
    return MalStudioMapper.ensureInitialized()
        .equalsValue(this as MalStudio, other);
  }

  @override
  int get hashCode {
    return MalStudioMapper.ensureInitialized().hashValue(this as MalStudio);
  }
}

extension MalStudioValueCopy<$R, $Out> on ObjectCopyWith<$R, MalStudio, $Out> {
  MalStudioCopyWith<$R, MalStudio, $Out> get $asMalStudio =>
      $base.as((v, t, t2) => _MalStudioCopyWithImpl(v, t, t2));
}

abstract class MalStudioCopyWith<$R, $In extends MalStudio, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name});
  MalStudioCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MalStudioCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalStudio, $Out>
    implements MalStudioCopyWith<$R, MalStudio, $Out> {
  _MalStudioCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalStudio> $mapper =
      MalStudioMapper.ensureInitialized();
  @override
  $R call({int? id, String? name}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (name != null) #name: name}));
  @override
  MalStudio $make(CopyWithData data) => MalStudio(
      id: data.get(#id, or: $value.id), name: data.get(#name, or: $value.name));

  @override
  MalStudioCopyWith<$R2, MalStudio, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalStudioCopyWithImpl($value, $cast, t);
}

class MalAnimeStatisticsMapper extends ClassMapperBase<MalAnimeStatistics> {
  MalAnimeStatisticsMapper._();

  static MalAnimeStatisticsMapper? _instance;
  static MalAnimeStatisticsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalAnimeStatisticsMapper._());
      MalAnimeStatisticsStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalAnimeStatistics';

  static MalAnimeStatisticsStatus _$status(MalAnimeStatistics v) => v.status;
  static const Field<MalAnimeStatistics, MalAnimeStatisticsStatus> _f$status =
      Field('status', _$status);
  static int _$numListUsers(MalAnimeStatistics v) => v.numListUsers;
  static const Field<MalAnimeStatistics, int> _f$numListUsers =
      Field('numListUsers', _$numListUsers, key: r'num_list_users');

  @override
  final MappableFields<MalAnimeStatistics> fields = const {
    #status: _f$status,
    #numListUsers: _f$numListUsers,
  };

  static MalAnimeStatistics _instantiate(DecodingData data) {
    return MalAnimeStatistics(
        status: data.dec(_f$status), numListUsers: data.dec(_f$numListUsers));
  }

  @override
  final Function instantiate = _instantiate;

  static MalAnimeStatistics fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalAnimeStatistics>(map);
  }

  static MalAnimeStatistics fromJson(String json) {
    return ensureInitialized().decodeJson<MalAnimeStatistics>(json);
  }
}

mixin MalAnimeStatisticsMappable {
  String toJson() {
    return MalAnimeStatisticsMapper.ensureInitialized()
        .encodeJson<MalAnimeStatistics>(this as MalAnimeStatistics);
  }

  Map<String, dynamic> toMap() {
    return MalAnimeStatisticsMapper.ensureInitialized()
        .encodeMap<MalAnimeStatistics>(this as MalAnimeStatistics);
  }

  MalAnimeStatisticsCopyWith<MalAnimeStatistics, MalAnimeStatistics,
          MalAnimeStatistics>
      get copyWith => _MalAnimeStatisticsCopyWithImpl(
          this as MalAnimeStatistics, $identity, $identity);
  @override
  String toString() {
    return MalAnimeStatisticsMapper.ensureInitialized()
        .stringifyValue(this as MalAnimeStatistics);
  }

  @override
  bool operator ==(Object other) {
    return MalAnimeStatisticsMapper.ensureInitialized()
        .equalsValue(this as MalAnimeStatistics, other);
  }

  @override
  int get hashCode {
    return MalAnimeStatisticsMapper.ensureInitialized()
        .hashValue(this as MalAnimeStatistics);
  }
}

extension MalAnimeStatisticsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalAnimeStatistics, $Out> {
  MalAnimeStatisticsCopyWith<$R, MalAnimeStatistics, $Out>
      get $asMalAnimeStatistics =>
          $base.as((v, t, t2) => _MalAnimeStatisticsCopyWithImpl(v, t, t2));
}

abstract class MalAnimeStatisticsCopyWith<$R, $In extends MalAnimeStatistics,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MalAnimeStatisticsStatusCopyWith<$R, MalAnimeStatisticsStatus,
      MalAnimeStatisticsStatus> get status;
  $R call({MalAnimeStatisticsStatus? status, int? numListUsers});
  MalAnimeStatisticsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalAnimeStatisticsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalAnimeStatistics, $Out>
    implements MalAnimeStatisticsCopyWith<$R, MalAnimeStatistics, $Out> {
  _MalAnimeStatisticsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalAnimeStatistics> $mapper =
      MalAnimeStatisticsMapper.ensureInitialized();
  @override
  MalAnimeStatisticsStatusCopyWith<$R, MalAnimeStatisticsStatus,
          MalAnimeStatisticsStatus>
      get status => $value.status.copyWith.$chain((v) => call(status: v));
  @override
  $R call({MalAnimeStatisticsStatus? status, int? numListUsers}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (numListUsers != null) #numListUsers: numListUsers
      }));
  @override
  MalAnimeStatistics $make(CopyWithData data) => MalAnimeStatistics(
      status: data.get(#status, or: $value.status),
      numListUsers: data.get(#numListUsers, or: $value.numListUsers));

  @override
  MalAnimeStatisticsCopyWith<$R2, MalAnimeStatistics, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalAnimeStatisticsCopyWithImpl($value, $cast, t);
}

class MalAnimeStatisticsStatusMapper
    extends ClassMapperBase<MalAnimeStatisticsStatus> {
  MalAnimeStatisticsStatusMapper._();

  static MalAnimeStatisticsStatusMapper? _instance;
  static MalAnimeStatisticsStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = MalAnimeStatisticsStatusMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalAnimeStatisticsStatus';

  static int _$watching(MalAnimeStatisticsStatus v) => v.watching;
  static const Field<MalAnimeStatisticsStatus, int> _f$watching =
      Field('watching', _$watching);
  static int _$completed(MalAnimeStatisticsStatus v) => v.completed;
  static const Field<MalAnimeStatisticsStatus, int> _f$completed =
      Field('completed', _$completed);
  static int _$onHold(MalAnimeStatisticsStatus v) => v.onHold;
  static const Field<MalAnimeStatisticsStatus, int> _f$onHold =
      Field('onHold', _$onHold, key: r'on_hold');
  static int _$dropped(MalAnimeStatisticsStatus v) => v.dropped;
  static const Field<MalAnimeStatisticsStatus, int> _f$dropped =
      Field('dropped', _$dropped);
  static int _$planToWatch(MalAnimeStatisticsStatus v) => v.planToWatch;
  static const Field<MalAnimeStatisticsStatus, int> _f$planToWatch =
      Field('planToWatch', _$planToWatch, key: r'plan_to_watch');

  @override
  final MappableFields<MalAnimeStatisticsStatus> fields = const {
    #watching: _f$watching,
    #completed: _f$completed,
    #onHold: _f$onHold,
    #dropped: _f$dropped,
    #planToWatch: _f$planToWatch,
  };

  static MalAnimeStatisticsStatus _instantiate(DecodingData data) {
    return MalAnimeStatisticsStatus(
        watching: data.dec(_f$watching),
        completed: data.dec(_f$completed),
        onHold: data.dec(_f$onHold),
        dropped: data.dec(_f$dropped),
        planToWatch: data.dec(_f$planToWatch));
  }

  @override
  final Function instantiate = _instantiate;

  static MalAnimeStatisticsStatus fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalAnimeStatisticsStatus>(map);
  }

  static MalAnimeStatisticsStatus fromJson(String json) {
    return ensureInitialized().decodeJson<MalAnimeStatisticsStatus>(json);
  }
}

mixin MalAnimeStatisticsStatusMappable {
  String toJson() {
    return MalAnimeStatisticsStatusMapper.ensureInitialized()
        .encodeJson<MalAnimeStatisticsStatus>(this as MalAnimeStatisticsStatus);
  }

  Map<String, dynamic> toMap() {
    return MalAnimeStatisticsStatusMapper.ensureInitialized()
        .encodeMap<MalAnimeStatisticsStatus>(this as MalAnimeStatisticsStatus);
  }

  MalAnimeStatisticsStatusCopyWith<MalAnimeStatisticsStatus,
          MalAnimeStatisticsStatus, MalAnimeStatisticsStatus>
      get copyWith => _MalAnimeStatisticsStatusCopyWithImpl(
          this as MalAnimeStatisticsStatus, $identity, $identity);
  @override
  String toString() {
    return MalAnimeStatisticsStatusMapper.ensureInitialized()
        .stringifyValue(this as MalAnimeStatisticsStatus);
  }

  @override
  bool operator ==(Object other) {
    return MalAnimeStatisticsStatusMapper.ensureInitialized()
        .equalsValue(this as MalAnimeStatisticsStatus, other);
  }

  @override
  int get hashCode {
    return MalAnimeStatisticsStatusMapper.ensureInitialized()
        .hashValue(this as MalAnimeStatisticsStatus);
  }
}

extension MalAnimeStatisticsStatusValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalAnimeStatisticsStatus, $Out> {
  MalAnimeStatisticsStatusCopyWith<$R, MalAnimeStatisticsStatus, $Out>
      get $asMalAnimeStatisticsStatus => $base
          .as((v, t, t2) => _MalAnimeStatisticsStatusCopyWithImpl(v, t, t2));
}

abstract class MalAnimeStatisticsStatusCopyWith<
    $R,
    $In extends MalAnimeStatisticsStatus,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? watching,
      int? completed,
      int? onHold,
      int? dropped,
      int? planToWatch});
  MalAnimeStatisticsStatusCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalAnimeStatisticsStatusCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalAnimeStatisticsStatus, $Out>
    implements
        MalAnimeStatisticsStatusCopyWith<$R, MalAnimeStatisticsStatus, $Out> {
  _MalAnimeStatisticsStatusCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalAnimeStatisticsStatus> $mapper =
      MalAnimeStatisticsStatusMapper.ensureInitialized();
  @override
  $R call(
          {int? watching,
          int? completed,
          int? onHold,
          int? dropped,
          int? planToWatch}) =>
      $apply(FieldCopyWithData({
        if (watching != null) #watching: watching,
        if (completed != null) #completed: completed,
        if (onHold != null) #onHold: onHold,
        if (dropped != null) #dropped: dropped,
        if (planToWatch != null) #planToWatch: planToWatch
      }));
  @override
  MalAnimeStatisticsStatus $make(CopyWithData data) => MalAnimeStatisticsStatus(
      watching: data.get(#watching, or: $value.watching),
      completed: data.get(#completed, or: $value.completed),
      onHold: data.get(#onHold, or: $value.onHold),
      dropped: data.get(#dropped, or: $value.dropped),
      planToWatch: data.get(#planToWatch, or: $value.planToWatch));

  @override
  MalAnimeStatisticsStatusCopyWith<$R2, MalAnimeStatisticsStatus, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MalAnimeStatisticsStatusCopyWithImpl($value, $cast, t);
}

class MalAnimeDetailsMapper extends ClassMapperBase<MalAnimeDetails> {
  MalAnimeDetailsMapper._();

  static MalAnimeDetailsMapper? _instance;
  static MalAnimeDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalAnimeDetailsMapper._());
      MalEntryDetailsMapper.ensureInitialized();
      MalPictureMapper.ensureInitialized();
      MalAlternativeTitlesMapper.ensureInitialized();
      MalGenreMapper.ensureInitialized();
      MalListStatusMapper.ensureInitialized();
      MalAnimeRelatedMapper.ensureInitialized();
      MalMangaDetailsRelatedMapper.ensureInitialized();
      MalAnimeRecommendationMapper.ensureInitialized();
      MalStudioMapper.ensureInitialized();
      MalAnimeStatisticsMapper.ensureInitialized();
      MalAnimeSeasonMapper.ensureInitialized();
      MalAnimeBroadcastMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalAnimeDetails';

  static int _$id(MalAnimeDetails v) => v.id;
  static const Field<MalAnimeDetails, int> _f$id = Field('id', _$id);
  static String _$title(MalAnimeDetails v) => v.title;
  static const Field<MalAnimeDetails, String> _f$title =
      Field('title', _$title);
  static MalPicture _$mainPicture(MalAnimeDetails v) => v.mainPicture;
  static const Field<MalAnimeDetails, MalPicture> _f$mainPicture =
      Field('mainPicture', _$mainPicture, key: r'main_picture');
  static MalAlternativeTitles _$alternativeTitles(MalAnimeDetails v) =>
      v.alternativeTitles;
  static const Field<MalAnimeDetails, MalAlternativeTitles>
      _f$alternativeTitles = Field('alternativeTitles', _$alternativeTitles,
          key: r'alternative_titles');
  static DateTime _$startDate(MalAnimeDetails v) => v.startDate;
  static const Field<MalAnimeDetails, DateTime> _f$startDate =
      Field('startDate', _$startDate, key: r'start_date');
  static DateTime _$endDate(MalAnimeDetails v) => v.endDate;
  static const Field<MalAnimeDetails, DateTime> _f$endDate =
      Field('endDate', _$endDate, key: r'end_date');
  static String _$synopsis(MalAnimeDetails v) => v.synopsis;
  static const Field<MalAnimeDetails, String> _f$synopsis =
      Field('synopsis', _$synopsis);
  static double _$mean(MalAnimeDetails v) => v.mean;
  static const Field<MalAnimeDetails, double> _f$mean = Field('mean', _$mean);
  static int _$rank(MalAnimeDetails v) => v.rank;
  static const Field<MalAnimeDetails, int> _f$rank = Field('rank', _$rank);
  static int _$popularity(MalAnimeDetails v) => v.popularity;
  static const Field<MalAnimeDetails, int> _f$popularity =
      Field('popularity', _$popularity);
  static int _$numListUsers(MalAnimeDetails v) => v.numListUsers;
  static const Field<MalAnimeDetails, int> _f$numListUsers =
      Field('numListUsers', _$numListUsers, key: r'num_list_users');
  static int _$numScoringUsers(MalAnimeDetails v) => v.numScoringUsers;
  static const Field<MalAnimeDetails, int> _f$numScoringUsers =
      Field('numScoringUsers', _$numScoringUsers, key: r'num_scoring_users');
  static String _$nsfw(MalAnimeDetails v) => v.nsfw;
  static const Field<MalAnimeDetails, String> _f$nsfw = Field('nsfw', _$nsfw);
  static DateTime _$createdAt(MalAnimeDetails v) => v.createdAt;
  static const Field<MalAnimeDetails, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static DateTime _$updatedAt(MalAnimeDetails v) => v.updatedAt;
  static const Field<MalAnimeDetails, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: r'updated_at');
  static String _$mediaType(MalAnimeDetails v) => v.mediaType;
  static const Field<MalAnimeDetails, String> _f$mediaType =
      Field('mediaType', _$mediaType, key: r'media_type');
  static String _$status(MalAnimeDetails v) => v.status;
  static const Field<MalAnimeDetails, String> _f$status =
      Field('status', _$status);
  static List<MalGenre> _$genres(MalAnimeDetails v) => v.genres;
  static const Field<MalAnimeDetails, List<MalGenre>> _f$genres =
      Field('genres', _$genres);
  static MalListStatus _$myListStatus(MalAnimeDetails v) => v.myListStatus;
  static const Field<MalAnimeDetails, MalListStatus> _f$myListStatus =
      Field('myListStatus', _$myListStatus, key: r'my_list_status');
  static List<MalPicture> _$pictures(MalAnimeDetails v) => v.pictures;
  static const Field<MalAnimeDetails, List<MalPicture>> _f$pictures =
      Field('pictures', _$pictures);
  static String _$background(MalAnimeDetails v) => v.background;
  static const Field<MalAnimeDetails, String> _f$background =
      Field('background', _$background);
  static List<MalAnimeRelated> _$relatedAnime(MalAnimeDetails v) =>
      v.relatedAnime;
  static const Field<MalAnimeDetails, List<MalAnimeRelated>> _f$relatedAnime =
      Field('relatedAnime', _$relatedAnime, key: r'related_anime');
  static List<MalMangaDetailsRelated> _$relatedManga(MalAnimeDetails v) =>
      v.relatedManga;
  static const Field<MalAnimeDetails, List<MalMangaDetailsRelated>>
      _f$relatedManga =
      Field('relatedManga', _$relatedManga, key: r'related_manga');
  static List<MalAnimeRecommendation> _$recommendations(MalAnimeDetails v) =>
      v.recommendations;
  static const Field<MalAnimeDetails, List<MalAnimeRecommendation>>
      _f$recommendations = Field('recommendations', _$recommendations);
  static List<MalStudio> _$studios(MalAnimeDetails v) => v.studios;
  static const Field<MalAnimeDetails, List<MalStudio>> _f$studios =
      Field('studios', _$studios);
  static MalAnimeStatistics _$statistics(MalAnimeDetails v) => v.statistics;
  static const Field<MalAnimeDetails, MalAnimeStatistics> _f$statistics =
      Field('statistics', _$statistics);
  static int _$numEpisodes(MalAnimeDetails v) => v.numEpisodes;
  static const Field<MalAnimeDetails, int> _f$numEpisodes =
      Field('numEpisodes', _$numEpisodes, key: r'num_episodes');
  static MalAnimeSeason _$startSeason(MalAnimeDetails v) => v.startSeason;
  static const Field<MalAnimeDetails, MalAnimeSeason> _f$startSeason =
      Field('startSeason', _$startSeason, key: r'start_season');
  static MalAnimeBroadcast _$broadcast(MalAnimeDetails v) => v.broadcast;
  static const Field<MalAnimeDetails, MalAnimeBroadcast> _f$broadcast =
      Field('broadcast', _$broadcast);
  static String _$source(MalAnimeDetails v) => v.source;
  static const Field<MalAnimeDetails, String> _f$source =
      Field('source', _$source);
  static int _$averageEpisodeDuration(MalAnimeDetails v) =>
      v.averageEpisodeDuration;
  static const Field<MalAnimeDetails, int> _f$averageEpisodeDuration = Field(
      'averageEpisodeDuration', _$averageEpisodeDuration,
      key: r'average_episode_duration');
  static String _$rating(MalAnimeDetails v) => v.rating;
  static const Field<MalAnimeDetails, String> _f$rating =
      Field('rating', _$rating);

  @override
  final MappableFields<MalAnimeDetails> fields = const {
    #id: _f$id,
    #title: _f$title,
    #mainPicture: _f$mainPicture,
    #alternativeTitles: _f$alternativeTitles,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #synopsis: _f$synopsis,
    #mean: _f$mean,
    #rank: _f$rank,
    #popularity: _f$popularity,
    #numListUsers: _f$numListUsers,
    #numScoringUsers: _f$numScoringUsers,
    #nsfw: _f$nsfw,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #mediaType: _f$mediaType,
    #status: _f$status,
    #genres: _f$genres,
    #myListStatus: _f$myListStatus,
    #pictures: _f$pictures,
    #background: _f$background,
    #relatedAnime: _f$relatedAnime,
    #relatedManga: _f$relatedManga,
    #recommendations: _f$recommendations,
    #studios: _f$studios,
    #statistics: _f$statistics,
    #numEpisodes: _f$numEpisodes,
    #startSeason: _f$startSeason,
    #broadcast: _f$broadcast,
    #source: _f$source,
    #averageEpisodeDuration: _f$averageEpisodeDuration,
    #rating: _f$rating,
  };

  static MalAnimeDetails _instantiate(DecodingData data) {
    return MalAnimeDetails(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        mainPicture: data.dec(_f$mainPicture),
        alternativeTitles: data.dec(_f$alternativeTitles),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        synopsis: data.dec(_f$synopsis),
        mean: data.dec(_f$mean),
        rank: data.dec(_f$rank),
        popularity: data.dec(_f$popularity),
        numListUsers: data.dec(_f$numListUsers),
        numScoringUsers: data.dec(_f$numScoringUsers),
        nsfw: data.dec(_f$nsfw),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        mediaType: data.dec(_f$mediaType),
        status: data.dec(_f$status),
        genres: data.dec(_f$genres),
        myListStatus: data.dec(_f$myListStatus),
        pictures: data.dec(_f$pictures),
        background: data.dec(_f$background),
        relatedAnime: data.dec(_f$relatedAnime),
        relatedManga: data.dec(_f$relatedManga),
        recommendations: data.dec(_f$recommendations),
        studios: data.dec(_f$studios),
        statistics: data.dec(_f$statistics),
        numEpisodes: data.dec(_f$numEpisodes),
        startSeason: data.dec(_f$startSeason),
        broadcast: data.dec(_f$broadcast),
        source: data.dec(_f$source),
        averageEpisodeDuration: data.dec(_f$averageEpisodeDuration),
        rating: data.dec(_f$rating));
  }

  @override
  final Function instantiate = _instantiate;

  static MalAnimeDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalAnimeDetails>(map);
  }

  static MalAnimeDetails fromJson(String json) {
    return ensureInitialized().decodeJson<MalAnimeDetails>(json);
  }
}

mixin MalAnimeDetailsMappable {
  String toJson() {
    return MalAnimeDetailsMapper.ensureInitialized()
        .encodeJson<MalAnimeDetails>(this as MalAnimeDetails);
  }

  Map<String, dynamic> toMap() {
    return MalAnimeDetailsMapper.ensureInitialized()
        .encodeMap<MalAnimeDetails>(this as MalAnimeDetails);
  }

  MalAnimeDetailsCopyWith<MalAnimeDetails, MalAnimeDetails, MalAnimeDetails>
      get copyWith => _MalAnimeDetailsCopyWithImpl(
          this as MalAnimeDetails, $identity, $identity);
  @override
  String toString() {
    return MalAnimeDetailsMapper.ensureInitialized()
        .stringifyValue(this as MalAnimeDetails);
  }

  @override
  bool operator ==(Object other) {
    return MalAnimeDetailsMapper.ensureInitialized()
        .equalsValue(this as MalAnimeDetails, other);
  }

  @override
  int get hashCode {
    return MalAnimeDetailsMapper.ensureInitialized()
        .hashValue(this as MalAnimeDetails);
  }
}

extension MalAnimeDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalAnimeDetails, $Out> {
  MalAnimeDetailsCopyWith<$R, MalAnimeDetails, $Out> get $asMalAnimeDetails =>
      $base.as((v, t, t2) => _MalAnimeDetailsCopyWithImpl(v, t, t2));
}

abstract class MalAnimeDetailsCopyWith<$R, $In extends MalAnimeDetails, $Out>
    implements MalEntryDetailsCopyWith<$R, $In, $Out> {
  @override
  MalPictureCopyWith<$R, MalPicture, MalPicture> get mainPicture;
  @override
  MalAlternativeTitlesCopyWith<$R, MalAlternativeTitles, MalAlternativeTitles>
      get alternativeTitles;
  @override
  ListCopyWith<$R, MalGenre, MalGenreCopyWith<$R, MalGenre, MalGenre>>
      get genres;
  @override
  MalListStatusCopyWith<$R, MalListStatus, MalListStatus> get myListStatus;
  @override
  ListCopyWith<$R, MalPicture, MalPictureCopyWith<$R, MalPicture, MalPicture>>
      get pictures;
  @override
  ListCopyWith<$R, MalAnimeRelated,
          MalAnimeRelatedCopyWith<$R, MalAnimeRelated, MalAnimeRelated>>
      get relatedAnime;
  @override
  ListCopyWith<
      $R,
      MalMangaDetailsRelated,
      MalMangaDetailsRelatedCopyWith<$R, MalMangaDetailsRelated,
          MalMangaDetailsRelated>> get relatedManga;
  @override
  ListCopyWith<
      $R,
      MalAnimeRecommendation,
      MalAnimeRecommendationCopyWith<$R, MalAnimeRecommendation,
          MalAnimeRecommendation>> get recommendations;
  @override
  ListCopyWith<$R, MalStudio, MalStudioCopyWith<$R, MalStudio, MalStudio>>
      get studios;
  @override
  MalAnimeStatisticsCopyWith<$R, MalAnimeStatistics, MalAnimeStatistics>
      get statistics;
  MalAnimeSeasonCopyWith<$R, MalAnimeSeason, MalAnimeSeason> get startSeason;
  MalAnimeBroadcastCopyWith<$R, MalAnimeBroadcast, MalAnimeBroadcast>
      get broadcast;
  @override
  $R call(
      {int? id,
      String? title,
      MalPicture? mainPicture,
      MalAlternativeTitles? alternativeTitles,
      DateTime? startDate,
      DateTime? endDate,
      String? synopsis,
      double? mean,
      int? rank,
      int? popularity,
      int? numListUsers,
      int? numScoringUsers,
      String? nsfw,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? mediaType,
      String? status,
      List<MalGenre>? genres,
      MalListStatus? myListStatus,
      List<MalPicture>? pictures,
      String? background,
      List<MalAnimeRelated>? relatedAnime,
      List<MalMangaDetailsRelated>? relatedManga,
      List<MalAnimeRecommendation>? recommendations,
      List<MalStudio>? studios,
      MalAnimeStatistics? statistics,
      int? numEpisodes,
      MalAnimeSeason? startSeason,
      MalAnimeBroadcast? broadcast,
      String? source,
      int? averageEpisodeDuration,
      String? rating});
  MalAnimeDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalAnimeDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalAnimeDetails, $Out>
    implements MalAnimeDetailsCopyWith<$R, MalAnimeDetails, $Out> {
  _MalAnimeDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalAnimeDetails> $mapper =
      MalAnimeDetailsMapper.ensureInitialized();
  @override
  MalPictureCopyWith<$R, MalPicture, MalPicture> get mainPicture =>
      $value.mainPicture.copyWith.$chain((v) => call(mainPicture: v));
  @override
  MalAlternativeTitlesCopyWith<$R, MalAlternativeTitles, MalAlternativeTitles>
      get alternativeTitles => $value.alternativeTitles.copyWith
          .$chain((v) => call(alternativeTitles: v));
  @override
  ListCopyWith<$R, MalGenre, MalGenreCopyWith<$R, MalGenre, MalGenre>>
      get genres => ListCopyWith($value.genres, (v, t) => v.copyWith.$chain(t),
          (v) => call(genres: v));
  @override
  MalListStatusCopyWith<$R, MalListStatus, MalListStatus> get myListStatus =>
      $value.myListStatus.copyWith.$chain((v) => call(myListStatus: v));
  @override
  ListCopyWith<$R, MalPicture, MalPictureCopyWith<$R, MalPicture, MalPicture>>
      get pictures => ListCopyWith($value.pictures,
          (v, t) => v.copyWith.$chain(t), (v) => call(pictures: v));
  @override
  ListCopyWith<$R, MalAnimeRelated,
          MalAnimeRelatedCopyWith<$R, MalAnimeRelated, MalAnimeRelated>>
      get relatedAnime => ListCopyWith($value.relatedAnime,
          (v, t) => v.copyWith.$chain(t), (v) => call(relatedAnime: v));
  @override
  ListCopyWith<
      $R,
      MalMangaDetailsRelated,
      MalMangaDetailsRelatedCopyWith<$R, MalMangaDetailsRelated,
          MalMangaDetailsRelated>> get relatedManga => ListCopyWith(
      $value.relatedManga,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(relatedManga: v));
  @override
  ListCopyWith<
      $R,
      MalAnimeRecommendation,
      MalAnimeRecommendationCopyWith<$R, MalAnimeRecommendation,
          MalAnimeRecommendation>> get recommendations => ListCopyWith(
      $value.recommendations,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(recommendations: v));
  @override
  ListCopyWith<$R, MalStudio, MalStudioCopyWith<$R, MalStudio, MalStudio>>
      get studios => ListCopyWith($value.studios,
          (v, t) => v.copyWith.$chain(t), (v) => call(studios: v));
  @override
  MalAnimeStatisticsCopyWith<$R, MalAnimeStatistics, MalAnimeStatistics>
      get statistics =>
          $value.statistics.copyWith.$chain((v) => call(statistics: v));
  @override
  MalAnimeSeasonCopyWith<$R, MalAnimeSeason, MalAnimeSeason> get startSeason =>
      $value.startSeason.copyWith.$chain((v) => call(startSeason: v));
  @override
  MalAnimeBroadcastCopyWith<$R, MalAnimeBroadcast, MalAnimeBroadcast>
      get broadcast =>
          $value.broadcast.copyWith.$chain((v) => call(broadcast: v));
  @override
  $R call(
          {int? id,
          String? title,
          MalPicture? mainPicture,
          MalAlternativeTitles? alternativeTitles,
          DateTime? startDate,
          DateTime? endDate,
          String? synopsis,
          double? mean,
          int? rank,
          int? popularity,
          int? numListUsers,
          int? numScoringUsers,
          String? nsfw,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? mediaType,
          String? status,
          List<MalGenre>? genres,
          MalListStatus? myListStatus,
          List<MalPicture>? pictures,
          String? background,
          List<MalAnimeRelated>? relatedAnime,
          List<MalMangaDetailsRelated>? relatedManga,
          List<MalAnimeRecommendation>? recommendations,
          List<MalStudio>? studios,
          MalAnimeStatistics? statistics,
          int? numEpisodes,
          MalAnimeSeason? startSeason,
          MalAnimeBroadcast? broadcast,
          String? source,
          int? averageEpisodeDuration,
          String? rating}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (mainPicture != null) #mainPicture: mainPicture,
        if (alternativeTitles != null) #alternativeTitles: alternativeTitles,
        if (startDate != null) #startDate: startDate,
        if (endDate != null) #endDate: endDate,
        if (synopsis != null) #synopsis: synopsis,
        if (mean != null) #mean: mean,
        if (rank != null) #rank: rank,
        if (popularity != null) #popularity: popularity,
        if (numListUsers != null) #numListUsers: numListUsers,
        if (numScoringUsers != null) #numScoringUsers: numScoringUsers,
        if (nsfw != null) #nsfw: nsfw,
        if (createdAt != null) #createdAt: createdAt,
        if (updatedAt != null) #updatedAt: updatedAt,
        if (mediaType != null) #mediaType: mediaType,
        if (status != null) #status: status,
        if (genres != null) #genres: genres,
        if (myListStatus != null) #myListStatus: myListStatus,
        if (pictures != null) #pictures: pictures,
        if (background != null) #background: background,
        if (relatedAnime != null) #relatedAnime: relatedAnime,
        if (relatedManga != null) #relatedManga: relatedManga,
        if (recommendations != null) #recommendations: recommendations,
        if (studios != null) #studios: studios,
        if (statistics != null) #statistics: statistics,
        if (numEpisodes != null) #numEpisodes: numEpisodes,
        if (startSeason != null) #startSeason: startSeason,
        if (broadcast != null) #broadcast: broadcast,
        if (source != null) #source: source,
        if (averageEpisodeDuration != null)
          #averageEpisodeDuration: averageEpisodeDuration,
        if (rating != null) #rating: rating
      }));
  @override
  MalAnimeDetails $make(CopyWithData data) => MalAnimeDetails(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      mainPicture: data.get(#mainPicture, or: $value.mainPicture),
      alternativeTitles:
          data.get(#alternativeTitles, or: $value.alternativeTitles),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      synopsis: data.get(#synopsis, or: $value.synopsis),
      mean: data.get(#mean, or: $value.mean),
      rank: data.get(#rank, or: $value.rank),
      popularity: data.get(#popularity, or: $value.popularity),
      numListUsers: data.get(#numListUsers, or: $value.numListUsers),
      numScoringUsers: data.get(#numScoringUsers, or: $value.numScoringUsers),
      nsfw: data.get(#nsfw, or: $value.nsfw),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      mediaType: data.get(#mediaType, or: $value.mediaType),
      status: data.get(#status, or: $value.status),
      genres: data.get(#genres, or: $value.genres),
      myListStatus: data.get(#myListStatus, or: $value.myListStatus),
      pictures: data.get(#pictures, or: $value.pictures),
      background: data.get(#background, or: $value.background),
      relatedAnime: data.get(#relatedAnime, or: $value.relatedAnime),
      relatedManga: data.get(#relatedManga, or: $value.relatedManga),
      recommendations: data.get(#recommendations, or: $value.recommendations),
      studios: data.get(#studios, or: $value.studios),
      statistics: data.get(#statistics, or: $value.statistics),
      numEpisodes: data.get(#numEpisodes, or: $value.numEpisodes),
      startSeason: data.get(#startSeason, or: $value.startSeason),
      broadcast: data.get(#broadcast, or: $value.broadcast),
      source: data.get(#source, or: $value.source),
      averageEpisodeDuration:
          data.get(#averageEpisodeDuration, or: $value.averageEpisodeDuration),
      rating: data.get(#rating, or: $value.rating));

  @override
  MalAnimeDetailsCopyWith<$R2, MalAnimeDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalAnimeDetailsCopyWithImpl($value, $cast, t);
}

class MalAnimeBroadcastMapper extends ClassMapperBase<MalAnimeBroadcast> {
  MalAnimeBroadcastMapper._();

  static MalAnimeBroadcastMapper? _instance;
  static MalAnimeBroadcastMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalAnimeBroadcastMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalAnimeBroadcast';

  static String _$dayOfTheWeek(MalAnimeBroadcast v) => v.dayOfTheWeek;
  static const Field<MalAnimeBroadcast, String> _f$dayOfTheWeek =
      Field('dayOfTheWeek', _$dayOfTheWeek, key: r'day_of_the_week');
  static String _$startTime(MalAnimeBroadcast v) => v.startTime;
  static const Field<MalAnimeBroadcast, String> _f$startTime =
      Field('startTime', _$startTime, key: r'start_time');

  @override
  final MappableFields<MalAnimeBroadcast> fields = const {
    #dayOfTheWeek: _f$dayOfTheWeek,
    #startTime: _f$startTime,
  };

  static MalAnimeBroadcast _instantiate(DecodingData data) {
    return MalAnimeBroadcast(
        dayOfTheWeek: data.dec(_f$dayOfTheWeek),
        startTime: data.dec(_f$startTime));
  }

  @override
  final Function instantiate = _instantiate;

  static MalAnimeBroadcast fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalAnimeBroadcast>(map);
  }

  static MalAnimeBroadcast fromJson(String json) {
    return ensureInitialized().decodeJson<MalAnimeBroadcast>(json);
  }
}

mixin MalAnimeBroadcastMappable {
  String toJson() {
    return MalAnimeBroadcastMapper.ensureInitialized()
        .encodeJson<MalAnimeBroadcast>(this as MalAnimeBroadcast);
  }

  Map<String, dynamic> toMap() {
    return MalAnimeBroadcastMapper.ensureInitialized()
        .encodeMap<MalAnimeBroadcast>(this as MalAnimeBroadcast);
  }

  MalAnimeBroadcastCopyWith<MalAnimeBroadcast, MalAnimeBroadcast,
          MalAnimeBroadcast>
      get copyWith => _MalAnimeBroadcastCopyWithImpl(
          this as MalAnimeBroadcast, $identity, $identity);
  @override
  String toString() {
    return MalAnimeBroadcastMapper.ensureInitialized()
        .stringifyValue(this as MalAnimeBroadcast);
  }

  @override
  bool operator ==(Object other) {
    return MalAnimeBroadcastMapper.ensureInitialized()
        .equalsValue(this as MalAnimeBroadcast, other);
  }

  @override
  int get hashCode {
    return MalAnimeBroadcastMapper.ensureInitialized()
        .hashValue(this as MalAnimeBroadcast);
  }
}

extension MalAnimeBroadcastValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalAnimeBroadcast, $Out> {
  MalAnimeBroadcastCopyWith<$R, MalAnimeBroadcast, $Out>
      get $asMalAnimeBroadcast =>
          $base.as((v, t, t2) => _MalAnimeBroadcastCopyWithImpl(v, t, t2));
}

abstract class MalAnimeBroadcastCopyWith<$R, $In extends MalAnimeBroadcast,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? dayOfTheWeek, String? startTime});
  MalAnimeBroadcastCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalAnimeBroadcastCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalAnimeBroadcast, $Out>
    implements MalAnimeBroadcastCopyWith<$R, MalAnimeBroadcast, $Out> {
  _MalAnimeBroadcastCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalAnimeBroadcast> $mapper =
      MalAnimeBroadcastMapper.ensureInitialized();
  @override
  $R call({String? dayOfTheWeek, String? startTime}) =>
      $apply(FieldCopyWithData({
        if (dayOfTheWeek != null) #dayOfTheWeek: dayOfTheWeek,
        if (startTime != null) #startTime: startTime
      }));
  @override
  MalAnimeBroadcast $make(CopyWithData data) => MalAnimeBroadcast(
      dayOfTheWeek: data.get(#dayOfTheWeek, or: $value.dayOfTheWeek),
      startTime: data.get(#startTime, or: $value.startTime));

  @override
  MalAnimeBroadcastCopyWith<$R2, MalAnimeBroadcast, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalAnimeBroadcastCopyWithImpl($value, $cast, t);
}

class MalMangaDetailsMapper extends ClassMapperBase<MalMangaDetails> {
  MalMangaDetailsMapper._();

  static MalMangaDetailsMapper? _instance;
  static MalMangaDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalMangaDetailsMapper._());
      MalEntryDetailsMapper.ensureInitialized();
      MalPictureMapper.ensureInitialized();
      MalAlternativeTitlesMapper.ensureInitialized();
      MalGenreMapper.ensureInitialized();
      MalListStatusMapper.ensureInitialized();
      MalAnimeRelatedMapper.ensureInitialized();
      MalMangaDetailsRelatedMapper.ensureInitialized();
      MalAnimeRecommendationMapper.ensureInitialized();
      MalStudioMapper.ensureInitialized();
      MalAnimeStatisticsMapper.ensureInitialized();
      MalAuthorMapper.ensureInitialized();
      MalSerializationMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalMangaDetails';

  static int _$id(MalMangaDetails v) => v.id;
  static const Field<MalMangaDetails, int> _f$id = Field('id', _$id);
  static String _$title(MalMangaDetails v) => v.title;
  static const Field<MalMangaDetails, String> _f$title =
      Field('title', _$title);
  static MalPicture _$mainPicture(MalMangaDetails v) => v.mainPicture;
  static const Field<MalMangaDetails, MalPicture> _f$mainPicture =
      Field('mainPicture', _$mainPicture, key: r'main_picture');
  static MalAlternativeTitles _$alternativeTitles(MalMangaDetails v) =>
      v.alternativeTitles;
  static const Field<MalMangaDetails, MalAlternativeTitles>
      _f$alternativeTitles = Field('alternativeTitles', _$alternativeTitles,
          key: r'alternative_titles');
  static DateTime _$startDate(MalMangaDetails v) => v.startDate;
  static const Field<MalMangaDetails, DateTime> _f$startDate =
      Field('startDate', _$startDate, key: r'start_date');
  static DateTime _$endDate(MalMangaDetails v) => v.endDate;
  static const Field<MalMangaDetails, DateTime> _f$endDate =
      Field('endDate', _$endDate, key: r'end_date');
  static String _$synopsis(MalMangaDetails v) => v.synopsis;
  static const Field<MalMangaDetails, String> _f$synopsis =
      Field('synopsis', _$synopsis);
  static double _$mean(MalMangaDetails v) => v.mean;
  static const Field<MalMangaDetails, double> _f$mean = Field('mean', _$mean);
  static int _$rank(MalMangaDetails v) => v.rank;
  static const Field<MalMangaDetails, int> _f$rank = Field('rank', _$rank);
  static int _$popularity(MalMangaDetails v) => v.popularity;
  static const Field<MalMangaDetails, int> _f$popularity =
      Field('popularity', _$popularity);
  static int _$numListUsers(MalMangaDetails v) => v.numListUsers;
  static const Field<MalMangaDetails, int> _f$numListUsers =
      Field('numListUsers', _$numListUsers, key: r'num_list_users');
  static int _$numScoringUsers(MalMangaDetails v) => v.numScoringUsers;
  static const Field<MalMangaDetails, int> _f$numScoringUsers =
      Field('numScoringUsers', _$numScoringUsers, key: r'num_scoring_users');
  static String _$nsfw(MalMangaDetails v) => v.nsfw;
  static const Field<MalMangaDetails, String> _f$nsfw = Field('nsfw', _$nsfw);
  static DateTime _$createdAt(MalMangaDetails v) => v.createdAt;
  static const Field<MalMangaDetails, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static DateTime _$updatedAt(MalMangaDetails v) => v.updatedAt;
  static const Field<MalMangaDetails, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: r'updated_at');
  static String _$mediaType(MalMangaDetails v) => v.mediaType;
  static const Field<MalMangaDetails, String> _f$mediaType =
      Field('mediaType', _$mediaType, key: r'media_type');
  static String _$status(MalMangaDetails v) => v.status;
  static const Field<MalMangaDetails, String> _f$status =
      Field('status', _$status);
  static List<MalGenre> _$genres(MalMangaDetails v) => v.genres;
  static const Field<MalMangaDetails, List<MalGenre>> _f$genres =
      Field('genres', _$genres);
  static MalListStatus _$myListStatus(MalMangaDetails v) => v.myListStatus;
  static const Field<MalMangaDetails, MalListStatus> _f$myListStatus =
      Field('myListStatus', _$myListStatus, key: r'my_list_status');
  static List<MalPicture> _$pictures(MalMangaDetails v) => v.pictures;
  static const Field<MalMangaDetails, List<MalPicture>> _f$pictures =
      Field('pictures', _$pictures);
  static String _$background(MalMangaDetails v) => v.background;
  static const Field<MalMangaDetails, String> _f$background =
      Field('background', _$background);
  static List<MalAnimeRelated> _$relatedAnime(MalMangaDetails v) =>
      v.relatedAnime;
  static const Field<MalMangaDetails, List<MalAnimeRelated>> _f$relatedAnime =
      Field('relatedAnime', _$relatedAnime, key: r'related_anime');
  static List<MalMangaDetailsRelated> _$relatedManga(MalMangaDetails v) =>
      v.relatedManga;
  static const Field<MalMangaDetails, List<MalMangaDetailsRelated>>
      _f$relatedManga =
      Field('relatedManga', _$relatedManga, key: r'related_manga');
  static List<MalAnimeRecommendation> _$recommendations(MalMangaDetails v) =>
      v.recommendations;
  static const Field<MalMangaDetails, List<MalAnimeRecommendation>>
      _f$recommendations = Field('recommendations', _$recommendations);
  static List<MalStudio> _$studios(MalMangaDetails v) => v.studios;
  static const Field<MalMangaDetails, List<MalStudio>> _f$studios =
      Field('studios', _$studios);
  static MalAnimeStatistics _$statistics(MalMangaDetails v) => v.statistics;
  static const Field<MalMangaDetails, MalAnimeStatistics> _f$statistics =
      Field('statistics', _$statistics);
  static int _$numVolumes(MalMangaDetails v) => v.numVolumes;
  static const Field<MalMangaDetails, int> _f$numVolumes =
      Field('numVolumes', _$numVolumes, key: r'num_volumes');
  static int _$numChapters(MalMangaDetails v) => v.numChapters;
  static const Field<MalMangaDetails, int> _f$numChapters =
      Field('numChapters', _$numChapters, key: r'num_chapters');
  static List<MalAuthor> _$authors(MalMangaDetails v) => v.authors;
  static const Field<MalMangaDetails, List<MalAuthor>> _f$authors =
      Field('authors', _$authors);
  static List<MalSerialization> _$serializations(MalMangaDetails v) =>
      v.serializations;
  static const Field<MalMangaDetails, List<MalSerialization>>
      _f$serializations = Field('serializations', _$serializations);

  @override
  final MappableFields<MalMangaDetails> fields = const {
    #id: _f$id,
    #title: _f$title,
    #mainPicture: _f$mainPicture,
    #alternativeTitles: _f$alternativeTitles,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #synopsis: _f$synopsis,
    #mean: _f$mean,
    #rank: _f$rank,
    #popularity: _f$popularity,
    #numListUsers: _f$numListUsers,
    #numScoringUsers: _f$numScoringUsers,
    #nsfw: _f$nsfw,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #mediaType: _f$mediaType,
    #status: _f$status,
    #genres: _f$genres,
    #myListStatus: _f$myListStatus,
    #pictures: _f$pictures,
    #background: _f$background,
    #relatedAnime: _f$relatedAnime,
    #relatedManga: _f$relatedManga,
    #recommendations: _f$recommendations,
    #studios: _f$studios,
    #statistics: _f$statistics,
    #numVolumes: _f$numVolumes,
    #numChapters: _f$numChapters,
    #authors: _f$authors,
    #serializations: _f$serializations,
  };

  static MalMangaDetails _instantiate(DecodingData data) {
    return MalMangaDetails(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        mainPicture: data.dec(_f$mainPicture),
        alternativeTitles: data.dec(_f$alternativeTitles),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        synopsis: data.dec(_f$synopsis),
        mean: data.dec(_f$mean),
        rank: data.dec(_f$rank),
        popularity: data.dec(_f$popularity),
        numListUsers: data.dec(_f$numListUsers),
        numScoringUsers: data.dec(_f$numScoringUsers),
        nsfw: data.dec(_f$nsfw),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        mediaType: data.dec(_f$mediaType),
        status: data.dec(_f$status),
        genres: data.dec(_f$genres),
        myListStatus: data.dec(_f$myListStatus),
        pictures: data.dec(_f$pictures),
        background: data.dec(_f$background),
        relatedAnime: data.dec(_f$relatedAnime),
        relatedManga: data.dec(_f$relatedManga),
        recommendations: data.dec(_f$recommendations),
        studios: data.dec(_f$studios),
        statistics: data.dec(_f$statistics),
        numVolumes: data.dec(_f$numVolumes),
        numChapters: data.dec(_f$numChapters),
        authors: data.dec(_f$authors),
        serializations: data.dec(_f$serializations));
  }

  @override
  final Function instantiate = _instantiate;

  static MalMangaDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalMangaDetails>(map);
  }

  static MalMangaDetails fromJson(String json) {
    return ensureInitialized().decodeJson<MalMangaDetails>(json);
  }
}

mixin MalMangaDetailsMappable {
  String toJson() {
    return MalMangaDetailsMapper.ensureInitialized()
        .encodeJson<MalMangaDetails>(this as MalMangaDetails);
  }

  Map<String, dynamic> toMap() {
    return MalMangaDetailsMapper.ensureInitialized()
        .encodeMap<MalMangaDetails>(this as MalMangaDetails);
  }

  MalMangaDetailsCopyWith<MalMangaDetails, MalMangaDetails, MalMangaDetails>
      get copyWith => _MalMangaDetailsCopyWithImpl(
          this as MalMangaDetails, $identity, $identity);
  @override
  String toString() {
    return MalMangaDetailsMapper.ensureInitialized()
        .stringifyValue(this as MalMangaDetails);
  }

  @override
  bool operator ==(Object other) {
    return MalMangaDetailsMapper.ensureInitialized()
        .equalsValue(this as MalMangaDetails, other);
  }

  @override
  int get hashCode {
    return MalMangaDetailsMapper.ensureInitialized()
        .hashValue(this as MalMangaDetails);
  }
}

extension MalMangaDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalMangaDetails, $Out> {
  MalMangaDetailsCopyWith<$R, MalMangaDetails, $Out> get $asMalMangaDetails =>
      $base.as((v, t, t2) => _MalMangaDetailsCopyWithImpl(v, t, t2));
}

abstract class MalMangaDetailsCopyWith<$R, $In extends MalMangaDetails, $Out>
    implements MalEntryDetailsCopyWith<$R, $In, $Out> {
  @override
  MalPictureCopyWith<$R, MalPicture, MalPicture> get mainPicture;
  @override
  MalAlternativeTitlesCopyWith<$R, MalAlternativeTitles, MalAlternativeTitles>
      get alternativeTitles;
  @override
  ListCopyWith<$R, MalGenre, MalGenreCopyWith<$R, MalGenre, MalGenre>>
      get genres;
  @override
  MalListStatusCopyWith<$R, MalListStatus, MalListStatus> get myListStatus;
  @override
  ListCopyWith<$R, MalPicture, MalPictureCopyWith<$R, MalPicture, MalPicture>>
      get pictures;
  @override
  ListCopyWith<$R, MalAnimeRelated,
          MalAnimeRelatedCopyWith<$R, MalAnimeRelated, MalAnimeRelated>>
      get relatedAnime;
  @override
  ListCopyWith<
      $R,
      MalMangaDetailsRelated,
      MalMangaDetailsRelatedCopyWith<$R, MalMangaDetailsRelated,
          MalMangaDetailsRelated>> get relatedManga;
  @override
  ListCopyWith<
      $R,
      MalAnimeRecommendation,
      MalAnimeRecommendationCopyWith<$R, MalAnimeRecommendation,
          MalAnimeRecommendation>> get recommendations;
  @override
  ListCopyWith<$R, MalStudio, MalStudioCopyWith<$R, MalStudio, MalStudio>>
      get studios;
  @override
  MalAnimeStatisticsCopyWith<$R, MalAnimeStatistics, MalAnimeStatistics>
      get statistics;
  ListCopyWith<$R, MalAuthor, MalAuthorCopyWith<$R, MalAuthor, MalAuthor>>
      get authors;
  ListCopyWith<$R, MalSerialization,
          MalSerializationCopyWith<$R, MalSerialization, MalSerialization>>
      get serializations;
  @override
  $R call(
      {int? id,
      String? title,
      MalPicture? mainPicture,
      MalAlternativeTitles? alternativeTitles,
      DateTime? startDate,
      DateTime? endDate,
      String? synopsis,
      double? mean,
      int? rank,
      int? popularity,
      int? numListUsers,
      int? numScoringUsers,
      String? nsfw,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? mediaType,
      String? status,
      List<MalGenre>? genres,
      MalListStatus? myListStatus,
      List<MalPicture>? pictures,
      String? background,
      List<MalAnimeRelated>? relatedAnime,
      List<MalMangaDetailsRelated>? relatedManga,
      List<MalAnimeRecommendation>? recommendations,
      List<MalStudio>? studios,
      MalAnimeStatistics? statistics,
      int? numVolumes,
      int? numChapters,
      List<MalAuthor>? authors,
      List<MalSerialization>? serializations});
  MalMangaDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalMangaDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalMangaDetails, $Out>
    implements MalMangaDetailsCopyWith<$R, MalMangaDetails, $Out> {
  _MalMangaDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalMangaDetails> $mapper =
      MalMangaDetailsMapper.ensureInitialized();
  @override
  MalPictureCopyWith<$R, MalPicture, MalPicture> get mainPicture =>
      $value.mainPicture.copyWith.$chain((v) => call(mainPicture: v));
  @override
  MalAlternativeTitlesCopyWith<$R, MalAlternativeTitles, MalAlternativeTitles>
      get alternativeTitles => $value.alternativeTitles.copyWith
          .$chain((v) => call(alternativeTitles: v));
  @override
  ListCopyWith<$R, MalGenre, MalGenreCopyWith<$R, MalGenre, MalGenre>>
      get genres => ListCopyWith($value.genres, (v, t) => v.copyWith.$chain(t),
          (v) => call(genres: v));
  @override
  MalListStatusCopyWith<$R, MalListStatus, MalListStatus> get myListStatus =>
      $value.myListStatus.copyWith.$chain((v) => call(myListStatus: v));
  @override
  ListCopyWith<$R, MalPicture, MalPictureCopyWith<$R, MalPicture, MalPicture>>
      get pictures => ListCopyWith($value.pictures,
          (v, t) => v.copyWith.$chain(t), (v) => call(pictures: v));
  @override
  ListCopyWith<$R, MalAnimeRelated,
          MalAnimeRelatedCopyWith<$R, MalAnimeRelated, MalAnimeRelated>>
      get relatedAnime => ListCopyWith($value.relatedAnime,
          (v, t) => v.copyWith.$chain(t), (v) => call(relatedAnime: v));
  @override
  ListCopyWith<
      $R,
      MalMangaDetailsRelated,
      MalMangaDetailsRelatedCopyWith<$R, MalMangaDetailsRelated,
          MalMangaDetailsRelated>> get relatedManga => ListCopyWith(
      $value.relatedManga,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(relatedManga: v));
  @override
  ListCopyWith<
      $R,
      MalAnimeRecommendation,
      MalAnimeRecommendationCopyWith<$R, MalAnimeRecommendation,
          MalAnimeRecommendation>> get recommendations => ListCopyWith(
      $value.recommendations,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(recommendations: v));
  @override
  ListCopyWith<$R, MalStudio, MalStudioCopyWith<$R, MalStudio, MalStudio>>
      get studios => ListCopyWith($value.studios,
          (v, t) => v.copyWith.$chain(t), (v) => call(studios: v));
  @override
  MalAnimeStatisticsCopyWith<$R, MalAnimeStatistics, MalAnimeStatistics>
      get statistics =>
          $value.statistics.copyWith.$chain((v) => call(statistics: v));
  @override
  ListCopyWith<$R, MalAuthor, MalAuthorCopyWith<$R, MalAuthor, MalAuthor>>
      get authors => ListCopyWith($value.authors,
          (v, t) => v.copyWith.$chain(t), (v) => call(authors: v));
  @override
  ListCopyWith<$R, MalSerialization,
          MalSerializationCopyWith<$R, MalSerialization, MalSerialization>>
      get serializations => ListCopyWith($value.serializations,
          (v, t) => v.copyWith.$chain(t), (v) => call(serializations: v));
  @override
  $R call(
          {int? id,
          String? title,
          MalPicture? mainPicture,
          MalAlternativeTitles? alternativeTitles,
          DateTime? startDate,
          DateTime? endDate,
          String? synopsis,
          double? mean,
          int? rank,
          int? popularity,
          int? numListUsers,
          int? numScoringUsers,
          String? nsfw,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? mediaType,
          String? status,
          List<MalGenre>? genres,
          MalListStatus? myListStatus,
          List<MalPicture>? pictures,
          String? background,
          List<MalAnimeRelated>? relatedAnime,
          List<MalMangaDetailsRelated>? relatedManga,
          List<MalAnimeRecommendation>? recommendations,
          List<MalStudio>? studios,
          MalAnimeStatistics? statistics,
          int? numVolumes,
          int? numChapters,
          List<MalAuthor>? authors,
          List<MalSerialization>? serializations}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (mainPicture != null) #mainPicture: mainPicture,
        if (alternativeTitles != null) #alternativeTitles: alternativeTitles,
        if (startDate != null) #startDate: startDate,
        if (endDate != null) #endDate: endDate,
        if (synopsis != null) #synopsis: synopsis,
        if (mean != null) #mean: mean,
        if (rank != null) #rank: rank,
        if (popularity != null) #popularity: popularity,
        if (numListUsers != null) #numListUsers: numListUsers,
        if (numScoringUsers != null) #numScoringUsers: numScoringUsers,
        if (nsfw != null) #nsfw: nsfw,
        if (createdAt != null) #createdAt: createdAt,
        if (updatedAt != null) #updatedAt: updatedAt,
        if (mediaType != null) #mediaType: mediaType,
        if (status != null) #status: status,
        if (genres != null) #genres: genres,
        if (myListStatus != null) #myListStatus: myListStatus,
        if (pictures != null) #pictures: pictures,
        if (background != null) #background: background,
        if (relatedAnime != null) #relatedAnime: relatedAnime,
        if (relatedManga != null) #relatedManga: relatedManga,
        if (recommendations != null) #recommendations: recommendations,
        if (studios != null) #studios: studios,
        if (statistics != null) #statistics: statistics,
        if (numVolumes != null) #numVolumes: numVolumes,
        if (numChapters != null) #numChapters: numChapters,
        if (authors != null) #authors: authors,
        if (serializations != null) #serializations: serializations
      }));
  @override
  MalMangaDetails $make(CopyWithData data) => MalMangaDetails(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      mainPicture: data.get(#mainPicture, or: $value.mainPicture),
      alternativeTitles:
          data.get(#alternativeTitles, or: $value.alternativeTitles),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      synopsis: data.get(#synopsis, or: $value.synopsis),
      mean: data.get(#mean, or: $value.mean),
      rank: data.get(#rank, or: $value.rank),
      popularity: data.get(#popularity, or: $value.popularity),
      numListUsers: data.get(#numListUsers, or: $value.numListUsers),
      numScoringUsers: data.get(#numScoringUsers, or: $value.numScoringUsers),
      nsfw: data.get(#nsfw, or: $value.nsfw),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      mediaType: data.get(#mediaType, or: $value.mediaType),
      status: data.get(#status, or: $value.status),
      genres: data.get(#genres, or: $value.genres),
      myListStatus: data.get(#myListStatus, or: $value.myListStatus),
      pictures: data.get(#pictures, or: $value.pictures),
      background: data.get(#background, or: $value.background),
      relatedAnime: data.get(#relatedAnime, or: $value.relatedAnime),
      relatedManga: data.get(#relatedManga, or: $value.relatedManga),
      recommendations: data.get(#recommendations, or: $value.recommendations),
      studios: data.get(#studios, or: $value.studios),
      statistics: data.get(#statistics, or: $value.statistics),
      numVolumes: data.get(#numVolumes, or: $value.numVolumes),
      numChapters: data.get(#numChapters, or: $value.numChapters),
      authors: data.get(#authors, or: $value.authors),
      serializations: data.get(#serializations, or: $value.serializations));

  @override
  MalMangaDetailsCopyWith<$R2, MalMangaDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalMangaDetailsCopyWithImpl($value, $cast, t);
}

class MalAuthorMapper extends ClassMapperBase<MalAuthor> {
  MalAuthorMapper._();

  static MalAuthorMapper? _instance;
  static MalAuthorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalAuthorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalAuthor';

  static int _$id(MalAuthor v) => v.id;
  static const Field<MalAuthor, int> _f$id = Field('id', _$id);
  static String _$firstName(MalAuthor v) => v.firstName;
  static const Field<MalAuthor, String> _f$firstName =
      Field('firstName', _$firstName, key: r'first_name');
  static String _$lastName(MalAuthor v) => v.lastName;
  static const Field<MalAuthor, String> _f$lastName =
      Field('lastName', _$lastName, key: r'last_name');

  @override
  final MappableFields<MalAuthor> fields = const {
    #id: _f$id,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
  };

  static MalAuthor _instantiate(DecodingData data) {
    return MalAuthor(
        id: data.dec(_f$id),
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName));
  }

  @override
  final Function instantiate = _instantiate;

  static MalAuthor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalAuthor>(map);
  }

  static MalAuthor fromJson(String json) {
    return ensureInitialized().decodeJson<MalAuthor>(json);
  }
}

mixin MalAuthorMappable {
  String toJson() {
    return MalAuthorMapper.ensureInitialized()
        .encodeJson<MalAuthor>(this as MalAuthor);
  }

  Map<String, dynamic> toMap() {
    return MalAuthorMapper.ensureInitialized()
        .encodeMap<MalAuthor>(this as MalAuthor);
  }

  MalAuthorCopyWith<MalAuthor, MalAuthor, MalAuthor> get copyWith =>
      _MalAuthorCopyWithImpl(this as MalAuthor, $identity, $identity);
  @override
  String toString() {
    return MalAuthorMapper.ensureInitialized()
        .stringifyValue(this as MalAuthor);
  }

  @override
  bool operator ==(Object other) {
    return MalAuthorMapper.ensureInitialized()
        .equalsValue(this as MalAuthor, other);
  }

  @override
  int get hashCode {
    return MalAuthorMapper.ensureInitialized().hashValue(this as MalAuthor);
  }
}

extension MalAuthorValueCopy<$R, $Out> on ObjectCopyWith<$R, MalAuthor, $Out> {
  MalAuthorCopyWith<$R, MalAuthor, $Out> get $asMalAuthor =>
      $base.as((v, t, t2) => _MalAuthorCopyWithImpl(v, t, t2));
}

abstract class MalAuthorCopyWith<$R, $In extends MalAuthor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? firstName, String? lastName});
  MalAuthorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MalAuthorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalAuthor, $Out>
    implements MalAuthorCopyWith<$R, MalAuthor, $Out> {
  _MalAuthorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalAuthor> $mapper =
      MalAuthorMapper.ensureInitialized();
  @override
  $R call({int? id, String? firstName, String? lastName}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (firstName != null) #firstName: firstName,
        if (lastName != null) #lastName: lastName
      }));
  @override
  MalAuthor $make(CopyWithData data) => MalAuthor(
      id: data.get(#id, or: $value.id),
      firstName: data.get(#firstName, or: $value.firstName),
      lastName: data.get(#lastName, or: $value.lastName));

  @override
  MalAuthorCopyWith<$R2, MalAuthor, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalAuthorCopyWithImpl($value, $cast, t);
}

class MalSerializationMapper extends ClassMapperBase<MalSerialization> {
  MalSerializationMapper._();

  static MalSerializationMapper? _instance;
  static MalSerializationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalSerializationMapper._());
      MalSerializationNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalSerialization';

  static MalSerializationNode _$node(MalSerialization v) => v.node;
  static const Field<MalSerialization, MalSerializationNode> _f$node =
      Field('node', _$node);

  @override
  final MappableFields<MalSerialization> fields = const {
    #node: _f$node,
  };

  static MalSerialization _instantiate(DecodingData data) {
    return MalSerialization(node: data.dec(_f$node));
  }

  @override
  final Function instantiate = _instantiate;

  static MalSerialization fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalSerialization>(map);
  }

  static MalSerialization fromJson(String json) {
    return ensureInitialized().decodeJson<MalSerialization>(json);
  }
}

mixin MalSerializationMappable {
  String toJson() {
    return MalSerializationMapper.ensureInitialized()
        .encodeJson<MalSerialization>(this as MalSerialization);
  }

  Map<String, dynamic> toMap() {
    return MalSerializationMapper.ensureInitialized()
        .encodeMap<MalSerialization>(this as MalSerialization);
  }

  MalSerializationCopyWith<MalSerialization, MalSerialization, MalSerialization>
      get copyWith => _MalSerializationCopyWithImpl(
          this as MalSerialization, $identity, $identity);
  @override
  String toString() {
    return MalSerializationMapper.ensureInitialized()
        .stringifyValue(this as MalSerialization);
  }

  @override
  bool operator ==(Object other) {
    return MalSerializationMapper.ensureInitialized()
        .equalsValue(this as MalSerialization, other);
  }

  @override
  int get hashCode {
    return MalSerializationMapper.ensureInitialized()
        .hashValue(this as MalSerialization);
  }
}

extension MalSerializationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalSerialization, $Out> {
  MalSerializationCopyWith<$R, MalSerialization, $Out>
      get $asMalSerialization =>
          $base.as((v, t, t2) => _MalSerializationCopyWithImpl(v, t, t2));
}

abstract class MalSerializationCopyWith<$R, $In extends MalSerialization, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MalSerializationNodeCopyWith<$R, MalSerializationNode, MalSerializationNode>
      get node;
  $R call({MalSerializationNode? node});
  MalSerializationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalSerializationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalSerialization, $Out>
    implements MalSerializationCopyWith<$R, MalSerialization, $Out> {
  _MalSerializationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalSerialization> $mapper =
      MalSerializationMapper.ensureInitialized();
  @override
  MalSerializationNodeCopyWith<$R, MalSerializationNode, MalSerializationNode>
      get node => $value.node.copyWith.$chain((v) => call(node: v));
  @override
  $R call({MalSerializationNode? node}) =>
      $apply(FieldCopyWithData({if (node != null) #node: node}));
  @override
  MalSerialization $make(CopyWithData data) =>
      MalSerialization(node: data.get(#node, or: $value.node));

  @override
  MalSerializationCopyWith<$R2, MalSerialization, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalSerializationCopyWithImpl($value, $cast, t);
}

class MalSerializationNodeMapper extends ClassMapperBase<MalSerializationNode> {
  MalSerializationNodeMapper._();

  static MalSerializationNodeMapper? _instance;
  static MalSerializationNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalSerializationNodeMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalSerializationNode';

  static int _$id(MalSerializationNode v) => v.id;
  static const Field<MalSerializationNode, int> _f$id = Field('id', _$id);
  static String _$name(MalSerializationNode v) => v.name;
  static const Field<MalSerializationNode, String> _f$name =
      Field('name', _$name);

  @override
  final MappableFields<MalSerializationNode> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static MalSerializationNode _instantiate(DecodingData data) {
    return MalSerializationNode(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static MalSerializationNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalSerializationNode>(map);
  }

  static MalSerializationNode fromJson(String json) {
    return ensureInitialized().decodeJson<MalSerializationNode>(json);
  }
}

mixin MalSerializationNodeMappable {
  String toJson() {
    return MalSerializationNodeMapper.ensureInitialized()
        .encodeJson<MalSerializationNode>(this as MalSerializationNode);
  }

  Map<String, dynamic> toMap() {
    return MalSerializationNodeMapper.ensureInitialized()
        .encodeMap<MalSerializationNode>(this as MalSerializationNode);
  }

  MalSerializationNodeCopyWith<MalSerializationNode, MalSerializationNode,
          MalSerializationNode>
      get copyWith => _MalSerializationNodeCopyWithImpl(
          this as MalSerializationNode, $identity, $identity);
  @override
  String toString() {
    return MalSerializationNodeMapper.ensureInitialized()
        .stringifyValue(this as MalSerializationNode);
  }

  @override
  bool operator ==(Object other) {
    return MalSerializationNodeMapper.ensureInitialized()
        .equalsValue(this as MalSerializationNode, other);
  }

  @override
  int get hashCode {
    return MalSerializationNodeMapper.ensureInitialized()
        .hashValue(this as MalSerializationNode);
  }
}

extension MalSerializationNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalSerializationNode, $Out> {
  MalSerializationNodeCopyWith<$R, MalSerializationNode, $Out>
      get $asMalSerializationNode =>
          $base.as((v, t, t2) => _MalSerializationNodeCopyWithImpl(v, t, t2));
}

abstract class MalSerializationNodeCopyWith<
    $R,
    $In extends MalSerializationNode,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name});
  MalSerializationNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalSerializationNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalSerializationNode, $Out>
    implements MalSerializationNodeCopyWith<$R, MalSerializationNode, $Out> {
  _MalSerializationNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalSerializationNode> $mapper =
      MalSerializationNodeMapper.ensureInitialized();
  @override
  $R call({int? id, String? name}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (name != null) #name: name}));
  @override
  MalSerializationNode $make(CopyWithData data) => MalSerializationNode(
      id: data.get(#id, or: $value.id), name: data.get(#name, or: $value.name));

  @override
  MalSerializationNodeCopyWith<$R2, MalSerializationNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MalSerializationNodeCopyWithImpl($value, $cast, t);
}

class MalEntryRankingMapper extends ClassMapperBase<MalEntryRanking> {
  MalEntryRankingMapper._();

  static MalEntryRankingMapper? _instance;
  static MalEntryRankingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalEntryRankingMapper._());
      MalEntryNodeMapper.ensureInitialized();
      MalEntryRankingItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalEntryRanking';

  static MalEntryNode _$node(MalEntryRanking v) => v.node;
  static const Field<MalEntryRanking, MalEntryNode> _f$node =
      Field('node', _$node);
  static MalEntryRankingItem _$rank(MalEntryRanking v) => v.rank;
  static const Field<MalEntryRanking, MalEntryRankingItem> _f$rank =
      Field('rank', _$rank);

  @override
  final MappableFields<MalEntryRanking> fields = const {
    #node: _f$node,
    #rank: _f$rank,
  };

  static MalEntryRanking _instantiate(DecodingData data) {
    return MalEntryRanking(node: data.dec(_f$node), rank: data.dec(_f$rank));
  }

  @override
  final Function instantiate = _instantiate;

  static MalEntryRanking fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalEntryRanking>(map);
  }

  static MalEntryRanking fromJson(String json) {
    return ensureInitialized().decodeJson<MalEntryRanking>(json);
  }
}

mixin MalEntryRankingMappable {
  String toJson() {
    return MalEntryRankingMapper.ensureInitialized()
        .encodeJson<MalEntryRanking>(this as MalEntryRanking);
  }

  Map<String, dynamic> toMap() {
    return MalEntryRankingMapper.ensureInitialized()
        .encodeMap<MalEntryRanking>(this as MalEntryRanking);
  }

  MalEntryRankingCopyWith<MalEntryRanking, MalEntryRanking, MalEntryRanking>
      get copyWith => _MalEntryRankingCopyWithImpl(
          this as MalEntryRanking, $identity, $identity);
  @override
  String toString() {
    return MalEntryRankingMapper.ensureInitialized()
        .stringifyValue(this as MalEntryRanking);
  }

  @override
  bool operator ==(Object other) {
    return MalEntryRankingMapper.ensureInitialized()
        .equalsValue(this as MalEntryRanking, other);
  }

  @override
  int get hashCode {
    return MalEntryRankingMapper.ensureInitialized()
        .hashValue(this as MalEntryRanking);
  }
}

extension MalEntryRankingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalEntryRanking, $Out> {
  MalEntryRankingCopyWith<$R, MalEntryRanking, $Out> get $asMalEntryRanking =>
      $base.as((v, t, t2) => _MalEntryRankingCopyWithImpl(v, t, t2));
}

abstract class MalEntryRankingCopyWith<$R, $In extends MalEntryRanking, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MalEntryNodeCopyWith<$R, MalEntryNode, MalEntryNode> get node;
  MalEntryRankingItemCopyWith<$R, MalEntryRankingItem, MalEntryRankingItem>
      get rank;
  $R call({MalEntryNode? node, MalEntryRankingItem? rank});
  MalEntryRankingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalEntryRankingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalEntryRanking, $Out>
    implements MalEntryRankingCopyWith<$R, MalEntryRanking, $Out> {
  _MalEntryRankingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalEntryRanking> $mapper =
      MalEntryRankingMapper.ensureInitialized();
  @override
  MalEntryNodeCopyWith<$R, MalEntryNode, MalEntryNode> get node =>
      $value.node.copyWith.$chain((v) => call(node: v));
  @override
  MalEntryRankingItemCopyWith<$R, MalEntryRankingItem, MalEntryRankingItem>
      get rank => $value.rank.copyWith.$chain((v) => call(rank: v));
  @override
  $R call({MalEntryNode? node, MalEntryRankingItem? rank}) =>
      $apply(FieldCopyWithData(
          {if (node != null) #node: node, if (rank != null) #rank: rank}));
  @override
  MalEntryRanking $make(CopyWithData data) => MalEntryRanking(
      node: data.get(#node, or: $value.node),
      rank: data.get(#rank, or: $value.rank));

  @override
  MalEntryRankingCopyWith<$R2, MalEntryRanking, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalEntryRankingCopyWithImpl($value, $cast, t);
}

class MalEntryRankingItemMapper extends ClassMapperBase<MalEntryRankingItem> {
  MalEntryRankingItemMapper._();

  static MalEntryRankingItemMapper? _instance;
  static MalEntryRankingItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalEntryRankingItemMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MalEntryRankingItem';

  static int _$rank(MalEntryRankingItem v) => v.rank;
  static const Field<MalEntryRankingItem, int> _f$rank = Field('rank', _$rank);

  @override
  final MappableFields<MalEntryRankingItem> fields = const {
    #rank: _f$rank,
  };

  static MalEntryRankingItem _instantiate(DecodingData data) {
    return MalEntryRankingItem(rank: data.dec(_f$rank));
  }

  @override
  final Function instantiate = _instantiate;

  static MalEntryRankingItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalEntryRankingItem>(map);
  }

  static MalEntryRankingItem fromJson(String json) {
    return ensureInitialized().decodeJson<MalEntryRankingItem>(json);
  }
}

mixin MalEntryRankingItemMappable {
  String toJson() {
    return MalEntryRankingItemMapper.ensureInitialized()
        .encodeJson<MalEntryRankingItem>(this as MalEntryRankingItem);
  }

  Map<String, dynamic> toMap() {
    return MalEntryRankingItemMapper.ensureInitialized()
        .encodeMap<MalEntryRankingItem>(this as MalEntryRankingItem);
  }

  MalEntryRankingItemCopyWith<MalEntryRankingItem, MalEntryRankingItem,
          MalEntryRankingItem>
      get copyWith => _MalEntryRankingItemCopyWithImpl(
          this as MalEntryRankingItem, $identity, $identity);
  @override
  String toString() {
    return MalEntryRankingItemMapper.ensureInitialized()
        .stringifyValue(this as MalEntryRankingItem);
  }

  @override
  bool operator ==(Object other) {
    return MalEntryRankingItemMapper.ensureInitialized()
        .equalsValue(this as MalEntryRankingItem, other);
  }

  @override
  int get hashCode {
    return MalEntryRankingItemMapper.ensureInitialized()
        .hashValue(this as MalEntryRankingItem);
  }
}

extension MalEntryRankingItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalEntryRankingItem, $Out> {
  MalEntryRankingItemCopyWith<$R, MalEntryRankingItem, $Out>
      get $asMalEntryRankingItem =>
          $base.as((v, t, t2) => _MalEntryRankingItemCopyWithImpl(v, t, t2));
}

abstract class MalEntryRankingItemCopyWith<$R, $In extends MalEntryRankingItem,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? rank});
  MalEntryRankingItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalEntryRankingItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalEntryRankingItem, $Out>
    implements MalEntryRankingItemCopyWith<$R, MalEntryRankingItem, $Out> {
  _MalEntryRankingItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalEntryRankingItem> $mapper =
      MalEntryRankingItemMapper.ensureInitialized();
  @override
  $R call({int? rank}) =>
      $apply(FieldCopyWithData({if (rank != null) #rank: rank}));
  @override
  MalEntryRankingItem $make(CopyWithData data) =>
      MalEntryRankingItem(rank: data.get(#rank, or: $value.rank));

  @override
  MalEntryRankingItemCopyWith<$R2, MalEntryRankingItem, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MalEntryRankingItemCopyWithImpl($value, $cast, t);
}

class MalAnimeListStatusMapper extends ClassMapperBase<MalAnimeListStatus> {
  MalAnimeListStatusMapper._();

  static MalAnimeListStatusMapper? _instance;
  static MalAnimeListStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MalAnimeListStatusMapper._());
      MalListStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalAnimeListStatus';

  static String _$status(MalAnimeListStatus v) => v.status;
  static const Field<MalAnimeListStatus, String> _f$status =
      Field('status', _$status);
  static int _$score(MalAnimeListStatus v) => v.score;
  static const Field<MalAnimeListStatus, int> _f$score =
      Field('score', _$score);
  static DateTime _$updatedAt(MalAnimeListStatus v) => v.updatedAt;
  static const Field<MalAnimeListStatus, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: r'updated_at');
  static int _$numEpisodesWatched(MalAnimeListStatus v) => v.numEpisodesWatched;
  static const Field<MalAnimeListStatus, int> _f$numEpisodesWatched = Field(
      'numEpisodesWatched', _$numEpisodesWatched,
      key: r'num_episodes_watched');
  static bool _$isRewatching(MalAnimeListStatus v) => v.isRewatching;
  static const Field<MalAnimeListStatus, bool> _f$isRewatching =
      Field('isRewatching', _$isRewatching, key: r'is_rewatching');

  @override
  final MappableFields<MalAnimeListStatus> fields = const {
    #status: _f$status,
    #score: _f$score,
    #updatedAt: _f$updatedAt,
    #numEpisodesWatched: _f$numEpisodesWatched,
    #isRewatching: _f$isRewatching,
  };

  static MalAnimeListStatus _instantiate(DecodingData data) {
    return MalAnimeListStatus(
        status: data.dec(_f$status),
        score: data.dec(_f$score),
        updatedAt: data.dec(_f$updatedAt),
        numEpisodesWatched: data.dec(_f$numEpisodesWatched),
        isRewatching: data.dec(_f$isRewatching));
  }

  @override
  final Function instantiate = _instantiate;

  static MalAnimeListStatus fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalAnimeListStatus>(map);
  }

  static MalAnimeListStatus fromJson(String json) {
    return ensureInitialized().decodeJson<MalAnimeListStatus>(json);
  }
}

mixin MalAnimeListStatusMappable {
  String toJson() {
    return MalAnimeListStatusMapper.ensureInitialized()
        .encodeJson<MalAnimeListStatus>(this as MalAnimeListStatus);
  }

  Map<String, dynamic> toMap() {
    return MalAnimeListStatusMapper.ensureInitialized()
        .encodeMap<MalAnimeListStatus>(this as MalAnimeListStatus);
  }

  MalAnimeListStatusCopyWith<MalAnimeListStatus, MalAnimeListStatus,
          MalAnimeListStatus>
      get copyWith => _MalAnimeListStatusCopyWithImpl(
          this as MalAnimeListStatus, $identity, $identity);
  @override
  String toString() {
    return MalAnimeListStatusMapper.ensureInitialized()
        .stringifyValue(this as MalAnimeListStatus);
  }

  @override
  bool operator ==(Object other) {
    return MalAnimeListStatusMapper.ensureInitialized()
        .equalsValue(this as MalAnimeListStatus, other);
  }

  @override
  int get hashCode {
    return MalAnimeListStatusMapper.ensureInitialized()
        .hashValue(this as MalAnimeListStatus);
  }
}

extension MalAnimeListStatusValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalAnimeListStatus, $Out> {
  MalAnimeListStatusCopyWith<$R, MalAnimeListStatus, $Out>
      get $asMalAnimeListStatus =>
          $base.as((v, t, t2) => _MalAnimeListStatusCopyWithImpl(v, t, t2));
}

abstract class MalAnimeListStatusCopyWith<$R, $In extends MalAnimeListStatus,
    $Out> implements MalListStatusCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? status,
      int? score,
      DateTime? updatedAt,
      int? numEpisodesWatched,
      bool? isRewatching});
  MalAnimeListStatusCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalAnimeListStatusCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalAnimeListStatus, $Out>
    implements MalAnimeListStatusCopyWith<$R, MalAnimeListStatus, $Out> {
  _MalAnimeListStatusCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalAnimeListStatus> $mapper =
      MalAnimeListStatusMapper.ensureInitialized();
  @override
  $R call(
          {String? status,
          int? score,
          DateTime? updatedAt,
          int? numEpisodesWatched,
          bool? isRewatching}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (score != null) #score: score,
        if (updatedAt != null) #updatedAt: updatedAt,
        if (numEpisodesWatched != null) #numEpisodesWatched: numEpisodesWatched,
        if (isRewatching != null) #isRewatching: isRewatching
      }));
  @override
  MalAnimeListStatus $make(CopyWithData data) => MalAnimeListStatus(
      status: data.get(#status, or: $value.status),
      score: data.get(#score, or: $value.score),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      numEpisodesWatched:
          data.get(#numEpisodesWatched, or: $value.numEpisodesWatched),
      isRewatching: data.get(#isRewatching, or: $value.isRewatching));

  @override
  MalAnimeListStatusCopyWith<$R2, MalAnimeListStatus, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MalAnimeListStatusCopyWithImpl($value, $cast, t);
}

class MalMangaDetailsListStatusMapper
    extends ClassMapperBase<MalMangaDetailsListStatus> {
  MalMangaDetailsListStatusMapper._();

  static MalMangaDetailsListStatusMapper? _instance;
  static MalMangaDetailsListStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = MalMangaDetailsListStatusMapper._());
      MalListStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MalMangaDetailsListStatus';

  static String _$status(MalMangaDetailsListStatus v) => v.status;
  static const Field<MalMangaDetailsListStatus, String> _f$status =
      Field('status', _$status);
  static int _$score(MalMangaDetailsListStatus v) => v.score;
  static const Field<MalMangaDetailsListStatus, int> _f$score =
      Field('score', _$score);
  static DateTime _$updatedAt(MalMangaDetailsListStatus v) => v.updatedAt;
  static const Field<MalMangaDetailsListStatus, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: r'updated_at');
  static bool _$isRereading(MalMangaDetailsListStatus v) => v.isRereading;
  static const Field<MalMangaDetailsListStatus, bool> _f$isRereading =
      Field('isRereading', _$isRereading, key: r'is_rereading');
  static int _$numVolumesRead(MalMangaDetailsListStatus v) => v.numVolumesRead;
  static const Field<MalMangaDetailsListStatus, int> _f$numVolumesRead =
      Field('numVolumesRead', _$numVolumesRead, key: r'num_volumes_read');
  static int _$numChaptersRead(MalMangaDetailsListStatus v) =>
      v.numChaptersRead;
  static const Field<MalMangaDetailsListStatus, int> _f$numChaptersRead =
      Field('numChaptersRead', _$numChaptersRead, key: r'num_chapters_read');

  @override
  final MappableFields<MalMangaDetailsListStatus> fields = const {
    #status: _f$status,
    #score: _f$score,
    #updatedAt: _f$updatedAt,
    #isRereading: _f$isRereading,
    #numVolumesRead: _f$numVolumesRead,
    #numChaptersRead: _f$numChaptersRead,
  };

  static MalMangaDetailsListStatus _instantiate(DecodingData data) {
    return MalMangaDetailsListStatus(
        status: data.dec(_f$status),
        score: data.dec(_f$score),
        updatedAt: data.dec(_f$updatedAt),
        isRereading: data.dec(_f$isRereading),
        numVolumesRead: data.dec(_f$numVolumesRead),
        numChaptersRead: data.dec(_f$numChaptersRead));
  }

  @override
  final Function instantiate = _instantiate;

  static MalMangaDetailsListStatus fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MalMangaDetailsListStatus>(map);
  }

  static MalMangaDetailsListStatus fromJson(String json) {
    return ensureInitialized().decodeJson<MalMangaDetailsListStatus>(json);
  }
}

mixin MalMangaDetailsListStatusMappable {
  String toJson() {
    return MalMangaDetailsListStatusMapper.ensureInitialized()
        .encodeJson<MalMangaDetailsListStatus>(
            this as MalMangaDetailsListStatus);
  }

  Map<String, dynamic> toMap() {
    return MalMangaDetailsListStatusMapper.ensureInitialized()
        .encodeMap<MalMangaDetailsListStatus>(
            this as MalMangaDetailsListStatus);
  }

  MalMangaDetailsListStatusCopyWith<MalMangaDetailsListStatus,
          MalMangaDetailsListStatus, MalMangaDetailsListStatus>
      get copyWith => _MalMangaDetailsListStatusCopyWithImpl(
          this as MalMangaDetailsListStatus, $identity, $identity);
  @override
  String toString() {
    return MalMangaDetailsListStatusMapper.ensureInitialized()
        .stringifyValue(this as MalMangaDetailsListStatus);
  }

  @override
  bool operator ==(Object other) {
    return MalMangaDetailsListStatusMapper.ensureInitialized()
        .equalsValue(this as MalMangaDetailsListStatus, other);
  }

  @override
  int get hashCode {
    return MalMangaDetailsListStatusMapper.ensureInitialized()
        .hashValue(this as MalMangaDetailsListStatus);
  }
}

extension MalMangaDetailsListStatusValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MalMangaDetailsListStatus, $Out> {
  MalMangaDetailsListStatusCopyWith<$R, MalMangaDetailsListStatus, $Out>
      get $asMalMangaDetailsListStatus => $base
          .as((v, t, t2) => _MalMangaDetailsListStatusCopyWithImpl(v, t, t2));
}

abstract class MalMangaDetailsListStatusCopyWith<
    $R,
    $In extends MalMangaDetailsListStatus,
    $Out> implements MalListStatusCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? status,
      int? score,
      DateTime? updatedAt,
      bool? isRereading,
      int? numVolumesRead,
      int? numChaptersRead});
  MalMangaDetailsListStatusCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MalMangaDetailsListStatusCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MalMangaDetailsListStatus, $Out>
    implements
        MalMangaDetailsListStatusCopyWith<$R, MalMangaDetailsListStatus, $Out> {
  _MalMangaDetailsListStatusCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MalMangaDetailsListStatus> $mapper =
      MalMangaDetailsListStatusMapper.ensureInitialized();
  @override
  $R call(
          {String? status,
          int? score,
          DateTime? updatedAt,
          bool? isRereading,
          int? numVolumesRead,
          int? numChaptersRead}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (score != null) #score: score,
        if (updatedAt != null) #updatedAt: updatedAt,
        if (isRereading != null) #isRereading: isRereading,
        if (numVolumesRead != null) #numVolumesRead: numVolumesRead,
        if (numChaptersRead != null) #numChaptersRead: numChaptersRead
      }));
  @override
  MalMangaDetailsListStatus $make(CopyWithData data) =>
      MalMangaDetailsListStatus(
          status: data.get(#status, or: $value.status),
          score: data.get(#score, or: $value.score),
          updatedAt: data.get(#updatedAt, or: $value.updatedAt),
          isRereading: data.get(#isRereading, or: $value.isRereading),
          numVolumesRead: data.get(#numVolumesRead, or: $value.numVolumesRead),
          numChaptersRead:
              data.get(#numChaptersRead, or: $value.numChaptersRead));

  @override
  MalMangaDetailsListStatusCopyWith<$R2, MalMangaDetailsListStatus, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MalMangaDetailsListStatusCopyWithImpl($value, $cast, t);
}
