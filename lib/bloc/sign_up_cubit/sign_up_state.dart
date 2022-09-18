part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final Email email;
  final Password password;
  final Password confirmPassword;
  final bool isOwner;
  final bool isCaregiver;
  final FormzStatus status;
  
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.isOwner = false,
    this.isCaregiver = false,
    this.status = FormzStatus.pure
  });

  SignUpState copyWith({
    Email? email,
    Password? password,
    Password? confirmPassword,
    bool? isOwner,
    bool? isCaregiver,
    FormzStatus? status
  }) => SignUpState(
    email: email ?? this.email,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    isOwner: isOwner ?? this.isOwner,
    isCaregiver: isCaregiver ?? this.isCaregiver,
    status: status ?? this.status
  );
  
  @override
  List<Object?> get props => [email, password, confirmPassword, isOwner];
}
