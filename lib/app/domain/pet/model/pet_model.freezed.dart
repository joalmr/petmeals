// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PetModel _$PetModelFromJson(Map<String, dynamic> json) {
  return _PetModel.fromJson(json);
}

/// @nodoc
mixin _$PetModel {
  String? get name => throw _privateConstructorUsedError;
  Specie? get specie => throw _privateConstructorUsedError;
  DateTime? get borndate => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  bool? get sex => throw _privateConstructorUsedError;
  bool? get sterillized => throw _privateConstructorUsedError;
  List<String>? get userId => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetModelCopyWith<PetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetModelCopyWith<$Res> {
  factory $PetModelCopyWith(PetModel value, $Res Function(PetModel) then) =
      _$PetModelCopyWithImpl<$Res, PetModel>;
  @useResult
  $Res call(
      {String? name,
      Specie? specie,
      DateTime? borndate,
      String? id,
      String? photo,
      bool? sex,
      bool? sterillized,
      List<String>? userId,
      int? age});

  $SpecieCopyWith<$Res>? get specie;
}

/// @nodoc
class _$PetModelCopyWithImpl<$Res, $Val extends PetModel>
    implements $PetModelCopyWith<$Res> {
  _$PetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? specie = freezed,
    Object? borndate = freezed,
    Object? id = freezed,
    Object? photo = freezed,
    Object? sex = freezed,
    Object? sterillized = freezed,
    Object? userId = freezed,
    Object? age = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      specie: freezed == specie
          ? _value.specie
          : specie // ignore: cast_nullable_to_non_nullable
              as Specie?,
      borndate: freezed == borndate
          ? _value.borndate
          : borndate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as bool?,
      sterillized: freezed == sterillized
          ? _value.sterillized
          : sterillized // ignore: cast_nullable_to_non_nullable
              as bool?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpecieCopyWith<$Res>? get specie {
    if (_value.specie == null) {
      return null;
    }

    return $SpecieCopyWith<$Res>(_value.specie!, (value) {
      return _then(_value.copyWith(specie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PetModelImplCopyWith<$Res>
    implements $PetModelCopyWith<$Res> {
  factory _$$PetModelImplCopyWith(
          _$PetModelImpl value, $Res Function(_$PetModelImpl) then) =
      __$$PetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      Specie? specie,
      DateTime? borndate,
      String? id,
      String? photo,
      bool? sex,
      bool? sterillized,
      List<String>? userId,
      int? age});

  @override
  $SpecieCopyWith<$Res>? get specie;
}

/// @nodoc
class __$$PetModelImplCopyWithImpl<$Res>
    extends _$PetModelCopyWithImpl<$Res, _$PetModelImpl>
    implements _$$PetModelImplCopyWith<$Res> {
  __$$PetModelImplCopyWithImpl(
      _$PetModelImpl _value, $Res Function(_$PetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? specie = freezed,
    Object? borndate = freezed,
    Object? id = freezed,
    Object? photo = freezed,
    Object? sex = freezed,
    Object? sterillized = freezed,
    Object? userId = freezed,
    Object? age = freezed,
  }) {
    return _then(_$PetModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      specie: freezed == specie
          ? _value.specie
          : specie // ignore: cast_nullable_to_non_nullable
              as Specie?,
      borndate: freezed == borndate
          ? _value.borndate
          : borndate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as bool?,
      sterillized: freezed == sterillized
          ? _value.sterillized
          : sterillized // ignore: cast_nullable_to_non_nullable
              as bool?,
      userId: freezed == userId
          ? _value._userId
          : userId // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetModelImpl with DiagnosticableTreeMixin implements _PetModel {
  _$PetModelImpl(
      {this.name,
      this.specie,
      this.borndate,
      this.id,
      this.photo,
      this.sex,
      this.sterillized,
      final List<String>? userId,
      this.age})
      : _userId = userId;

  factory _$PetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetModelImplFromJson(json);

  @override
  final String? name;
  @override
  final Specie? specie;
  @override
  final DateTime? borndate;
  @override
  final String? id;
  @override
  final String? photo;
  @override
  final bool? sex;
  @override
  final bool? sterillized;
  final List<String>? _userId;
  @override
  List<String>? get userId {
    final value = _userId;
    if (value == null) return null;
    if (_userId is EqualUnmodifiableListView) return _userId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? age;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PetModel(name: $name, specie: $specie, borndate: $borndate, id: $id, photo: $photo, sex: $sex, sterillized: $sterillized, userId: $userId, age: $age)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PetModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('specie', specie))
      ..add(DiagnosticsProperty('borndate', borndate))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('photo', photo))
      ..add(DiagnosticsProperty('sex', sex))
      ..add(DiagnosticsProperty('sterillized', sterillized))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('age', age));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specie, specie) || other.specie == specie) &&
            (identical(other.borndate, borndate) ||
                other.borndate == borndate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.sterillized, sterillized) ||
                other.sterillized == sterillized) &&
            const DeepCollectionEquality().equals(other._userId, _userId) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      specie,
      borndate,
      id,
      photo,
      sex,
      sterillized,
      const DeepCollectionEquality().hash(_userId),
      age);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetModelImplCopyWith<_$PetModelImpl> get copyWith =>
      __$$PetModelImplCopyWithImpl<_$PetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetModelImplToJson(
      this,
    );
  }
}

abstract class _PetModel implements PetModel {
  factory _PetModel(
      {final String? name,
      final Specie? specie,
      final DateTime? borndate,
      final String? id,
      final String? photo,
      final bool? sex,
      final bool? sterillized,
      final List<String>? userId,
      final int? age}) = _$PetModelImpl;

  factory _PetModel.fromJson(Map<String, dynamic> json) =
      _$PetModelImpl.fromJson;

  @override
  String? get name;
  @override
  Specie? get specie;
  @override
  DateTime? get borndate;
  @override
  String? get id;
  @override
  String? get photo;
  @override
  bool? get sex;
  @override
  bool? get sterillized;
  @override
  List<String>? get userId;
  @override
  int? get age;
  @override
  @JsonKey(ignore: true)
  _$$PetModelImplCopyWith<_$PetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
