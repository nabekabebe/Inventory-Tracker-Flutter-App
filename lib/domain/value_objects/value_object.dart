import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory_tracker/domain/value_objects/value_failure.dart';
import 'package:inventory_tracker/domain/value_objects/value_validators.dart';

@immutable
abstract class ValueObject<T> {
  final Either<ValueFailure<T>, T> value;

  const ValueObject(this.value);
}

class EmailAddress extends ValueObject<String> {
  const EmailAddress._(value) : super(value);

  factory EmailAddress(String value) {
    return EmailAddress._(validateEmail(value));
  }
}

class Password extends ValueObject<String> {
  const Password._(value) : super(value);

  factory Password(String value) {
    return Password._(validatePassword(value));
  }
}
