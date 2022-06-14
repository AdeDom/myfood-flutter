// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Food food) loadSuccess,
    required TResult Function(BaseError error) loadError,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Food food)? loadSuccess,
    TResult Function(BaseError error)? loadError,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Food food)? loadSuccess,
    TResult Function(BaseError error)? loadError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadError value) loadError,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadError value)? loadError,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadError value)? loadError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodDetailStateCopyWith<$Res> {
  factory $FoodDetailStateCopyWith(
          FoodDetailState value, $Res Function(FoodDetailState) then) =
      _$FoodDetailStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FoodDetailStateCopyWithImpl<$Res>
    implements $FoodDetailStateCopyWith<$Res> {
  _$FoodDetailStateCopyWithImpl(this._value, this._then);

  final FoodDetailState _value;

  // ignore: unused_field
  final $Res Function(FoodDetailState) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res> extends _$FoodDetailStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;
}

/// @nodoc

class _$Initial with DiagnosticableTreeMixin implements Initial {
  const _$Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FoodDetailState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FoodDetailState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Food food) loadSuccess,
    required TResult Function(BaseError error) loadError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Food food)? loadSuccess,
    TResult Function(BaseError error)? loadError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Food food)? loadSuccess,
    TResult Function(BaseError error)? loadError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadError value) loadError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadError value)? loadError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadError value)? loadError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements FoodDetailState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$LoadSuccessCopyWith<$Res> {
  factory _$$LoadSuccessCopyWith(
          _$LoadSuccess value, $Res Function(_$LoadSuccess) then) =
      __$$LoadSuccessCopyWithImpl<$Res>;

  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$LoadSuccessCopyWithImpl<$Res>
    extends _$FoodDetailStateCopyWithImpl<$Res>
    implements _$$LoadSuccessCopyWith<$Res> {
  __$$LoadSuccessCopyWithImpl(
      _$LoadSuccess _value, $Res Function(_$LoadSuccess) _then)
      : super(_value, (v) => _then(v as _$LoadSuccess));

  @override
  _$LoadSuccess get _value => super._value as _$LoadSuccess;

  @override
  $Res call({
    Object? food = freezed,
  }) {
    return _then(_$LoadSuccess(
      food: food == freezed
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
    ));
  }

  @override
  $FoodCopyWith<$Res> get food {
    return $FoodCopyWith<$Res>(_value.food, (value) {
      return _then(_value.copyWith(food: value));
    });
  }
}

/// @nodoc

class _$LoadSuccess with DiagnosticableTreeMixin implements LoadSuccess {
  const _$LoadSuccess({required this.food});

  @override
  final Food food;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FoodDetailState.loadSuccess(food: $food)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FoodDetailState.loadSuccess'))
      ..add(DiagnosticsProperty('food', food));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccess &&
            const DeepCollectionEquality().equals(other.food, food));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(food));

  @JsonKey(ignore: true)
  @override
  _$$LoadSuccessCopyWith<_$LoadSuccess> get copyWith =>
      __$$LoadSuccessCopyWithImpl<_$LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Food food) loadSuccess,
    required TResult Function(BaseError error) loadError,
  }) {
    return loadSuccess(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Food food)? loadSuccess,
    TResult Function(BaseError error)? loadError,
  }) {
    return loadSuccess?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Food food)? loadSuccess,
    TResult Function(BaseError error)? loadError,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadError value) loadError,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadError value)? loadError,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadError value)? loadError,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LoadSuccess implements FoodDetailState {
  const factory LoadSuccess({required final Food food}) = _$LoadSuccess;

  Food get food => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$$LoadSuccessCopyWith<_$LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadErrorCopyWith<$Res> {
  factory _$$LoadErrorCopyWith(
          _$LoadError value, $Res Function(_$LoadError) then) =
      __$$LoadErrorCopyWithImpl<$Res>;

  $Res call({BaseError error});

  $BaseErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$LoadErrorCopyWithImpl<$Res>
    extends _$FoodDetailStateCopyWithImpl<$Res>
    implements _$$LoadErrorCopyWith<$Res> {
  __$$LoadErrorCopyWithImpl(
      _$LoadError _value, $Res Function(_$LoadError) _then)
      : super(_value, (v) => _then(v as _$LoadError));

  @override
  _$LoadError get _value => super._value as _$LoadError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$LoadError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseError,
    ));
  }

  @override
  $BaseErrorCopyWith<$Res> get error {
    return $BaseErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$LoadError with DiagnosticableTreeMixin implements LoadError {
  const _$LoadError({required this.error});

  @override
  final BaseError error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FoodDetailState.loadError(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FoodDetailState.loadError'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$LoadErrorCopyWith<_$LoadError> get copyWith =>
      __$$LoadErrorCopyWithImpl<_$LoadError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Food food) loadSuccess,
    required TResult Function(BaseError error) loadError,
  }) {
    return loadError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Food food)? loadSuccess,
    TResult Function(BaseError error)? loadError,
  }) {
    return loadError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Food food)? loadSuccess,
    TResult Function(BaseError error)? loadError,
    required TResult orElse(),
  }) {
    if (loadError != null) {
      return loadError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadError value) loadError,
  }) {
    return loadError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadError value)? loadError,
  }) {
    return loadError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadError value)? loadError,
    required TResult orElse(),
  }) {
    if (loadError != null) {
      return loadError(this);
    }
    return orElse();
  }
}

abstract class LoadError implements FoodDetailState {
  const factory LoadError({required final BaseError error}) = _$LoadError;

  BaseError get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$$LoadErrorCopyWith<_$LoadError> get copyWith =>
      throw _privateConstructorUsedError;
}
