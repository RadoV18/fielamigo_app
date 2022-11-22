class DogResDto {
  int? dogId;
  int? userId;
  String? name;
  DateTime? birthDate;
  String? size;
  String? breed;
  String? imageUrl;

  DogResDto({
    this.dogId,
    this.userId,
    this.name,
    this.birthDate,
    this.size,
    this.breed,
    this.imageUrl,
  });

  factory DogResDto.fromJson(Map<String, dynamic> json) => DogResDto(
    dogId: json["dogId"],
    userId: json["userId"],
    name: json["name"],
    birthDate: DateTime.parse(json["birthDate"]),
    size: json["size"],
    breed: json["breed"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "dogId": dogId,
    "userId": userId,
    "name": name,
    "birthDate": birthDate!.toIso8601String(),
    "size": size,
    "breed": breed,
    "imageUrl": imageUrl,
  };
}