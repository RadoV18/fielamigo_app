import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:formz/formz.dart';

import '../../data/models/create_user_res_dto.dart';
import '../../data/models/email.dart';
import '../../data/models/password.dart';
import '../../data/models/user_dto.dart';
import '../../data/repository/sign_up_repository.dart';
import '../page_status.dart';

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
    status: PageStatus.initial,
    formStatus: FormzStatus.pure,
  ));

  void setEmail(String email) {
    final newEmail = Email.dirty(email);
    emit(state.copyWith(
      email: newEmail,
      formStatus: Formz.validate([newEmail, state.password, state.confirmPassword])
    ));
  }

  void setPassword(String password) {
    final newPassword = Password.dirty(password);
    emit(state.copyWith(
      password: newPassword,
      formStatus: Formz.validate([state.email, newPassword, state.confirmPassword])
    ));
  }

  void setConfirmPassword(String confirmPassword) {
    final newConfirmPassword = Password.dirty(confirmPassword);
    emit(state.copyWith(
      confirmPassword: newConfirmPassword,
      formStatus: Formz.validate([state.email, state.password, newConfirmPassword])
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

  Future<void> submit() async {
    emit(state.copyWith(
      status: PageStatus.loading
    ));
    UserDto user = UserDto(
      email: state.email.value,
      password: state.password.value,
      isOwner: state.isOwner,
    );
    try {
      CreateUserResDto response = await _signUpRepository.signUp(user);
      if(response.cookie != null) {
        FlutterSecureStorage storage = const FlutterSecureStorage();
        storage.write(key: "cookie", value: response.cookie);
        emit(state.copyWith(
          status: PageStatus.success
        ));
      } else {
        emit(state.copyWith(
          status: PageStatus.error
        ));
        throw Exception('Failed to create user');
      }
    } on Exception catch (e) {
      emit(state.copyWith(
        status: PageStatus.error
      ));
      print(e);
    }
  }
}
