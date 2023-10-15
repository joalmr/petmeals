// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Specie _$SpecieFromJson(Map<String, dynamic> json) {
  return _Specie.fromJson(json);
}

/// @nodoc
mixin _$Specie {
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecieCopyWith<Specie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecieCopyWith<$Res> {
  factory $SpecieCopyWith(Specie value, $Res Function(Specie) then) =
      _$SpecieCopyWithImpl<$Res, Specie>;
  @useResult
  $Res call({String? name, String? id});
}

/// @nodoc
class _$SpecieCopyWithImpl<$Res, $Val extends Specie>
    implements $SpecieCopyWith<$Res> {
  _$SpecieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecieImplCopyWith<$Res> implements $SpecieCopyWith<$Res> {
  factory _$$SpecieImplCopyWith(
          _$SpecieImpl value, $Res Function(_$SpecieImpl) then) =
      __$$SpecieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? id});
}

/// @nodoc
class __$$SpecieImplCopyWithImpl<$Res>
    extends _$SpecieCopyWithImpl<$Res, _$SpecieImpl>
    implements _$$SpecieImplCopyWith<$Res> {
  __$$SpecieImplCopyWithImpl(
      _$SpecieImpl _value, $Res Function(_$SpecieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_$SpecieImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecieImpl with DiagnosticableTreeMixin implements _Specie {
  _$SpecieImpl({this.name, this.id});

  factory _$SpecieImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecieImplFromJson(json);

  @override
  String? name;
  @override
  String? id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Specie(name: $name, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Specie'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('id', id));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecieImplCopyWith<_$SpecieImpl> get copyWith =>
      __$$SpecieImplCopyWithImpl<_$SpecieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecieImplToJson(
      this,
    );
  }
}

abstract class _Specie implements Specie {
  factory _Specie({String? name, String? id}) = _$SpecieImpl;

  factory _Specie.fromJson(Map<String, dynamic> json) = _$SpecieImpl.fromJson;

  @override
  String? get name;
  set name(String? value);
  @override
  String? get id;
  set id(String? value);
  @override
  @JsonKey(ignore: true)
  _$$SpecieImplCopyWith<_$SpecieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
