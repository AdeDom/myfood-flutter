// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @JsonKey(name: "categoryId")
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "categoryName")
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "categoryTypeName")
  String? get categoryTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: "created")
  String? get created => throw _privateConstructorUsedError;
  @JsonKey(name: "updated")
  String? get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "categoryId") int? categoryId,
      @JsonKey(name: "categoryName") String? categoryName,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "categoryTypeName") String? categoryTypeName,
      @JsonKey(name: "created") String? created,
      @JsonKey(name: "updated") String? updated});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  final Category _value;
  // ignore: unused_field
  final $Res Function(Category) _then;

  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? image = freezed,
    Object? categoryTypeName = freezed,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryTypeName: categoryTypeName == freezed
          ? _value.categoryTypeName
          : categoryTypeName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "categoryId") int? categoryId,
      @JsonKey(name: "categoryName") String? categoryName,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "categoryTypeName") String? categoryTypeName,
      @JsonKey(name: "created") String? created,
      @JsonKey(name: "updated") String? updated});
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, (v) => _then(v as _$_Category));

  @override
  _$_Category get _value => super._value as _$_Category;

  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? image = freezed,
    Object? categoryTypeName = freezed,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_$_Category(
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryTypeName: categoryTypeName == freezed
          ? _value.categoryTypeName
          : categoryTypeName // ignore: cast_nullable_to_non_nullable
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
class _$_Category with DiagnosticableTreeMixin implements _Category {
  const _$_Category(
      {@JsonKey(name: "categoryId") this.categoryId,
      @JsonKey(name: "categoryName") this.categoryName,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "categoryTypeName") this.categoryTypeName,
      @JsonKey(name: "created") this.created,
      @JsonKey(name: "updated") this.updated});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  @JsonKey(name: "categoryId")
  final int? categoryId;
  @override
  @JsonKey(name: "categoryName")
  final String? categoryName;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "categoryTypeName")
  final String? categoryTypeName;
  @override
  @JsonKey(name: "created")
  final String? created;
  @override
  @JsonKey(name: "updated")
  final String? updated;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Category(categoryId: $categoryId, categoryName: $categoryName, image: $image, categoryTypeName: $categoryTypeName, created: $created, updated: $updated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Category'))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('categoryName', categoryName))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('categoryTypeName', categoryTypeName))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('updated', updated));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.categoryTypeName, categoryTypeName) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.updated, updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(categoryName),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(categoryTypeName),
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(updated));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(this);
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {@JsonKey(name: "categoryId") final int? categoryId,
      @JsonKey(name: "categoryName") final String? categoryName,
      @JsonKey(name: "image") final String? image,
      @JsonKey(name: "categoryTypeName") final String? categoryTypeName,
      @JsonKey(name: "created") final String? created,
      @JsonKey(name: "updated") final String? updated}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  @JsonKey(name: "categoryId")
  int? get categoryId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "categoryName")
  String? get categoryName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "categoryTypeName")
  String? get categoryTypeName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "created")
  String? get created => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "updated")
  String? get updated => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}
