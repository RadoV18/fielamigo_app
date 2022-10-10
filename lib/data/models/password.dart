import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput]
enum PasswordValidationError {
  length
}

/// Form input for a password input.
class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if(value.length < 12) {
      return PasswordValidationError.length;
    }
    return null;
  }
}