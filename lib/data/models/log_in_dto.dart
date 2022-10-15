class LogInDto {
  String? email;
  String? password;

  LogInDto({
    required this.email,
    required this.password,
  });

  LogInDto.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
