part of 'verifiaction_code_cubit.dart';

class VerificationCodeState extends Equatable {
  final int verificationCode;
  final bool isValid;

  const VerificationCodeState({
    this.verificationCode = 0,
    this.isValid = false
  });

  VerificationCodeState copyWith({
    int? verificationCode,
    bool? isValid
  }) =>
    VerificationCodeState(
      verificationCode: verificationCode ?? this.verificationCode,
      isValid: isValid ?? this.isValid
    );

  @override
  List<Object?> get props => [
    verificationCode,
    isValid
  ];
}
