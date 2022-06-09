// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'welcome_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WelcomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isLanguageEn) changeLanguage,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isLanguageEn)? changeLanguage,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isLanguageEn)? changeLanguage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ChangeLanguage value) changeLanguage,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChangeLanguage value)? changeLanguage,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChangeLanguage value)? changeLanguage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WelcomeStateCopyWith<$Res> {
  factory $WelcomeStateCopyWith(
          WelcomeState value, $Res Function(WelcomeState) then) =
      _$WelcomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WelcomeStateCopyWithImpl<$Res> implements $WelcomeStateCopyWith<$Res> {
  _$WelcomeStateCopyWithImpl(this._value, this._then);

  final WelcomeState _value;

  // ignore: unused_field
  final $Res Function(WelcomeState) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res> extends _$WelcomeStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'WelcomeState.initial()';
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
    required TResult Function(bool isLanguageEn) changeLanguage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isLanguageEn)? changeLanguage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isLanguageEn)? changeLanguage,
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
    required TResult Function(ChangeLanguage value) changeLanguage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChangeLanguage value)? changeLanguage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChangeLanguage value)? changeLanguage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements WelcomeState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$ChangeLanguageCopyWith<$Res> {
  factory _$$ChangeLanguageCopyWith(
          _$ChangeLanguage value, $Res Function(_$ChangeLanguage) then) =
      __$$ChangeLanguageCopyWithImpl<$Res>;

  $Res call({bool isLanguageEn});
}

/// @nodoc
class __$$ChangeLanguageCopyWithImpl<$Res>
    extends _$WelcomeStateCopyWithImpl<$Res>
    implements _$$ChangeLanguageCopyWith<$Res> {
  __$$ChangeLanguageCopyWithImpl(
      _$ChangeLanguage _value, $Res Function(_$ChangeLanguage) _then)
      : super(_value, (v) => _then(v as _$ChangeLanguage));

  @override
  _$ChangeLanguage get _value => super._value as _$ChangeLanguage;

  @override
  $Res call({
    Object? isLanguageEn = freezed,
  }) {
    return _then(_$ChangeLanguage(
      isLanguageEn: isLanguageEn == freezed
          ? _value.isLanguageEn
          : isLanguageEn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeLanguage implements ChangeLanguage {
  const _$ChangeLanguage({required this.isLanguageEn});

  @override
  final bool isLanguageEn;

  @override
  String toString() {
    return 'WelcomeState.changeLanguage(isLanguageEn: $isLanguageEn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLanguage &&
            const DeepCollectionEquality()
                .equals(other.isLanguageEn, isLanguageEn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isLanguageEn));

  @JsonKey(ignore: true)
  @override
  _$$ChangeLanguageCopyWith<_$ChangeLanguage> get copyWith =>
      __$$ChangeLanguageCopyWithImpl<_$ChangeLanguage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isLanguageEn) changeLanguage,
  }) {
    return changeLanguage(isLanguageEn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isLanguageEn)? changeLanguage,
  }) {
    return changeLanguage?.call(isLanguageEn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isLanguageEn)? changeLanguage,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(isLanguageEn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ChangeLanguage value) changeLanguage,
  }) {
    return changeLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChangeLanguage value)? changeLanguage,
  }) {
    return changeLanguage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChangeLanguage value)? changeLanguage,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(this);
    }
    return orElse();
  }
}

abstract class ChangeLanguage implements WelcomeState {
  const factory ChangeLanguage({required final bool isLanguageEn}) =
      _$ChangeLanguage;

  bool get isLanguageEn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$$ChangeLanguageCopyWith<_$ChangeLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}
