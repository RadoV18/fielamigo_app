class AuthDto {
  String? token;
  String? refreshToken;

  AuthDto({
    this.token,
    this.refreshToken,
  });

  AuthDto.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
