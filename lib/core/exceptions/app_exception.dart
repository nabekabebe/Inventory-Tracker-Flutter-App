import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_tracker/core/common/exception_constants.dart';

part 'app_exception.freezed.dart';

@freezed
abstract class AppException with _$AppException {
  static const Map<String, String> backEndExceptionCode = {
    '001': ExceptionConstants.emailAlreadyInUse,
    '002': ExceptionConstants.serverError,
    '003': ExceptionConstants.authError
  };

  const factory AppException.serverAuthError(
          [@Default(ExceptionConstants.serverError) String message]) =
      ServerAuthError;

  const factory AppException.invalidEmailOrPassword(
          [@Default(ExceptionConstants.authError) String message]) =
      InvalidEmailOrPasssword;

  const factory AppException.emailAlreadyInUse(
          [@Default(ExceptionConstants.emailAlreadyInUse) String message]) =
      EmailAlreadyInUse;

  const factory AppException.networkError(
          [@Default(ExceptionConstants.networkError) String message]) =
      NetworkFailedError;

  const factory AppException.writeToLocalError(
          [@Default(ExceptionConstants.diskWriteError) String message]) =
      WriteToLocalError;

  const factory AppException.readFromLocalError(
          [@Default(ExceptionConstants.diskReadError) String message]) =
      ReadFromLocalError;

  const factory AppException.unknownError(
          [@Default(ExceptionConstants.unexpectedError) String message]) =
      UnknownError;
}
