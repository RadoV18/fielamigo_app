import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/repository/sign_up_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../page_status.dart';

part 'verification_code_state.dart';

class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  VerificationCodeCubit() : super(const VerificationCodeState(verificationCode: 0));
  final SignUpRepository _signUpRepository = SignUpRepository();

  void addNumber(int number) {
    int previous = state.verificationCode;
    emit(state.copyWith(
      verificationCode: (previous * 10) + number
    ));
  }

  void deleteNumber() {
    int previous = state.verificationCode;
    emit(state.copyWith(
      verificationCode: previous ~/ 10
    ));
  }

  void clearNumber() {
    emit(state.copyWith(
      verificationCode: 0
    ));
  }

  void submit() async {
    emit(state.copyWith(status: PageStatus.loading));
    // get cookie from storage
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? cookie = await storage.read(key: "cookie");

    if(cookie == null) {
      throw Exception("Cookie is null");
    }
    print("submitting code: ${state.verificationCode} $cookie" );
    try {
      bool succesful = await _signUpRepository.sendVerificationCode(state.verificationCode, cookie);
      if(succesful) {
        emit(state.copyWith(
          status: PageStatus.success
        ));
      } else {
        emit(state.copyWith(
          status: PageStatus.error
        ));
      }
    } on Exception catch (e) {
      emit(state.copyWith(
        status: PageStatus.error
      ));
      print(e);
    }
  }
}
