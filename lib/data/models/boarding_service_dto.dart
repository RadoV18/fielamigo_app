class BoardingServiceDto {
  double nightlyRate;
  int maxNumberOfNights;
  int maxNumberOfDogs;
  bool canPickup;
  double pickupRate;

  BoardingServiceDto({
    required this.nightlyRate,
    required this.maxNumberOfNights,
    required this.maxNumberOfDogs,
    required this.canPickup,
    required this.pickupRate,
  });

  factory BoardingServiceDto.fromJson(Map<String, dynamic> json) =>
      BoardingServiceDto(
        nightlyRate: json["nightlyRate"],
        maxNumberOfNights: json["maxNumberOfNights"],
        maxNumberOfDogs: json["maxNumberOfDogs"],
        canPickup: json["canPickup"],
        pickupRate: json["pickupRate"],
      );
  
  Map<String, dynamic> toJson() => {
    "nightlyRate": nightlyRate,
    "maxNumberOfNights": maxNumberOfNights,
    "maxNumberOfDogs": maxNumberOfDogs,
    "canPickup": canPickup,
    "pickupRate": pickupRate,
  };

  void setMaxNights(double v) {}

  void setMaxDogs(double v) {}
}
