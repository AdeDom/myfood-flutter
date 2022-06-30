// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) {
  return _FoodModel.fromJson(json);
}

/// @nodoc
mixin _$FoodModel {
  String get foodName => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get ratingScoreCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodModelCopyWith<FoodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodModelCopyWith<$Res> {
  factory $FoodModelCopyWith(FoodModel value, $Res Function(FoodModel) then) =
      _$FoodModelCopyWithImpl<$Res>;
  $Res call(
      {String foodName,
      String image,
      double price,
      String description,
      String ratingScoreCount});
}

/// @nodoc
class _$FoodModelCopyWithImpl<$Res> implements $FoodModelCopyWith<$Res> {
  _$FoodModelCopyWithImpl(this._value, this._then);

  final FoodModel _value;
  // ignore: unused_field
  final $Res Function(FoodModel) _then;

  @override
  $Res call({
    Object? foodName = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? ratingScoreCount = freezed,
  }) {
    return _then(_value.copyWith(
      foodName: foodName == freezed
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ratingScoreCount: ratingScoreCount == freezed
          ? _value.ratingScoreCount
          : ratingScoreCount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FoodModelCopyWith<$Res> implements $FoodModelCopyWith<$Res> {
  factory _$$_FoodModelCopyWith(
          _$_FoodModel value, $Res Function(_$_FoodModel) then) =
      __$$_FoodModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String foodName,
      String image,
      double price,
      String description,
      String ratingScoreCount});
}

/// @nodoc
class __$$_FoodModelCopyWithImpl<$Res> extends _$FoodModelCopyWithImpl<$Res>
    implements _$$_FoodModelCopyWith<$Res> {
  __$$_FoodModelCopyWithImpl(
      _$_FoodModel _value, $Res Function(_$_FoodModel) _then)
      : super(_value, (v) => _then(v as _$_FoodModel));

  @override
  _$_FoodModel get _value => super._value as _$_FoodModel;

  @override
  $Res call({
    Object? foodName = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? ratingScoreCount = freezed,
  }) {
    return _then(_$_FoodModel(
      foodName: foodName == freezed
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ratingScoreCount: ratingScoreCount == freezed
          ? _value.ratingScoreCount
          : ratingScoreCount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FoodModel implements _FoodModel {
  const _$_FoodModel(
      {required this.foodName,
      required this.image,
      required this.price,
      required this.description,
      required this.ratingScoreCount});

  factory _$_FoodModel.fromJson(Map<String, dynamic> json) =>
      _$$_FoodModelFromJson(json);

  @override
  final String foodName;
  @override
  final String image;
  @override
  final double price;
  @override
  final String description;
  @override
  final String ratingScoreCount;

  @override
  String toString() {
    return 'FoodModel(foodName: $foodName, image: $image, price: $price, description: $description, ratingScoreCount: $ratingScoreCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodModel &&
            const DeepCollectionEquality().equals(other.foodName, foodName) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.ratingScoreCount, ratingScoreCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(foodName),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(ratingScoreCount));

  @JsonKey(ignore: true)
  @override
  _$$_FoodModelCopyWith<_$_FoodModel> get copyWith =>
      __$$_FoodModelCopyWithImpl<_$_FoodModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodModelToJson(this);
  }
}

abstract class _FoodModel implements FoodModel {
  const factory _FoodModel(
      {required final String foodName,
      required final String image,
      required final double price,
      required final String description,
      required final String ratingScoreCount}) = _$_FoodModel;

  factory _FoodModel.fromJson(Map<String, dynamic> json) =
      _$_FoodModel.fromJson;

  @override
  String get foodName => throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  double get price => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get ratingScoreCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FoodModelCopyWith<_$_FoodModel> get copyWith =>
      throw _privateConstructorUsedError;
}
