class UserDto {
  String? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? birthDate;
  String? address1;
  String? address2;
  String? zone;
  String? country;
  String? city;
  double? latitude;
  double? longitude;
  bool? isOwner;

  UserDto({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.birthDate,
    this.address1,
    this.address2,
    this.zone,
    this.country,
    this.city,
    this.latitude,
    this.longitude,
    this.isOwner,
  });

  UserDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    birthDate = json['birthDate'];
    address1 = json['address1'];
    address2 = json['address2'];
    zone = json['zone'];
    country = json['country'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isOwner = json['isOwner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['birthDate'] = birthDate;
    data['address1'] = address1;
    data['address2'] = address2;
    data['zone'] = zone;
    data['country'] = country;
    data['city'] = city;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['isOwner'] = isOwner;
    return data;
  }
}
