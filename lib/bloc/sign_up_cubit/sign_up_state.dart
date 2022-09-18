part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final Email email;
  final Password password;
  final Password confirmPassword;
  final bool? isOwner;
  final FormzStatus status;
  final String? emailErrorMessage;
  final String? passwordErrorMessage;
  final String? passwordConfirmErrorMessage;

  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.isOwner,
    this.status = FormzStatus.pure,
    this.emailErrorMessage,
    this.passwordErrorMessage,
    this.passwordConfirmErrorMessage
  });

  SignUpState copyWith({
    Email? email,
    Password? password,
    Password? confirmPassword,
    bool? isOwner,
    FormzStatus? status,
    String? emailErrorMessage,
    String? passwordErrorMessage,
    String? passwordConfirmErrorMessage,
  }) => SignUpState(
    email: email ?? this.email,
    password: password ?? this.password,

  );
  
  @override
  List<Object?> get props => [email, password, confirmPassword, isOwner,
  emailErrorMessage, passwordErrorMessage, passwordConfirmErrorMessage];
}
