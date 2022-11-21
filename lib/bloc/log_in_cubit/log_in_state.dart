part of 'log_in_cubit.dart';

class LogInState extends Equatable {
  final Email email;
  final Password password;
  final PageStatus status;
  final bool isOwner;
  final FormzStatus formStatus;

  const LogInState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = PageStatus.initial,
    this.isOwner = false,
    this.formStatus = FormzStatus.pure
  });

  LogInState copyWith({
    Email? email,
    Password? password,
    PageStatus? status,
    bool? isOwner,
    FormzStatus? formStatus
  }) => LogInState(
    email: email ?? this.email,
    password: password ?? this.password,
    status: status ?? this.status,
    isOwner: isOwner ?? this.isOwner,
    formStatus: formStatus ?? this.formStatus
  );

  @override
  List<Object> get props => [
    email,
    password,
    status,
    isOwner,
    formStatus
  ];
}
