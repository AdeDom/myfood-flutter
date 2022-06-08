// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'base_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseError _$BaseErrorFromJson(Map<String, dynamic> json) {
  return _BaseError.fromJson(json);
}

/// @nodoc
mixin _$BaseError {
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseErrorCopyWith<BaseError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseErrorCopyWith<$Res> {
  factory $BaseErrorCopyWith(BaseError value, $Res Function(BaseError) then) =
      _$BaseErrorCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "code") String? code,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class _$BaseErrorCopyWithImpl<$Res> implements $BaseErrorCopyWith<$Res> {
  _$BaseErrorCopyWithImpl(this._value, this._then);

  final BaseError _value;
  // ignore: unused_field
  final $Res Function(BaseError) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_BaseErrorCopyWith<$Res> implements $BaseErrorCopyWith<$Res> {
  factory _$$_BaseErrorCopyWith(
          _$_BaseError value, $Res Function(_$_BaseError) then) =
      __$$_BaseErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "code") String? code,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class __$$_BaseErrorCopyWithImpl<$Res> extends _$BaseErrorCopyWithImpl<$Res>
    implements _$$_BaseErrorCopyWith<$Res> {
  __$$_BaseErrorCopyWithImpl(
      _$_BaseError _value, $Res Function(_$_BaseError) _then)
      : super(_value, (v) => _then(v as _$_BaseError));

  @override
  _$_BaseError get _value => super._value as _$_BaseError;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_BaseError(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BaseError implements _BaseError {
  _$_BaseError(
      {@JsonKey(name: "code") this.code,
      @JsonKey(name: "message") this.message});

  factory _$_BaseError.fromJson(Map<String, dynamic> json) =>
      _$$_BaseErrorFromJson(json);

  @override
  @JsonKey(name: "code")
  final String? code;
  @override
  @JsonKey(name: "message")
  final String? message;

  @override
  String toString() {
    return 'BaseError(code: $code, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseError &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_BaseErrorCopyWith<_$_BaseError> get copyWith =>
      __$$_BaseErrorCopyWithImpl<_$_BaseError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BaseErrorToJson(this);
  }
}

abstract class _BaseError implements BaseError {
  factory _BaseError(
      {@JsonKey(name: "code") final String? code,
      @JsonKey(name: "message") final String? message}) = _$_BaseError;

  factory _BaseError.fromJson(Map<String, dynamic> json) =
      _$_BaseError.fromJson;

  @override
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BaseErrorCopyWith<_$_BaseError> get copyWith =>
      throw _privateConstructorUsedError;
}
