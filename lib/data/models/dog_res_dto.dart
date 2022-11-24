class DogResDto {
  int? dogId;
  int? userId;
  String? name;
  DateTime? birthDate;
  String? size;
  String? breed;
  String? notes;
  bool isSterilized;
  bool isMale;
  String? imageUrl;

  DogResDto({
    this.dogId,
    this.userId,
    this.name,
    this.birthDate,
    this.size,
    this.breed,
    this.notes,
    this.isSterilized = false,
    this.isMale = true,
    this.imageUrl,
  });

  factory DogResDto.fromJson(Map<String, dynamic> json) => DogResDto(
    dogId: json["dogId"],
    userId: json["userId"],
    name: json["name"],
    birthDate: DateTime.parse(json["birthDate"]),
    size: json["size"],
    breed: json["breed"],
    notes: json["notes"],
    isSterilized: json["isSterilized"] ?? false,
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "dogId": dogId,
    "userId": userId,
    "name": name,
    "birthDate": birthDate!.toIso8601String(),
    "size": size,
    "breed": breed,
    "notes": notes,
    "isSterilized": isSterilized,
    "imageUrl": imageUrl,
  };
}