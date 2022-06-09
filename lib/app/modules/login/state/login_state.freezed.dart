// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  bool get isLoginButtonStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoginButtonStatus) initial,
    required TResult Function(
            bool isLoginButtonStatus, String? email, String? password)
        loading,
    required TResult Function(BaseError error, bool isLoginButtonStatus,
            String? email, String? password)
        loginError,
    required TResult Function(
            bool isLoginButtonStatus, String? email, String? password)
        currentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoginButtonStatus)? initial,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        loading,
    TResult Function(BaseError error, bool isLoginButtonStatus, String? email,
            String? password)?
        loginError,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        currentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoginButtonStatus)? initial,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        loading,
    TResult Function(BaseError error, bool isLoginButtonStatus, String? email,
            String? password)?
        loginError,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        currentPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(LoginError value) loginError,
    required TResult Function(CurrentPage value) currentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(LoginError value)? loginError,
    TResult Function(CurrentPage value)? currentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(LoginError value)? loginError,
    TResult Function(CurrentPage value)? currentPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call({bool isLoginButtonStatus});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? isLoginButtonStatus = freezed,
  }) {
    return _then(_value.copyWith(
      isLoginButtonStatus: isLoginButtonStatus == freezed
          ? _value.isLoginButtonStatus
          : isLoginButtonStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoginButtonStatus});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;

  @override
  $Res call({
    Object? isLoginButtonStatus = freezed,
  }) {
    return _then(_$Initial(
      isLoginButtonStatus: isLoginButtonStatus == freezed
          ? _value.isLoginButtonStatus
          : isLoginButtonStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial({required this.isLoginButtonStatus});

  @override
  final bool isLoginButtonStatus;

  @override
  String toString() {
    return 'LoginState.initial(isLoginButtonStatus: $isLoginButtonStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            const DeepCollectionEquality()
                .equals(other.isLoginButtonStatus, isLoginButtonStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isLoginButtonStatus));

  @JsonKey(ignore: true)
  @override
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoginButtonStatus) initial,
    required TResult Function(
            bool isLoginButtonStatus, String? email, String? password)
        loading,
    required TResult Function(BaseError error, bool isLoginButtonStatus,
            String? email, String? password)
        loginError,
    required TResult Function(
            bool isLoginButtonStatus, String? email, String? password)
        currentPage,
  }) {
    return initial(isLoginButtonStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoginButtonStatus)? initial,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        loading,
    TResult Function(BaseError error, bool isLoginButtonStatus, String? email,
            String? password)?
        loginError,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        currentPage,
  }) {
    return initial?.call(isLoginButtonStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoginButtonStatus)? initial,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        loading,
    TResult Function(BaseError error, bool isLoginButtonStatus, String? email,
            String? password)?
        loginError,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        currentPage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoginButtonStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(LoginError value) loginError,
    required TResult Function(CurrentPage value) currentPage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(LoginError value)? loginError,
    TResult Function(CurrentPage value)? currentPage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(LoginError value)? loginError,
    TResult Function(CurrentPage value)? currentPage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements LoginState {
  const factory Initial({required final bool isLoginButtonStatus}) = _$Initial;

  @override
  bool get isLoginButtonStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoginButtonStatus, String? email, String? password});
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, (v) => _then(v as _$Loading));

  @override
  _$Loading get _value => super._value as _$Loading;

  @override
  $Res call({
    Object? isLoginButtonStatus = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$Loading(
      isLoginButtonStatus: isLoginButtonStatus == freezed
          ? _value.isLoginButtonStatus
          : isLoginButtonStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading(
      {required this.isLoginButtonStatus,
      required this.email,
      required this.password});

  @override
  final bool isLoginButtonStatus;
  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'LoginState.loading(isLoginButtonStatus: $isLoginButtonStatus, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loading &&
            const DeepCollectionEquality()
                .equals(other.isLoginButtonStatus, isLoginButtonStatus) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoginButtonStatus),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      __$$LoadingCopyWithImpl<_$Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoginButtonStatus) initial,
    required TResult Function(
            bool isLoginButtonStatus, String? email, String? password)
        loading,
    required TResult Function(BaseError error, bool isLoginButtonStatus,
            String? email, String? password)
        loginError,
    required TResult Function(
            bool isLoginButtonStatus, String? email, String? password)
        currentPage,
  }) {
    return loading(isLoginButtonStatus, email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoginButtonStatus)? initial,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        loading,
    TResult Function(BaseError error, bool isLoginButtonStatus, String? email,
            String? password)?
        loginError,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        currentPage,
  }) {
    return loading?.call(isLoginButtonStatus, email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoginButtonStatus)? initial,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        loading,
    TResult Function(BaseError error, bool isLoginButtonStatus, String? email,
            String? password)?
        loginError,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        currentPage,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isLoginButtonStatus, email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(LoginError value) loginError,
    required TResult Function(CurrentPage value) currentPage,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(LoginError value)? loginError,
    TResult Function(CurrentPage value)? currentPage,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(LoginError value)? loginError,
    TResult Function(CurrentPage value)? currentPage,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements LoginState {
  const factory Loading(
      {required final bool isLoginButtonStatus,
      required final String? email,
      required final String? password}) = _$Loading;

  @override
  bool get isLoginButtonStatus => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginErrorCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginErrorCopyWith(
          _$LoginError value, $Res Function(_$LoginError) then) =
      __$$LoginErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {BaseError error,
      bool isLoginButtonStatus,
      String? email,
      String? password});

  $BaseErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$LoginErrorCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$LoginErrorCopyWith<$Res> {
  __$$LoginErrorCopyWithImpl(
      _$LoginError _value, $Res Function(_$LoginError) _then)
      : super(_value, (v) => _then(v as _$LoginError));

  @override
  _$LoginError get _value => super._value as _$LoginError;

  @override
  $Res call({
    Object? error = freezed,
    Object? isLoginButtonStatus = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$LoginError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseError,
      isLoginButtonStatus: isLoginButtonStatus == freezed
          ? _value.isLoginButtonStatus
          : isLoginButtonStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _$LoginError implements LoginError {
  const _$LoginError(
      {required this.error,
      required this.isLoginButtonStatus,
      required this.email,
      required this.password});

  @override
  final BaseError error;
  @override
  final bool isLoginButtonStatus;
  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'LoginState.loginError(error: $error, isLoginButtonStatus: $isLoginButtonStatus, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.isLoginButtonStatus, isLoginButtonStatus) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(isLoginButtonStatus),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$LoginErrorCopyWith<_$LoginError> get copyWith =>
      __$$LoginErrorCopyWithImpl<_$LoginError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoginButtonStatus) initial,
    required TResult Function(
            bool isLoginButtonStatus, String? email, String? password)
        loading,
    required TResult Function(BaseError error, bool isLoginButtonStatus,
            String? email, String? password)
        loginError,
    required TResult Function(
            bool isLoginButtonStatus, String? email, String? password)
        currentPage,
  }) {
    return loginError(error, isLoginButtonStatus, email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoginButtonStatus)? initial,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        loading,
    TResult Function(BaseError error, bool isLoginButtonStatus, String? email,
            String? password)?
        loginError,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        currentPage,
  }) {
    return loginError?.call(error, isLoginButtonStatus, email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoginButtonStatus)? initial,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        loading,
    TResult Function(BaseError error, bool isLoginButtonStatus, String? email,
            String? password)?
        loginError,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        currentPage,
    required TResult orElse(),
  }) {
    if (loginError != null) {
      return loginError(error, isLoginButtonStatus, email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(LoginError value) loginError,
    required TResult Function(CurrentPage value) currentPage,
  }) {
    return loginError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(LoginError value)? loginError,
    TResult Function(CurrentPage value)? currentPage,
  }) {
    return loginError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(LoginError value)? loginError,
    TResult Function(CurrentPage value)? currentPage,
    required TResult orElse(),
  }) {
    if (loginError != null) {
      return loginError(this);
    }
    return orElse();
  }
}

abstract class LoginError implements LoginState {
  const factory LoginError(
      {required final BaseError error,
      required final bool isLoginButtonStatus,
      required final String? email,
      required final String? password}) = _$LoginError;

  BaseError get error => throw _privateConstructorUsedError;
  @override
  bool get isLoginButtonStatus => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$LoginErrorCopyWith<_$LoginError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CurrentPageCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$CurrentPageCopyWith(
          _$CurrentPage value, $Res Function(_$CurrentPage) then) =
      __$$CurrentPageCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoginButtonStatus, String? email, String? password});
}

/// @nodoc
class __$$CurrentPageCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$CurrentPageCopyWith<$Res> {
  __$$CurrentPageCopyWithImpl(
      _$CurrentPage _value, $Res Function(_$CurrentPage) _then)
      : super(_value, (v) => _then(v as _$CurrentPage));

  @override
  _$CurrentPage get _value => super._value as _$CurrentPage;

  @override
  $Res call({
    Object? isLoginButtonStatus = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$CurrentPage(
      isLoginButtonStatus: isLoginButtonStatus == freezed
          ? _value.isLoginButtonStatus
          : isLoginButtonStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CurrentPage implements CurrentPage {
  const _$CurrentPage(
      {required this.isLoginButtonStatus,
      required this.email,
      required this.password});

  @override
  final bool isLoginButtonStatus;
  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'LoginState.currentPage(isLoginButtonStatus: $isLoginButtonStatus, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPage &&
            const DeepCollectionEquality()
                .equals(other.isLoginButtonStatus, isLoginButtonStatus) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoginButtonStatus),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$CurrentPageCopyWith<_$CurrentPage> get copyWith =>
      __$$CurrentPageCopyWithImpl<_$CurrentPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoginButtonStatus) initial,
    required TResult Function(
            bool isLoginButtonStatus, String? email, String? password)
        loading,
    required TResult Function(BaseError error, bool isLoginButtonStatus,
            String? email, String? password)
        loginError,
    required TResult Function(
            bool isLoginButtonStatus, String? email, String? password)
        currentPage,
  }) {
    return currentPage(isLoginButtonStatus, email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoginButtonStatus)? initial,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        loading,
    TResult Function(BaseError error, bool isLoginButtonStatus, String? email,
            String? password)?
        loginError,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        currentPage,
  }) {
    return currentPage?.call(isLoginButtonStatus, email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoginButtonStatus)? initial,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        loading,
    TResult Function(BaseError error, bool isLoginButtonStatus, String? email,
            String? password)?
        loginError,
    TResult Function(bool isLoginButtonStatus, String? email, String? password)?
        currentPage,
    required TResult orElse(),
  }) {
    if (currentPage != null) {
      return currentPage(isLoginButtonStatus, email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(LoginError value) loginError,
    required TResult Function(CurrentPage value) currentPage,
  }) {
    return currentPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(LoginError value)? loginError,
    TResult Function(CurrentPage value)? currentPage,
  }) {
    return currentPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(LoginError value)? loginError,
    TResult Function(CurrentPage value)? currentPage,
    required TResult orElse(),
  }) {
    if (currentPage != null) {
      return currentPage(this);
    }
    return orElse();
  }
}

abstract class CurrentPage implements LoginState {
  const factory CurrentPage(
      {required final bool isLoginButtonStatus,
      required final String? email,
      required final String? password}) = _$CurrentPage;

  @override
  bool get isLoginButtonStatus => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$CurrentPageCopyWith<_$CurrentPage> get copyWith =>
      throw _privateConstructorUsedError;
}
