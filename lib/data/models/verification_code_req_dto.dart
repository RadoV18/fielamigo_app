class VerificationCodeReqDto {
  final int code;
  final String cookie;

  VerificationCodeReqDto({required this.code, required this.cookie});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['cookie'] = cookie;
    return data;
  }

  factory VerificationCodeReqDto.fromJson(Map<String, dynamic> json) {
    return VerificationCodeReqDto(
      code: json['code'],
      cookie: json['cookie'],
    );
  }
}