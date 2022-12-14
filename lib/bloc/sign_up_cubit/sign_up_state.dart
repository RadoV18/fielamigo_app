part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final Email email;
  final Password password;
  final Password confirmPassword;
  final bool isOwner;
  final bool isCaregiver;
  final String passwordStrength;
  final PageStatus status;
  final FormzStatus formStatus;
  
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.isOwner = false,
    this.isCaregiver = false,
    this.passwordStrength = '',
    this.status = PageStatus.initial,
    this.formStatus = FormzStatus.pure
  });

  SignUpState copyWith({
    Email? email,
    Password? password,
    Password? confirmPassword,
    bool? isOwner,
    bool? isCaregiver,
    String? passwordStrength,
    PageStatus? status,
    FormzStatus? formStatus
  }) => SignUpState(
    email: email ?? this.email,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    isOwner: isOwner ?? this.isOwner,
    isCaregiver: isCaregiver ?? this.isCaregiver,
    passwordStrength: passwordStrength ?? this.passwordStrength,
    status: status ?? this.status,
    formStatus: formStatus ?? this.formStatus
  );
  
  @override
  List<Object?> get props => [
    email,
    password,
    confirmPassword,
    isOwner,
    isCaregiver,
    passwordStrength,
    status,
    formStatus
  ];
}
