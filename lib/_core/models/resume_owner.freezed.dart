// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'resume_owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ResumeOwner _$ResumeOwnerFromJson(Map<String, dynamic> json) {
  return _ResumeOwner.fromJson(json);
}

/// @nodoc
class _$ResumeOwnerTearOff {
  const _$ResumeOwnerTearOff();

// ignore: unused_element
  _ResumeOwner call(
      {@required String name,
      @required String from,
      @required String searchingJobs,
      @required String subtitle,
      @required List<String> create,
      @required List<String> like}) {
    return _ResumeOwner(
      name: name,
      from: from,
      searchingJobs: searchingJobs,
      subtitle: subtitle,
      create: create,
      like: like,
    );
  }

// ignore: unused_element
  ResumeOwner fromJson(Map<String, Object> json) {
    return ResumeOwner.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ResumeOwner = _$ResumeOwnerTearOff();

/// @nodoc
mixin _$ResumeOwner {
  String get name;
  String get from;
  String get searchingJobs;
  String get subtitle;
  List<String> get create;
  List<String> get like;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ResumeOwnerCopyWith<ResumeOwner> get copyWith;
}

/// @nodoc
abstract class $ResumeOwnerCopyWith<$Res> {
  factory $ResumeOwnerCopyWith(
          ResumeOwner value, $Res Function(ResumeOwner) then) =
      _$ResumeOwnerCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String from,
      String searchingJobs,
      String subtitle,
      List<String> create,
      List<String> like});
}

/// @nodoc
class _$ResumeOwnerCopyWithImpl<$Res> implements $ResumeOwnerCopyWith<$Res> {
  _$ResumeOwnerCopyWithImpl(this._value, this._then);

  final ResumeOwner _value;
  // ignore: unused_field
  final $Res Function(ResumeOwner) _then;

  @override
  $Res call({
    Object name = freezed,
    Object from = freezed,
    Object searchingJobs = freezed,
    Object subtitle = freezed,
    Object create = freezed,
    Object like = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      from: from == freezed ? _value.from : from as String,
      searchingJobs: searchingJobs == freezed
          ? _value.searchingJobs
          : searchingJobs as String,
      subtitle: subtitle == freezed ? _value.subtitle : subtitle as String,
      create: create == freezed ? _value.create : create as List<String>,
      like: like == freezed ? _value.like : like as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$ResumeOwnerCopyWith<$Res>
    implements $ResumeOwnerCopyWith<$Res> {
  factory _$ResumeOwnerCopyWith(
          _ResumeOwner value, $Res Function(_ResumeOwner) then) =
      __$ResumeOwnerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String from,
      String searchingJobs,
      String subtitle,
      List<String> create,
      List<String> like});
}

/// @nodoc
class __$ResumeOwnerCopyWithImpl<$Res> extends _$ResumeOwnerCopyWithImpl<$Res>
    implements _$ResumeOwnerCopyWith<$Res> {
  __$ResumeOwnerCopyWithImpl(
      _ResumeOwner _value, $Res Function(_ResumeOwner) _then)
      : super(_value, (v) => _then(v as _ResumeOwner));

  @override
  _ResumeOwner get _value => super._value as _ResumeOwner;

  @override
  $Res call({
    Object name = freezed,
    Object from = freezed,
    Object searchingJobs = freezed,
    Object subtitle = freezed,
    Object create = freezed,
    Object like = freezed,
  }) {
    return _then(_ResumeOwner(
      name: name == freezed ? _value.name : name as String,
      from: from == freezed ? _value.from : from as String,
      searchingJobs: searchingJobs == freezed
          ? _value.searchingJobs
          : searchingJobs as String,
      subtitle: subtitle == freezed ? _value.subtitle : subtitle as String,
      create: create == freezed ? _value.create : create as List<String>,
      like: like == freezed ? _value.like : like as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ResumeOwner with DiagnosticableTreeMixin implements _ResumeOwner {
  const _$_ResumeOwner(
      {@required this.name,
      @required this.from,
      @required this.searchingJobs,
      @required this.subtitle,
      @required this.create,
      @required this.like})
      : assert(name != null),
        assert(from != null),
        assert(searchingJobs != null),
        assert(subtitle != null),
        assert(create != null),
        assert(like != null);

  factory _$_ResumeOwner.fromJson(Map<String, dynamic> json) =>
      _$_$_ResumeOwnerFromJson(json);

  @override
  final String name;
  @override
  final String from;
  @override
  final String searchingJobs;
  @override
  final String subtitle;
  @override
  final List<String> create;
  @override
  final List<String> like;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResumeOwner(name: $name, from: $from, searchingJobs: $searchingJobs, subtitle: $subtitle, create: $create, like: $like)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResumeOwner'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('searchingJobs', searchingJobs))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('create', create))
      ..add(DiagnosticsProperty('like', like));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResumeOwner &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.searchingJobs, searchingJobs) ||
                const DeepCollectionEquality()
                    .equals(other.searchingJobs, searchingJobs)) &&
            (identical(other.subtitle, subtitle) ||
                const DeepCollectionEquality()
                    .equals(other.subtitle, subtitle)) &&
            (identical(other.create, create) ||
                const DeepCollectionEquality().equals(other.create, create)) &&
            (identical(other.like, like) ||
                const DeepCollectionEquality().equals(other.like, like)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(searchingJobs) ^
      const DeepCollectionEquality().hash(subtitle) ^
      const DeepCollectionEquality().hash(create) ^
      const DeepCollectionEquality().hash(like);

  @JsonKey(ignore: true)
  @override
  _$ResumeOwnerCopyWith<_ResumeOwner> get copyWith =>
      __$ResumeOwnerCopyWithImpl<_ResumeOwner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ResumeOwnerToJson(this);
  }
}

abstract class _ResumeOwner implements ResumeOwner {
  const factory _ResumeOwner(
      {@required String name,
      @required String from,
      @required String searchingJobs,
      @required String subtitle,
      @required List<String> create,
      @required List<String> like}) = _$_ResumeOwner;

  factory _ResumeOwner.fromJson(Map<String, dynamic> json) =
      _$_ResumeOwner.fromJson;

  @override
  String get name;
  @override
  String get from;
  @override
  String get searchingJobs;
  @override
  String get subtitle;
  @override
  List<String> get create;
  @override
  List<String> get like;
  @override
  @JsonKey(ignore: true)
  _$ResumeOwnerCopyWith<_ResumeOwner> get copyWith;
}
