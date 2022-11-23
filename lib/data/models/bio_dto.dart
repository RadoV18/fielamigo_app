import 'dart:io';

class BioDto {
  final String bio;
  final List<String> experience;
  final List<String> houseFeatures;



  BioDto({
    required this.bio,
    required this.experience,
    required this.houseFeatures,
  });

  factory BioDto.fromJson(Map<String, dynamic> json) {
    return BioDto(
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
