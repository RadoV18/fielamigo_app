class BioFeaturesDto {
  String bio;
  List<String> imagesPicked;
  List<String> experiences;
  List<String> houseFeatures;

  BioFeaturesDto({
    required this.bio,
    required this.imagesPicked,
    required this.experiences,
    required this.houseFeatures,
  });

  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'imagesPicked': imagesPicked,
      'experiences': experiences,
      'houseFeatures': houseFeatures,
    };
  }

  factory BioFeaturesDto.fromJson(Map<String, dynamic> json) {
    return BioFeaturesDto(
      bio: json['bio'],
      imagesPicked: json['imagesPicked'],
      experiences: json['experiences'],
      houseFeatures: json['houseFeatures'],
    );
  }
}
