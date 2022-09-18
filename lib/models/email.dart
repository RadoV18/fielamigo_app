import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput]
enum EmailValidationError {
  invalid
}

/// Form input for an email input.
class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([super.value = '']) : super.dirty();
  
  /// Regular expression for validating email addresses.
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  
  /// Validate email address using [_emailRegExp].
  @override
  EmailValidationError? validator(String value) {
    return _emailRegExp.hasMatch(value)
      ? null
      : EmailValidationError.invalid;
  }
}