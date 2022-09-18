import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput]
enum PasswordValidationError {
  invalid
}

/// Form input for a password input.
class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  /// Regular expression for validating passwords.
  static final RegExp _passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    return _passwordRegExp.hasMatch(value)
      ? null
      : PasswordValidationError.invalid;
  }
}