import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/models/log_in_dto.dart';
import 'package:fielamigo_app/data/repository/log_in_repository.dart';
import 'package:formz/formz.dart';

import '../../data/models/auth_dto.dart';
import '../../data/models/email.dart';
import '../../data/models/password.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final LogInRepository _logInRepository = LogInRepository();

  LogInCubit() : super(const LogInState(
    email: Email.pure(),
    password: Password.pure(),
    status: FormzStatus.pure,
  ));

  void setEmail(String email) {
    final newEmail = Email.dirty(email);
    emit(state.copyWith(
      email: newEmail,
      status: Formz.validate([newEmail, state.password])
    ));
  }

  void setPassword(String password) {
    final newPassword = Password.dirty(password);
    emit(state.copyWith(
      password: newPassword,
      status: Formz.validate([state.email, newPassword])
    ));
  }

  void submit() async {
    LogInDto logInDto = LogInDto(
      email: state.email.value,
      password: state.password.value
    );
    // TODO: Uncomment when backend is ready
    // AuthDto response = await _logInRepository.logIn(logInDto);
  }
}
