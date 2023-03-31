import 'package:inventory_tracker/domain/value_objects/value_failure.dart';

enum FormInputStatus {
  pure,
  valid,
  invalid,
}

abstract class FormInput<T, E> {
  final T value;
  final bool pure;
  final E? Function(T)? validator;

  const FormInput._(this.value, [this.validator, this.pure = true]);

  const FormInput.pure(T value) : this._(value);

  const FormInput.dirty(validator, T value) : this._(value, validator, false);

  E? get error => validator != null ? validator!(value) : null;

  bool get valid => validator != null ? validator!(value) == null : false;

  FormInputStatus get status => pure
      ? FormInputStatus.pure
      : valid
          ? FormInputStatus.valid
          : FormInputStatus.invalid;
}

class FormValue extends FormInput<String, ValueFailure> {
  FormValue.pure(super.value) : super.pure();

  FormValue.dirty(super.validator, super.value) : super.dirty();
}
