import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/models/log_in_dto.dart';
import 'package:fielamigo_app/data/repository/log_in_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:formz/formz.dart';

import '../../data/models/auth_dto.dart';
import '../../data/models/email.dart';
import '../../data/models/password.dart';
import '../../utils/token_utils.dart';
import '../page_status.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final LogInRepository _logInRepository = LogInRepository();

  LogInCubit() : super(const LogInState(
    email: Email.pure(),
    password: Password.pure(),
    formStatus: FormzStatus.pure,
  ));

  void setEmail(String email) {
    final newEmail = Email.dirty(email);
    emit(state.copyWith(
      email: newEmail,
      formStatus: Formz.validate([newEmail, state.password])
    ));
  }

  void setPassword(String password) {
    final newPassword = Password.dirty(password);
    emit(state.copyWith(
      password: newPassword,
      formStatus: Formz.validate([state.email, newPassword])
    ));
  }

  void setStatus(PageStatus status) {
    emit(state.copyWith(status: status));
  }

  void submit() async {
    emit(state.copyWith(
      status: PageStatus.loading
    ));
    LogInDto logInDto = LogInDto(
      email: state.email.value,
      password: state.password.value
    );

    try {
      AuthDto authDto = await _logInRepository.logIn(logInDto);
      
      // store token in secure storage
      FlutterSecureStorage storage = const FlutterSecureStorage();
      storage.write(key: "token", value: authDto.token!);
      storage.write(key: "refresh", value: authDto.refreshToken!);

      bool isOwner = TokenUtils.checkIsOwner(authDto.token!);

      emit(state.copyWith(
        status: PageStatus.success,
        isOwner: isOwner
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: PageStatus.error
      ));
      print(e);
    }
  }

  void reset() {
    emit(const LogInState(
      email: Email.pure(),
      password: Password.pure(),
      formStatus: FormzStatus.pure,
    ));
  }
}
