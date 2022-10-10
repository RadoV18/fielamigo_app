import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'verification_code_state.dart';

class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  VerificationCodeCubit() : super(const VerificationCodeState(verificationCode: 0));

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

  void validate() {
    // TODO: HTTP request to validate
    print(state.verificationCode);
  }
}
