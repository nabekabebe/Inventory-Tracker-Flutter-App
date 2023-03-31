import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/domain/value_objects/value_failure.dart';

Either<ValueFailure<String>, String> validateEmail(String email) {
  return email.isEmail ? right(email) : left(const ValueFailure.invalidEmail());
}

Either<ValueFailure<String>, String> validatePassword(String pass) {
  return pass.length > 5
      ? right(pass)
      : left(const ValueFailure.shortPassword());
}
