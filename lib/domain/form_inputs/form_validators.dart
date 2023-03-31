import 'package:get/get.dart';
import 'package:inventory_tracker/domain/value_objects/value_failure.dart';

enum FormFieldType { email, phone, password, name }

class FormValidators {
  static ValueFailure<String>? emailValidator(String value) {
    return value.isEmail ? null : const ValueFailure.invalidEmail();
  }

  static ValueFailure<String>? passwordValidator(String value) {
    return value.length > 4 ? null : const ValueFailure.shortPassword();
  }

  static ValueFailure<String>? fullNameValidator(String value) {
    return (value.isAlphabetOnly && value.length > 4)
        ? null
        : const ValueFailure.invalidName(
            "Name should be only letters and more than 5 characters!");
  }

  static ValueFailure<String>? phoneValidator(String value) {
    return value.isPhoneNumber
        ? null
        : const ValueFailure.shortPassword("Invalid phone number format!");
  }
}
