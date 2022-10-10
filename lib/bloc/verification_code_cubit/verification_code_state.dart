part of 'verifiaction_code_cubit.dart';

class VerificationCodeState extends Equatable {
  final int verificationCode;

  const VerificationCodeState({
    this.verificationCode = 0,
  });

  VerificationCodeState copyWith({
    int? verificationCode
  }) =>
    VerificationCodeState(
      verificationCode: verificationCode ?? this.verificationCode,
    );

  @override
  List<Object?> get props => [
    verificationCode
  ];
}
