class BoardingReservationReqDto {
  int boardingServiceId;
  DateTime startingDate;
  DateTime endingDate;
  List<int> dogs;
  bool includePickup;
  int paymentMethodId;
  String notes;

  BoardingReservationReqDto({
    required this.boardingServiceId,
    required this.startingDate,
    required this.endingDate,
    required this.dogs,
    required this.includePickup,
    required this.paymentMethodId,
    required this.notes,
  });

  factory BoardingReservationReqDto.fromJson(Map<String, dynamic> json) =>
    BoardingReservationReqDto(
      boardingServiceId: json["boardingServiceId"],
      startingDate: DateTime.parse(json["startingDate"]),
      endingDate: DateTime.parse(json["endingDate"]),
      dogs: List<int>.from(json["dogs"].map((x) => x)),
      includePickup: json["includePickup"],
      paymentMethodId: json["paymentMethodId"],
      notes: json["notes"],
    );

  Map<String, dynamic> toJson() => {
    "boardingServiceId": boardingServiceId,
    "startingDate": startingDate.toIso8601String(),
    "endingDate": endingDate.toIso8601String(),
    "dogs": List<dynamic>.from(dogs.map((x) => x)),
    "includePickup": includePickup,
    "paymentMethodId": paymentMethodId,
    "notes": notes,
  };

}