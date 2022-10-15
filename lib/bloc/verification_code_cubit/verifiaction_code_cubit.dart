import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/repository/sign_up_repository.dart';

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

  void submit() async {
    // TODO: uncomment when backend is ready
    // bool res = await _signUpRepository.sendVerificationCode(state.verificationCode);
    // if(res) {
    //   emit(state.copyWith(
    //     isValid: true
    //   ));
    // } else {
    //   emit(state.copyWith(
    //     isValid: false
    //   ));
    // }
  }
}
