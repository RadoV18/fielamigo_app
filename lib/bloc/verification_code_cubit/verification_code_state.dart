part of 'verifiaction_code_cubit.dart';

class VerificationCodeState extends Equatable {
  final int verificationCode;
  final PageStatus status;

  const VerificationCodeState({
    this.verificationCode = 0,
    this.status = PageStatus.initial
  });

  VerificationCodeState copyWith({
    int? verificationCode,
    PageStatus? status
  }) =>
    VerificationCodeState(
      verificationCode: verificationCode ?? this.verificationCode,
      status: status ?? this.status
    );

  @override
  List<Object?> get props => [
    verificationCode,
    status
  ];
}
