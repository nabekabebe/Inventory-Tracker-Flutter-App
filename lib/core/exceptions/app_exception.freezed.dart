// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverAuthError,
    required TResult Function(String message) invalidEmailOrPassword,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) networkError,
    required TResult Function(String message) writeToLocalError,
    required TResult Function(String message) readFromLocalError,
    required TResult Function(String message) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverAuthError,
    TResult? Function(String message)? invalidEmailOrPassword,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? writeToLocalError,
    TResult? Function(String message)? readFromLocalError,
    TResult? Function(String message)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverAuthError,
    TResult Function(String message)? invalidEmailOrPassword,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? networkError,
    TResult Function(String message)? writeToLocalError,
    TResult Function(String message)? readFromLocalError,
    TResult Function(String message)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerAuthError value) serverAuthError,
    required TResult Function(InvalidEmailOrPasssword value)
        invalidEmailOrPassword,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(NetworkFailedError value) networkError,
    required TResult Function(WriteToLocalError value) writeToLocalError,
    required TResult Function(ReadFromLocalError value) readFromLocalError,
    required TResult Function(UnknownError value) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerAuthError value)? serverAuthError,
    TResult? Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(NetworkFailedError value)? networkError,
    TResult? Function(WriteToLocalError value)? writeToLocalError,
    TResult? Function(ReadFromLocalError value)? readFromLocalError,
    TResult? Function(UnknownError value)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerAuthError value)? serverAuthError,
    TResult Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(NetworkFailedError value)? networkError,
    TResult Function(WriteToLocalError value)? writeToLocalError,
    TResult Function(ReadFromLocalError value)? readFromLocalError,
    TResult Function(UnknownError value)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppExceptionCopyWith<AppException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerAuthErrorCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$ServerAuthErrorCopyWith(
          _$ServerAuthError value, $Res Function(_$ServerAuthError) then) =
      __$$ServerAuthErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerAuthErrorCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ServerAuthError>
    implements _$$ServerAuthErrorCopyWith<$Res> {
  __$$ServerAuthErrorCopyWithImpl(
      _$ServerAuthError _value, $Res Function(_$ServerAuthError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerAuthError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerAuthError implements ServerAuthError {
  const _$ServerAuthError([this.message = ExceptionConstants.serverError]);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.serverAuthError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerAuthError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerAuthErrorCopyWith<_$ServerAuthError> get copyWith =>
      __$$ServerAuthErrorCopyWithImpl<_$ServerAuthError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverAuthError,
    required TResult Function(String message) invalidEmailOrPassword,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) networkError,
    required TResult Function(String message) writeToLocalError,
    required TResult Function(String message) readFromLocalError,
    required TResult Function(String message) unknownError,
  }) {
    return serverAuthError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverAuthError,
    TResult? Function(String message)? invalidEmailOrPassword,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? writeToLocalError,
    TResult? Function(String message)? readFromLocalError,
    TResult? Function(String message)? unknownError,
  }) {
    return serverAuthError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverAuthError,
    TResult Function(String message)? invalidEmailOrPassword,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? networkError,
    TResult Function(String message)? writeToLocalError,
    TResult Function(String message)? readFromLocalError,
    TResult Function(String message)? unknownError,
    required TResult orElse(),
  }) {
    if (serverAuthError != null) {
      return serverAuthError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerAuthError value) serverAuthError,
    required TResult Function(InvalidEmailOrPasssword value)
        invalidEmailOrPassword,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(NetworkFailedError value) networkError,
    required TResult Function(WriteToLocalError value) writeToLocalError,
    required TResult Function(ReadFromLocalError value) readFromLocalError,
    required TResult Function(UnknownError value) unknownError,
  }) {
    return serverAuthError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerAuthError value)? serverAuthError,
    TResult? Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(NetworkFailedError value)? networkError,
    TResult? Function(WriteToLocalError value)? writeToLocalError,
    TResult? Function(ReadFromLocalError value)? readFromLocalError,
    TResult? Function(UnknownError value)? unknownError,
  }) {
    return serverAuthError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerAuthError value)? serverAuthError,
    TResult Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(NetworkFailedError value)? networkError,
    TResult Function(WriteToLocalError value)? writeToLocalError,
    TResult Function(ReadFromLocalError value)? readFromLocalError,
    TResult Function(UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (serverAuthError != null) {
      return serverAuthError(this);
    }
    return orElse();
  }
}

abstract class ServerAuthError implements AppException {
  const factory ServerAuthError([final String message]) = _$ServerAuthError;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ServerAuthErrorCopyWith<_$ServerAuthError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidEmailOrPassswordCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$InvalidEmailOrPassswordCopyWith(_$InvalidEmailOrPasssword value,
          $Res Function(_$InvalidEmailOrPasssword) then) =
      __$$InvalidEmailOrPassswordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidEmailOrPassswordCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$InvalidEmailOrPasssword>
    implements _$$InvalidEmailOrPassswordCopyWith<$Res> {
  __$$InvalidEmailOrPassswordCopyWithImpl(_$InvalidEmailOrPasssword _value,
      $Res Function(_$InvalidEmailOrPasssword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InvalidEmailOrPasssword(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidEmailOrPasssword implements InvalidEmailOrPasssword {
  const _$InvalidEmailOrPasssword(
      [this.message = ExceptionConstants.authError]);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.invalidEmailOrPassword(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmailOrPasssword &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidEmailOrPassswordCopyWith<_$InvalidEmailOrPasssword> get copyWith =>
      __$$InvalidEmailOrPassswordCopyWithImpl<_$InvalidEmailOrPasssword>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverAuthError,
    required TResult Function(String message) invalidEmailOrPassword,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) networkError,
    required TResult Function(String message) writeToLocalError,
    required TResult Function(String message) readFromLocalError,
    required TResult Function(String message) unknownError,
  }) {
    return invalidEmailOrPassword(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverAuthError,
    TResult? Function(String message)? invalidEmailOrPassword,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? writeToLocalError,
    TResult? Function(String message)? readFromLocalError,
    TResult? Function(String message)? unknownError,
  }) {
    return invalidEmailOrPassword?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverAuthError,
    TResult Function(String message)? invalidEmailOrPassword,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? networkError,
    TResult Function(String message)? writeToLocalError,
    TResult Function(String message)? readFromLocalError,
    TResult Function(String message)? unknownError,
    required TResult orElse(),
  }) {
    if (invalidEmailOrPassword != null) {
      return invalidEmailOrPassword(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerAuthError value) serverAuthError,
    required TResult Function(InvalidEmailOrPasssword value)
        invalidEmailOrPassword,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(NetworkFailedError value) networkError,
    required TResult Function(WriteToLocalError value) writeToLocalError,
    required TResult Function(ReadFromLocalError value) readFromLocalError,
    required TResult Function(UnknownError value) unknownError,
  }) {
    return invalidEmailOrPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerAuthError value)? serverAuthError,
    TResult? Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(NetworkFailedError value)? networkError,
    TResult? Function(WriteToLocalError value)? writeToLocalError,
    TResult? Function(ReadFromLocalError value)? readFromLocalError,
    TResult? Function(UnknownError value)? unknownError,
  }) {
    return invalidEmailOrPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerAuthError value)? serverAuthError,
    TResult Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(NetworkFailedError value)? networkError,
    TResult Function(WriteToLocalError value)? writeToLocalError,
    TResult Function(ReadFromLocalError value)? readFromLocalError,
    TResult Function(UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (invalidEmailOrPassword != null) {
      return invalidEmailOrPassword(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailOrPasssword implements AppException {
  const factory InvalidEmailOrPasssword([final String message]) =
      _$InvalidEmailOrPasssword;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$InvalidEmailOrPassswordCopyWith<_$InvalidEmailOrPasssword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailAlreadyInUseCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$EmailAlreadyInUseCopyWith(
          _$EmailAlreadyInUse value, $Res Function(_$EmailAlreadyInUse) then) =
      __$$EmailAlreadyInUseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$EmailAlreadyInUseCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$EmailAlreadyInUse>
    implements _$$EmailAlreadyInUseCopyWith<$Res> {
  __$$EmailAlreadyInUseCopyWithImpl(
      _$EmailAlreadyInUse _value, $Res Function(_$EmailAlreadyInUse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$EmailAlreadyInUse(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailAlreadyInUse implements EmailAlreadyInUse {
  const _$EmailAlreadyInUse(
      [this.message = ExceptionConstants.emailAlreadyInUse]);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.emailAlreadyInUse(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAlreadyInUse &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailAlreadyInUseCopyWith<_$EmailAlreadyInUse> get copyWith =>
      __$$EmailAlreadyInUseCopyWithImpl<_$EmailAlreadyInUse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverAuthError,
    required TResult Function(String message) invalidEmailOrPassword,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) networkError,
    required TResult Function(String message) writeToLocalError,
    required TResult Function(String message) readFromLocalError,
    required TResult Function(String message) unknownError,
  }) {
    return emailAlreadyInUse(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverAuthError,
    TResult? Function(String message)? invalidEmailOrPassword,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? writeToLocalError,
    TResult? Function(String message)? readFromLocalError,
    TResult? Function(String message)? unknownError,
  }) {
    return emailAlreadyInUse?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverAuthError,
    TResult Function(String message)? invalidEmailOrPassword,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? networkError,
    TResult Function(String message)? writeToLocalError,
    TResult Function(String message)? readFromLocalError,
    TResult Function(String message)? unknownError,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerAuthError value) serverAuthError,
    required TResult Function(InvalidEmailOrPasssword value)
        invalidEmailOrPassword,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(NetworkFailedError value) networkError,
    required TResult Function(WriteToLocalError value) writeToLocalError,
    required TResult Function(ReadFromLocalError value) readFromLocalError,
    required TResult Function(UnknownError value) unknownError,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerAuthError value)? serverAuthError,
    TResult? Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(NetworkFailedError value)? networkError,
    TResult? Function(WriteToLocalError value)? writeToLocalError,
    TResult? Function(ReadFromLocalError value)? readFromLocalError,
    TResult? Function(UnknownError value)? unknownError,
  }) {
    return emailAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerAuthError value)? serverAuthError,
    TResult Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(NetworkFailedError value)? networkError,
    TResult Function(WriteToLocalError value)? writeToLocalError,
    TResult Function(ReadFromLocalError value)? readFromLocalError,
    TResult Function(UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUse implements AppException {
  const factory EmailAlreadyInUse([final String message]) = _$EmailAlreadyInUse;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$EmailAlreadyInUseCopyWith<_$EmailAlreadyInUse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailedErrorCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$NetworkFailedErrorCopyWith(_$NetworkFailedError value,
          $Res Function(_$NetworkFailedError) then) =
      __$$NetworkFailedErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkFailedErrorCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NetworkFailedError>
    implements _$$NetworkFailedErrorCopyWith<$Res> {
  __$$NetworkFailedErrorCopyWithImpl(
      _$NetworkFailedError _value, $Res Function(_$NetworkFailedError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkFailedError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkFailedError implements NetworkFailedError {
  const _$NetworkFailedError([this.message = ExceptionConstants.networkError]);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.networkError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailedError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailedErrorCopyWith<_$NetworkFailedError> get copyWith =>
      __$$NetworkFailedErrorCopyWithImpl<_$NetworkFailedError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverAuthError,
    required TResult Function(String message) invalidEmailOrPassword,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) networkError,
    required TResult Function(String message) writeToLocalError,
    required TResult Function(String message) readFromLocalError,
    required TResult Function(String message) unknownError,
  }) {
    return networkError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverAuthError,
    TResult? Function(String message)? invalidEmailOrPassword,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? writeToLocalError,
    TResult? Function(String message)? readFromLocalError,
    TResult? Function(String message)? unknownError,
  }) {
    return networkError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverAuthError,
    TResult Function(String message)? invalidEmailOrPassword,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? networkError,
    TResult Function(String message)? writeToLocalError,
    TResult Function(String message)? readFromLocalError,
    TResult Function(String message)? unknownError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerAuthError value) serverAuthError,
    required TResult Function(InvalidEmailOrPasssword value)
        invalidEmailOrPassword,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(NetworkFailedError value) networkError,
    required TResult Function(WriteToLocalError value) writeToLocalError,
    required TResult Function(ReadFromLocalError value) readFromLocalError,
    required TResult Function(UnknownError value) unknownError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerAuthError value)? serverAuthError,
    TResult? Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(NetworkFailedError value)? networkError,
    TResult? Function(WriteToLocalError value)? writeToLocalError,
    TResult? Function(ReadFromLocalError value)? readFromLocalError,
    TResult? Function(UnknownError value)? unknownError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerAuthError value)? serverAuthError,
    TResult Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(NetworkFailedError value)? networkError,
    TResult Function(WriteToLocalError value)? writeToLocalError,
    TResult Function(ReadFromLocalError value)? readFromLocalError,
    TResult Function(UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkFailedError implements AppException {
  const factory NetworkFailedError([final String message]) =
      _$NetworkFailedError;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NetworkFailedErrorCopyWith<_$NetworkFailedError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WriteToLocalErrorCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$WriteToLocalErrorCopyWith(
          _$WriteToLocalError value, $Res Function(_$WriteToLocalError) then) =
      __$$WriteToLocalErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$WriteToLocalErrorCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$WriteToLocalError>
    implements _$$WriteToLocalErrorCopyWith<$Res> {
  __$$WriteToLocalErrorCopyWithImpl(
      _$WriteToLocalError _value, $Res Function(_$WriteToLocalError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$WriteToLocalError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WriteToLocalError implements WriteToLocalError {
  const _$WriteToLocalError([this.message = ExceptionConstants.diskWriteError]);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.writeToLocalError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WriteToLocalError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WriteToLocalErrorCopyWith<_$WriteToLocalError> get copyWith =>
      __$$WriteToLocalErrorCopyWithImpl<_$WriteToLocalError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverAuthError,
    required TResult Function(String message) invalidEmailOrPassword,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) networkError,
    required TResult Function(String message) writeToLocalError,
    required TResult Function(String message) readFromLocalError,
    required TResult Function(String message) unknownError,
  }) {
    return writeToLocalError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverAuthError,
    TResult? Function(String message)? invalidEmailOrPassword,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? writeToLocalError,
    TResult? Function(String message)? readFromLocalError,
    TResult? Function(String message)? unknownError,
  }) {
    return writeToLocalError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverAuthError,
    TResult Function(String message)? invalidEmailOrPassword,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? networkError,
    TResult Function(String message)? writeToLocalError,
    TResult Function(String message)? readFromLocalError,
    TResult Function(String message)? unknownError,
    required TResult orElse(),
  }) {
    if (writeToLocalError != null) {
      return writeToLocalError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerAuthError value) serverAuthError,
    required TResult Function(InvalidEmailOrPasssword value)
        invalidEmailOrPassword,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(NetworkFailedError value) networkError,
    required TResult Function(WriteToLocalError value) writeToLocalError,
    required TResult Function(ReadFromLocalError value) readFromLocalError,
    required TResult Function(UnknownError value) unknownError,
  }) {
    return writeToLocalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerAuthError value)? serverAuthError,
    TResult? Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(NetworkFailedError value)? networkError,
    TResult? Function(WriteToLocalError value)? writeToLocalError,
    TResult? Function(ReadFromLocalError value)? readFromLocalError,
    TResult? Function(UnknownError value)? unknownError,
  }) {
    return writeToLocalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerAuthError value)? serverAuthError,
    TResult Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(NetworkFailedError value)? networkError,
    TResult Function(WriteToLocalError value)? writeToLocalError,
    TResult Function(ReadFromLocalError value)? readFromLocalError,
    TResult Function(UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (writeToLocalError != null) {
      return writeToLocalError(this);
    }
    return orElse();
  }
}

abstract class WriteToLocalError implements AppException {
  const factory WriteToLocalError([final String message]) = _$WriteToLocalError;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$WriteToLocalErrorCopyWith<_$WriteToLocalError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReadFromLocalErrorCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$ReadFromLocalErrorCopyWith(_$ReadFromLocalError value,
          $Res Function(_$ReadFromLocalError) then) =
      __$$ReadFromLocalErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ReadFromLocalErrorCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ReadFromLocalError>
    implements _$$ReadFromLocalErrorCopyWith<$Res> {
  __$$ReadFromLocalErrorCopyWithImpl(
      _$ReadFromLocalError _value, $Res Function(_$ReadFromLocalError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ReadFromLocalError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReadFromLocalError implements ReadFromLocalError {
  const _$ReadFromLocalError([this.message = ExceptionConstants.diskReadError]);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.readFromLocalError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadFromLocalError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadFromLocalErrorCopyWith<_$ReadFromLocalError> get copyWith =>
      __$$ReadFromLocalErrorCopyWithImpl<_$ReadFromLocalError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverAuthError,
    required TResult Function(String message) invalidEmailOrPassword,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) networkError,
    required TResult Function(String message) writeToLocalError,
    required TResult Function(String message) readFromLocalError,
    required TResult Function(String message) unknownError,
  }) {
    return readFromLocalError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverAuthError,
    TResult? Function(String message)? invalidEmailOrPassword,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? writeToLocalError,
    TResult? Function(String message)? readFromLocalError,
    TResult? Function(String message)? unknownError,
  }) {
    return readFromLocalError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverAuthError,
    TResult Function(String message)? invalidEmailOrPassword,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? networkError,
    TResult Function(String message)? writeToLocalError,
    TResult Function(String message)? readFromLocalError,
    TResult Function(String message)? unknownError,
    required TResult orElse(),
  }) {
    if (readFromLocalError != null) {
      return readFromLocalError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerAuthError value) serverAuthError,
    required TResult Function(InvalidEmailOrPasssword value)
        invalidEmailOrPassword,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(NetworkFailedError value) networkError,
    required TResult Function(WriteToLocalError value) writeToLocalError,
    required TResult Function(ReadFromLocalError value) readFromLocalError,
    required TResult Function(UnknownError value) unknownError,
  }) {
    return readFromLocalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerAuthError value)? serverAuthError,
    TResult? Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(NetworkFailedError value)? networkError,
    TResult? Function(WriteToLocalError value)? writeToLocalError,
    TResult? Function(ReadFromLocalError value)? readFromLocalError,
    TResult? Function(UnknownError value)? unknownError,
  }) {
    return readFromLocalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerAuthError value)? serverAuthError,
    TResult Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(NetworkFailedError value)? networkError,
    TResult Function(WriteToLocalError value)? writeToLocalError,
    TResult Function(ReadFromLocalError value)? readFromLocalError,
    TResult Function(UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (readFromLocalError != null) {
      return readFromLocalError(this);
    }
    return orElse();
  }
}

abstract class ReadFromLocalError implements AppException {
  const factory ReadFromLocalError([final String message]) =
      _$ReadFromLocalError;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ReadFromLocalErrorCopyWith<_$ReadFromLocalError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownErrorCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$UnknownErrorCopyWith(
          _$UnknownError value, $Res Function(_$UnknownError) then) =
      __$$UnknownErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownErrorCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnknownError>
    implements _$$UnknownErrorCopyWith<$Res> {
  __$$UnknownErrorCopyWithImpl(
      _$UnknownError _value, $Res Function(_$UnknownError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownError implements UnknownError {
  const _$UnknownError([this.message = ExceptionConstants.unexpectedError]);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.unknownError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownErrorCopyWith<_$UnknownError> get copyWith =>
      __$$UnknownErrorCopyWithImpl<_$UnknownError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverAuthError,
    required TResult Function(String message) invalidEmailOrPassword,
    required TResult Function(String message) emailAlreadyInUse,
    required TResult Function(String message) networkError,
    required TResult Function(String message) writeToLocalError,
    required TResult Function(String message) readFromLocalError,
    required TResult Function(String message) unknownError,
  }) {
    return unknownError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverAuthError,
    TResult? Function(String message)? invalidEmailOrPassword,
    TResult? Function(String message)? emailAlreadyInUse,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? writeToLocalError,
    TResult? Function(String message)? readFromLocalError,
    TResult? Function(String message)? unknownError,
  }) {
    return unknownError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverAuthError,
    TResult Function(String message)? invalidEmailOrPassword,
    TResult Function(String message)? emailAlreadyInUse,
    TResult Function(String message)? networkError,
    TResult Function(String message)? writeToLocalError,
    TResult Function(String message)? readFromLocalError,
    TResult Function(String message)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerAuthError value) serverAuthError,
    required TResult Function(InvalidEmailOrPasssword value)
        invalidEmailOrPassword,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(NetworkFailedError value) networkError,
    required TResult Function(WriteToLocalError value) writeToLocalError,
    required TResult Function(ReadFromLocalError value) readFromLocalError,
    required TResult Function(UnknownError value) unknownError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerAuthError value)? serverAuthError,
    TResult? Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(NetworkFailedError value)? networkError,
    TResult? Function(WriteToLocalError value)? writeToLocalError,
    TResult? Function(ReadFromLocalError value)? readFromLocalError,
    TResult? Function(UnknownError value)? unknownError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerAuthError value)? serverAuthError,
    TResult Function(InvalidEmailOrPasssword value)? invalidEmailOrPassword,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(NetworkFailedError value)? networkError,
    TResult Function(WriteToLocalError value)? writeToLocalError,
    TResult Function(ReadFromLocalError value)? readFromLocalError,
    TResult Function(UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class UnknownError implements AppException {
  const factory UnknownError([final String message]) = _$UnknownError;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$UnknownErrorCopyWith<_$UnknownError> get copyWith =>
      throw _privateConstructorUsedError;
}
