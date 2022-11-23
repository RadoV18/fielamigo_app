import 'dart:io';

class BioReqDto {
  final String bio;
  final List<String> experience;
  final List<String> houseFeatures;



  BioReqDto({
    required this.bio,
    required this.experience,
    required this.houseFeatures,
  });

  factory BioReqDto.fromJson(Map<String, dynamic> json) {
    return BioReqDto(
      bio: json['bio'],
      experience: json['experience'].cast<String>(),
      houseFeatures: json['houseFeatures'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'experience': experience,
      'houseFeatures': houseFeatures,
    };
  }
}
