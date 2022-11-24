class AddressReqDto {
  final String address1;
  final String address2;
  final String zone;
  final int cityId;
  final int countryId;

  AddressReqDto({
    required this.address1,
    required this.address2,
    required this.zone,
    required this.cityId,
    required this.countryId,
  });

  Map<String, dynamic> toJson() => {
    'address1': address1,
    'address2': address2,
    'zone': zone,
    'cityId': cityId,
    'countryId': countryId,
  };

  factory AddressReqDto.fromJson(Map<String, dynamic> json) => AddressReqDto(
    address1: json['address1'],
    address2: json['address2'],
    zone: json['zone'],
    cityId: json['cityId'],
    countryId: json['countryId'],
  );

}
