import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../models/email.dart';
import '../../models/password.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState(
    email: Email.pure(),
    password: Password.pure(),
    confirmPassword: Password.pure(),
    isOwner: null,
    status: FormzStatus.pure,
    emailErrorMessage: null,
    passwordErrorMessage: null,
    passwordConfirmErrorMessage: null
  ));

  void setEmail(String email) {
    final newEmail = Email.dirty(email);
    emit(state.copyWith(
      email: newEmail,
      status: Formz.validate([newEmail, state.password, state.confirmPassword])
    ));
  }

  void setPassword(String password) {
    final newPassword = Password.dirty(password);
    emit(state.copyWith(
      password: newPassword,
      status: Formz.validate([state.email, newPassword, state.confirmPassword])
    ));
  }

  void setConfirmPassword(String confirmPassword) {
    final newConfirmPassword = Password.dirty(confirmPassword);
    emit(state.copyWith(
      confirmPassword: newConfirmPassword,
      status: Formz.validate([state.email, state.password, newConfirmPassword])
    ));
  }

  void setIsOwner(bool isOwner) => emit(state.copyWith(
    isOwner: isOwner
  ));
}
