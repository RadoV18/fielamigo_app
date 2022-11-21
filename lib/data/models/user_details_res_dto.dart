class UserDetailsResDto {
  final String? imageUrl;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? birthDate;

  UserDetailsResDto({
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.birthDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate,
    };
  }

  factory UserDetailsResDto.fromJson(Map<String, dynamic> json) {
    return UserDetailsResDto(
      imageUrl: json['imageUrl'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      birthDate: json['birthDate'],
    );
  }

}