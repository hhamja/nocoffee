// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoffeeDataModel _$CoffeeDataModelFromJson(Map<String, dynamic> json) {
  return _CoffeeDataModel.fromJson(json);
}

/// @nodoc
mixin _$CoffeeDataModel {
// 데이터 입력 날짜 (key)
  @HiveField(0)
  DateTime get date => throw _privateConstructorUsedError; // 해당일의 총 마신 커피 수
  @HiveField(1)
  String get coffeeCup => throw _privateConstructorUsedError; // 해당일의 총 커피 구입 금액
  @HiveField(2)
  String get coffeeCost => throw _privateConstructorUsedError; // 메모
  @HiveField(3)
  String get memo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoffeeDataModelCopyWith<CoffeeDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeDataModelCopyWith<$Res> {
  factory $CoffeeDataModelCopyWith(
          CoffeeDataModel value, $Res Function(CoffeeDataModel) then) =
      _$CoffeeDataModelCopyWithImpl<$Res, CoffeeDataModel>;
  @useResult
  $Res call(
      {@HiveField(0) DateTime date,
      @HiveField(1) String coffeeCup,
      @HiveField(2) String coffeeCost,
      @HiveField(3) String memo});
}

/// @nodoc
class _$CoffeeDataModelCopyWithImpl<$Res, $Val extends CoffeeDataModel>
    implements $CoffeeDataModelCopyWith<$Res> {
  _$CoffeeDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? coffeeCup = null,
    Object? coffeeCost = null,
    Object? memo = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coffeeCup: null == coffeeCup
          ? _value.coffeeCup
          : coffeeCup // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeCost: null == coffeeCost
          ? _value.coffeeCost
          : coffeeCost // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoffeeDataModelCopyWith<$Res>
    implements $CoffeeDataModelCopyWith<$Res> {
  factory _$$_CoffeeDataModelCopyWith(
          _$_CoffeeDataModel value, $Res Function(_$_CoffeeDataModel) then) =
      __$$_CoffeeDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) DateTime date,
      @HiveField(1) String coffeeCup,
      @HiveField(2) String coffeeCost,
      @HiveField(3) String memo});
}

/// @nodoc
class __$$_CoffeeDataModelCopyWithImpl<$Res>
    extends _$CoffeeDataModelCopyWithImpl<$Res, _$_CoffeeDataModel>
    implements _$$_CoffeeDataModelCopyWith<$Res> {
  __$$_CoffeeDataModelCopyWithImpl(
      _$_CoffeeDataModel _value, $Res Function(_$_CoffeeDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? coffeeCup = null,
    Object? coffeeCost = null,
    Object? memo = null,
  }) {
    return _then(_$_CoffeeDataModel(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coffeeCup: null == coffeeCup
          ? _value.coffeeCup
          : coffeeCup // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeCost: null == coffeeCost
          ? _value.coffeeCost
          : coffeeCost // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoffeeDataModel extends _CoffeeDataModel {
  _$_CoffeeDataModel(
      {@HiveField(0) required this.date,
      @HiveField(1) required this.coffeeCup,
      @HiveField(2) required this.coffeeCost,
      @HiveField(3) required this.memo})
      : super._();

  factory _$_CoffeeDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_CoffeeDataModelFromJson(json);

// 데이터 입력 날짜 (key)
  @override
  @HiveField(0)
  final DateTime date;
// 해당일의 총 마신 커피 수
  @override
  @HiveField(1)
  final String coffeeCup;
// 해당일의 총 커피 구입 금액
  @override
  @HiveField(2)
  final String coffeeCost;
// 메모
  @override
  @HiveField(3)
  final String memo;

  @override
  String toString() {
    return 'CoffeeDataModel(date: $date, coffeeCup: $coffeeCup, coffeeCost: $coffeeCost, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoffeeDataModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.coffeeCup, coffeeCup) ||
                other.coffeeCup == coffeeCup) &&
            (identical(other.coffeeCost, coffeeCost) ||
                other.coffeeCost == coffeeCost) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, coffeeCup, coffeeCost, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoffeeDataModelCopyWith<_$_CoffeeDataModel> get copyWith =>
      __$$_CoffeeDataModelCopyWithImpl<_$_CoffeeDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoffeeDataModelToJson(
      this,
    );
  }
}

abstract class _CoffeeDataModel extends CoffeeDataModel {
  factory _CoffeeDataModel(
      {@HiveField(0) required final DateTime date,
      @HiveField(1) required final String coffeeCup,
      @HiveField(2) required final String coffeeCost,
      @HiveField(3) required final String memo}) = _$_CoffeeDataModel;
  _CoffeeDataModel._() : super._();

  factory _CoffeeDataModel.fromJson(Map<String, dynamic> json) =
      _$_CoffeeDataModel.fromJson;

  @override // 데이터 입력 날짜 (key)
  @HiveField(0)
  DateTime get date;
  @override // 해당일의 총 마신 커피 수
  @HiveField(1)
  String get coffeeCup;
  @override // 해당일의 총 커피 구입 금액
  @HiveField(2)
  String get coffeeCost;
  @override // 메모
  @HiveField(3)
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$_CoffeeDataModelCopyWith<_$_CoffeeDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
