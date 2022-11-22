class CaregiverCardDto {
  int? caregiverId;
  String? firstName;
  String? lastName;
  String? imageUrl;
  String? zone;
  String? city;
  int? reviewCount;
  double? rating;
  double? price;
  bool? isVerified;

  CaregiverCardDto({
    this.caregiverId,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.zone,
    this.city,
    this.reviewCount,
    this.rating,
    this.price,
    this.isVerified,
  });

  factory CaregiverCardDto.fromJson(Map<String, dynamic> json) => CaregiverCardDto(
    caregiverId: json["caregiverId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    imageUrl: json["imageUrl"],
    zone: json["zone"],
    city: json["city"],
    reviewCount: json["reviewCount"],
    rating: json["rating"].toDouble(),
    price: json["price"].toDouble(),
    isVerified: json["isVerified"],
  );

  Map<String, dynamic> toJson() => {
    "caregiverId": caregiverId,
    "firstName": firstName,
    "lastName": lastName,
    "imageUrl": imageUrl,
    "zone": zone,
    "city": city,
    "reviewCount": reviewCount,
    "rating": rating,
    "price": price,
    "isVerified": isVerified,
  };
}