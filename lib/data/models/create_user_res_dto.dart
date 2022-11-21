class CreateUserResDto {
  final String cookie;

  CreateUserResDto({required this.cookie});

  factory CreateUserResDto.fromJson(Map<String, dynamic> json) {
    return CreateUserResDto(
      cookie: json['cookie'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cookie'] = cookie;
    return data;
  }
}
