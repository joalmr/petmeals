// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attentions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AttentionsModel _$AttentionsModelFromJson(Map<String, dynamic> json) {
  return _AttentionsModel.fromJson(json);
}

/// @nodoc
mixin _$AttentionsModel {
  DateTime? get date => throw _privateConstructorUsedError;
  String? get product => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  int? get nextDate => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttentionsModelCopyWith<AttentionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttentionsModelCopyWith<$Res> {
  factory $AttentionsModelCopyWith(
          AttentionsModel value, $Res Function(AttentionsModel) then) =
      _$AttentionsModelCopyWithImpl<$Res, AttentionsModel>;
  @useResult
  $Res call(
      {DateTime? date,
      String? product,
      String? type,
      int? nextDate,
      String? id});
}

/// @nodoc
class _$AttentionsModelCopyWithImpl<$Res, $Val extends AttentionsModel>
    implements $AttentionsModelCopyWith<$Res> {
  _$AttentionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? product = freezed,
    Object? type = freezed,
    Object? nextDate = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      nextDate: freezed == nextDate
          ? _value.nextDate
          : nextDate // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttentionsModelImplCopyWith<$Res>
    implements $AttentionsModelCopyWith<$Res> {
  factory _$$AttentionsModelImplCopyWith(_$AttentionsModelImpl value,
          $Res Function(_$AttentionsModelImpl) then) =
      __$$AttentionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? date,
      String? product,
      String? type,
      int? nextDate,
      String? id});
}

/// @nodoc
class __$$AttentionsModelImplCopyWithImpl<$Res>
    extends _$AttentionsModelCopyWithImpl<$Res, _$AttentionsModelImpl>
    implements _$$AttentionsModelImplCopyWith<$Res> {
  __$$AttentionsModelImplCopyWithImpl(
      _$AttentionsModelImpl _value, $Res Function(_$AttentionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? product = freezed,
    Object? type = freezed,
    Object? nextDate = freezed,
    Object? id = freezed,
  }) {
    return _then(_$AttentionsModelImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      nextDate: freezed == nextDate
          ? _value.nextDate
          : nextDate // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttentionsModelImpl implements _AttentionsModel {
  _$AttentionsModelImpl(
      {this.date, this.product, this.type, this.nextDate, this.id});

  factory _$AttentionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttentionsModelImplFromJson(json);

  @override
  final DateTime? date;
  @override
  final String? product;
  @override
  final String? type;
  @override
  final int? nextDate;
  @override
  final String? id;

  @override
  String toString() {
    return 'AttentionsModel(date: $date, product: $product, type: $type, nextDate: $nextDate, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttentionsModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.nextDate, nextDate) ||
                other.nextDate == nextDate) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, product, type, nextDate, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttentionsModelImplCopyWith<_$AttentionsModelImpl> get copyWith =>
      __$$AttentionsModelImplCopyWithImpl<_$AttentionsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttentionsModelImplToJson(
      this,
    );
  }
}

abstract class _AttentionsModel implements AttentionsModel {
  factory _AttentionsModel(
      {final DateTime? date,
      final String? product,
      final String? type,
      final int? nextDate,
      final String? id}) = _$AttentionsModelImpl;

  factory _AttentionsModel.fromJson(Map<String, dynamic> json) =
      _$AttentionsModelImpl.fromJson;

  @override
  DateTime? get date;
  @override
  String? get product;
  @override
  String? get type;
  @override
  int? get nextDate;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$AttentionsModelImplCopyWith<_$AttentionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
