import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail(
      [@Default("Invalid email!") String message]) = InvalidEmail<T>;

  const factory ValueFailure.invalidPhoneNumber(
          [@Default("Invalid phone number!") String message]) =
      InvalidPhoneNumber<T>;

  const factory ValueFailure.shortPassword(
      [@Default("short password!") String message]) = ShortPassword<T>;

  const factory ValueFailure.invalidName(
      [@Default("Name format is not valid!") String message]) = InvalidName<T>;
}
