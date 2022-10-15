part of 'log_in_cubit.dart';

class LogInState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;

  const LogInState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure
  });

  LogInState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status
  }) => LogInState(
    email: email ?? this.email,
    password: password ?? this.password,
    status: status ?? this.status
  );

  @override
  List<Object> get props => [
    email,
    password,
    status
  ];
}
