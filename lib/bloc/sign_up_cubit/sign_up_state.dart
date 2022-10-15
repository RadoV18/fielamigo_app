part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String birthDate;
  final Email email;
  final Password password;
  final Password confirmPassword;
  final bool isOwner;
  final bool isCaregiver;
  final String passwordStrength;
  final FormzStatus status;
  
  const SignUpState({
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.birthDate = 'dd/mm/aaaa',
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.isOwner = false,
    this.isCaregiver = false,
    this.passwordStrength = '',
    this.status = FormzStatus.pure
  });

  SignUpState copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDate,
    Email? email,
    Password? password,
    Password? confirmPassword,
    bool? isOwner,
    bool? isCaregiver,
    String? passwordStrength,
    FormzStatus? status
  }) => SignUpState(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    birthDate: birthDate ?? this.birthDate,
    email: email ?? this.email,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    isOwner: isOwner ?? this.isOwner,
    isCaregiver: isCaregiver ?? this.isCaregiver,
    passwordStrength: passwordStrength ?? this.passwordStrength,
    status: status ?? this.status
  );
  
  @override
  List<Object?> get props => [
    firstName,
    lastName,
    phoneNumber,
    birthDate,
    email,
    password,
    confirmPassword,
    isOwner,
    isCaregiver,
    passwordStrength,
    status
  ];
}
