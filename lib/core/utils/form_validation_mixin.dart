import 'package:inventory_tracker/domain/form_inputs/form_inputs.dart';
import 'package:inventory_tracker/domain/form_inputs/form_validators.dart';

abstract class FormValidation {
  void clearForm();
}

mixin FormValidationMixin implements FormValidation {
  String? formValidation(FormFieldType type, String? value) {
    if (value == null) return null;
    late final FormValue field;
    switch (type) {
      case FormFieldType.email:
        field = FormValue.dirty(FormValidators.emailValidator, value);
        break;
      case FormFieldType.name:
        field = FormValue.dirty(FormValidators.fullNameValidator, value);
        break;
      case FormFieldType.phone:
        field = FormValue.dirty(FormValidators.phoneValidator, value);
        break;
      case FormFieldType.password:
        field = FormValue.dirty(FormValidators.passwordValidator, value);
        break;
      default:
        return null;
    }
    if (field.valid) return null;

    return field.error?.message;
  }
}
