import 'date_count.dart';

class CaregiverBookedDatesDto {
  int? maxDogs;
  List<DateCount>? dates;

  CaregiverBookedDatesDto({
    this.maxDogs,
    this.dates,
  });

  factory CaregiverBookedDatesDto.fromJson(Map<String, dynamic> json) => CaregiverBookedDatesDto(
    maxDogs: json["maxDogs"],
    dates: List<DateCount>.from(json["dates"].map((x) => DateCount.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "maxDogs": maxDogs,
    "bookedDates": List<dynamic>.from(dates!.map((x) => x.toJson())),
  };
}