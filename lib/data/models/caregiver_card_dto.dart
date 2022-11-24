class CaregiverCardDto {
  int? boardingServiceId;
  int? caregiverId;
  String? firstName;
  String? lastName;
  String? imageUrl;
  String? zone;
  String? city;
  int? reviewCount;
  double? rating;
  double? price;
  double? pickupRate;
  bool? isVerified;

  CaregiverCardDto({
    this.boardingServiceId,
    this.caregiverId,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.zone,
    this.city,
    this.reviewCount,
    this.rating,
    this.price,
    this.pickupRate,
    this.isVerified,
  });

  factory CaregiverCardDto.fromJson(Map<String, dynamic> json) => CaregiverCardDto(
    boardingServiceId: json["boardingServiceId"],
    caregiverId: json["caregiverId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    imageUrl: json["imageUrl"],
    zone: json["zone"],
    city: json["city"],
    reviewCount: json["reviewCount"],
    rating: json["rating"].toDouble(),
    price: json["price"].toDouble(),
    pickupRate: json["pickupRate"].toDouble(),
    isVerified: json["isVerified"],
  );

  Map<String, dynamic> toJson() => {
    "boardingServiceId": boardingServiceId,
    "caregiverId": caregiverId,
    "firstName": firstName,
    "lastName": lastName,
    "imageUrl": imageUrl,
    "zone": zone,
    "city": city,
    "reviewCount": reviewCount,
    "rating": rating,
    "price": price,
    "pickupRate": pickupRate,
    "isVerified": isVerified,
  };
}