import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../data/models/email.dart';
import '../../data/models/password.dart';
import '../../data/models/user_dto.dart';
import '../../data/repository/sign_up_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository _signUpRepository = SignUpRepository();

  SignUpCubit() : super(const SignUpState(
    email: Email.pure(),
    password: Password.pure(),
    confirmPassword: Password.pure(),
    isOwner: false,
    isCaregiver: false,
    passwordStrength: '',
    status: FormzStatus.pure,
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

  void setOwner() {
    emit(state.copyWith(
      isOwner: true,
      isCaregiver: false
    ));
  }

  void setCaregiver() {
    emit(state.copyWith(
      isOwner: false,
      isCaregiver: true
    ));
  }

  void setStrength(double strength) {
    String newStrength = '';
    if(strength > 0.75) {
      // green
      newStrength = 'Fuerte';
    } else if(strength > 0.5) {
      // blue
      newStrength = 'Bueno';
    } else if(strength > 0.25) {
      // yellow
      newStrength = 'Moderado';
    } else if(strength > 0){
      // red
      newStrength = 'Débil';
    }
    emit(state.copyWith(
      passwordStrength: newStrength
    ));
  }

  void submit() {
    UserDto user = UserDto(
      email: state.email.value,
      password: state.password.value,
      isOwner: state.isOwner,
    );
    // TODO: uncomment when backend is ready
    // _signUpRepository.signUp(user);
  }
}
