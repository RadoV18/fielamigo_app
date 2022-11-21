class UserDetailsReqDto {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String birthDate;

  UserDetailsReqDto({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.birthDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate,
    };
  }

  factory UserDetailsReqDto.fromJson(Map<String, dynamic> json) {
    return UserDetailsReqDto(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      birthDate: json['birthDate'],
    );
  }
}