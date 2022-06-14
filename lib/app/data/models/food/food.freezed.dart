// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Food _$FoodFromJson(Map<String, dynamic> json) {
  return _Food.fromJson(json);
}

/// @nodoc
mixin _$Food {
  @JsonKey(name: "foodId")
  int? get foodId => throw _privateConstructorUsedError;
  @JsonKey(name: "foodName")
  String? get foodName => throw _privateConstructorUsedError;
  @JsonKey(name: "alias")
  String? get alias => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "favorite")
  int? get favorite => throw _privateConstructorUsedError;
  @JsonKey(name: "ratingScore")
  double? get ratingScore => throw _privateConstructorUsedError;
  @JsonKey(name: "ratingScoreCount")
  String? get ratingScoreCount => throw _privateConstructorUsedError;
  @JsonKey(name: "categoryId")
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "created")
  String? get created => throw _privateConstructorUsedError;
  @JsonKey(name: "updated")
  String? get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "foodId") int? foodId,
      @JsonKey(name: "foodName") String? foodName,
      @JsonKey(name: "alias") String? alias,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "price") double? price,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "favorite") int? favorite,
      @JsonKey(name: "ratingScore") double? ratingScore,
      @JsonKey(name: "ratingScoreCount") String? ratingScoreCount,
      @JsonKey(name: "categoryId") int? categoryId,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "created") String? created,
      @JsonKey(name: "updated") String? updated});
}

/// @nodoc
class _$FoodCopyWithImpl<$Res> implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  final Food _value;
  // ignore: unused_field
  final $Res Function(Food) _then;

  @override
  $Res call({
    Object? foodId = freezed,
    Object? foodName = freezed,
    Object? alias = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? favorite = freezed,
    Object? ratingScore = freezed,
    Object? ratingScoreCount = freezed,
    Object? categoryId = freezed,
    Object? status = freezed,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      foodId: foodId == freezed
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as int?,
      foodName: foodName == freezed
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: alias == freezed
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      favorite: favorite == freezed
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingScore: ratingScore == freezed
          ? _value.ratingScore
          : ratingScore // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingScoreCount: ratingScoreCount == freezed
          ? _value.ratingScoreCount
          : ratingScoreCount // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$$_FoodCopyWith(_$_Food value, $Res Function(_$_Food) then) =
      __$$_FoodCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "foodId") int? foodId,
      @JsonKey(name: "foodName") String? foodName,
      @JsonKey(name: "alias") String? alias,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "price") double? price,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "favorite") int? favorite,
      @JsonKey(name: "ratingScore") double? ratingScore,
      @JsonKey(name: "ratingScoreCount") String? ratingScoreCount,
      @JsonKey(name: "categoryId") int? categoryId,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "created") String? created,
      @JsonKey(name: "updated") String? updated});
}

/// @nodoc
class __$$_FoodCopyWithImpl<$Res> extends _$FoodCopyWithImpl<$Res>
    implements _$$_FoodCopyWith<$Res> {
  __$$_FoodCopyWithImpl(_$_Food _value, $Res Function(_$_Food) _then)
      : super(_value, (v) => _then(v as _$_Food));

  @override
  _$_Food get _value => super._value as _$_Food;

  @override
  $Res call({
    Object? foodId = freezed,
    Object? foodName = freezed,
    Object? alias = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? favorite = freezed,
    Object? ratingScore = freezed,
    Object? ratingScoreCount = freezed,
    Object? categoryId = freezed,
    Object? status = freezed,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_$_Food(
      foodId: foodId == freezed
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as int?,
      foodName: foodName == freezed
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: alias == freezed
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      favorite: favorite == freezed
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingScore: ratingScore == freezed
          ? _value.ratingScore
          : ratingScore // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingScoreCount: ratingScoreCount == freezed
          ? _value.ratingScoreCount
          : ratingScoreCount // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Food with DiagnosticableTreeMixin implements _Food {
  const _$_Food(
      {@JsonKey(name: "foodId") this.foodId,
      @JsonKey(name: "foodName") this.foodName,
      @JsonKey(name: "alias") this.alias,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "favorite") this.favorite,
      @JsonKey(name: "ratingScore") this.ratingScore,
      @JsonKey(name: "ratingScoreCount") this.ratingScoreCount,
      @JsonKey(name: "categoryId") this.categoryId,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "created") this.created,
      @JsonKey(name: "updated") this.updated});

  factory _$_Food.fromJson(Map<String, dynamic> json) => _$$_FoodFromJson(json);

  @override
  @JsonKey(name: "foodId")
  final int? foodId;
  @override
  @JsonKey(name: "foodName")
  final String? foodName;
  @override
  @JsonKey(name: "alias")
  final String? alias;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "price")
  final double? price;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "favorite")
  final int? favorite;
  @override
  @JsonKey(name: "ratingScore")
  final double? ratingScore;
  @override
  @JsonKey(name: "ratingScoreCount")
  final String? ratingScoreCount;
  @override
  @JsonKey(name: "categoryId")
  final int? categoryId;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "created")
  final String? created;
  @override
  @JsonKey(name: "updated")
  final String? updated;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Food(foodId: $foodId, foodName: $foodName, alias: $alias, image: $image, price: $price, description: $description, favorite: $favorite, ratingScore: $ratingScore, ratingScoreCount: $ratingScoreCount, categoryId: $categoryId, status: $status, created: $created, updated: $updated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Food'))
      ..add(DiagnosticsProperty('foodId', foodId))
      ..add(DiagnosticsProperty('foodName', foodName))
      ..add(DiagnosticsProperty('alias', alias))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('favorite', favorite))
      ..add(DiagnosticsProperty('ratingScore', ratingScore))
      ..add(DiagnosticsProperty('ratingScoreCount', ratingScoreCount))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('updated', updated));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Food &&
            const DeepCollectionEquality().equals(other.foodId, foodId) &&
            const DeepCollectionEquality().equals(other.foodName, foodName) &&
            const DeepCollectionEquality().equals(other.alias, alias) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.favorite, favorite) &&
            const DeepCollectionEquality()
                .equals(other.ratingScore, ratingScore) &&
            const DeepCollectionEquality()
                .equals(other.ratingScoreCount, ratingScoreCount) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.updated, updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(foodId),
      const DeepCollectionEquality().hash(foodName),
      const DeepCollectionEquality().hash(alias),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(favorite),
      const DeepCollectionEquality().hash(ratingScore),
      const DeepCollectionEquality().hash(ratingScoreCount),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(updated));

  @JsonKey(ignore: true)
  @override
  _$$_FoodCopyWith<_$_Food> get copyWith =>
      __$$_FoodCopyWithImpl<_$_Food>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodToJson(this);
  }
}

abstract class _Food implements Food {
  const factory _Food(
      {@JsonKey(name: "foodId") final int? foodId,
      @JsonKey(name: "foodName") final String? foodName,
      @JsonKey(name: "alias") final String? alias,
      @JsonKey(name: "image") final String? image,
      @JsonKey(name: "price") final double? price,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "favorite") final int? favorite,
      @JsonKey(name: "ratingScore") final double? ratingScore,
      @JsonKey(name: "ratingScoreCount") final String? ratingScoreCount,
      @JsonKey(name: "categoryId") final int? categoryId,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "created") final String? created,
      @JsonKey(name: "updated") final String? updated}) = _$_Food;

  factory _Food.fromJson(Map<String, dynamic> json) = _$_Food.fromJson;

  @override
  @JsonKey(name: "foodId")
  int? get foodId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "foodName")
  String? get foodName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "alias")
  String? get alias => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "price")
  double? get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "favorite")
  int? get favorite => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "ratingScore")
  double? get ratingScore => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "ratingScoreCount")
  String? get ratingScoreCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "categoryId")
  int? get categoryId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "created")
  String? get created => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "updated")
  String? get updated => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FoodCopyWith<_$_Food> get copyWith => throw _privateConstructorUsedError;
}
