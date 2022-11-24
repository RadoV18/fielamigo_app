class BoardingReqDto {
  final int boardingServiceId;
  final DateTime startingDate;
  final DateTime endingDate;
  final List<int> dogs;
  final bool includePickup;
  final int paymentMethodId;
  final String notes;

  BoardingReqDto({
    required this.boardingServiceId,
    required this.startingDate,
    required this.endingDate,
    required this.dogs,
    required this.includePickup,
    required this.paymentMethodId,
    required this.notes
  });

  Map<String, dynamic> toJson() {
    return {
      'boardingServiceId': boardingServiceId,
      'startingDate': startingDate.toIso8601String(),
      'endingDate': endingDate.toIso8601String(),
      'dogs': dogs,
      'includePickup': includePickup,
      'paymentMethodId': paymentMethodId,
      'notes': notes
    };
  }

  factory BoardingReqDto.fromJson(Map<String, dynamic> json) {
    return BoardingReqDto(
      boardingServiceId: json['boardingServiceId'],
      startingDate: json['staringDate'],
      endingDate: json['endingDate'],
      dogs: json['dogs'].cast<int>(),
      includePickup: json['includePickup'],
      paymentMethodId: json['paymentMethodId'],
      notes: json['notes']
    );
  }
}