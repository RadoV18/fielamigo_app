import 'date_count.dart';

class CaregiverBookedDatesDto {
  final int? maxDogs;
  final List<DateCount>? dates;

  const CaregiverBookedDatesDto({
    this.maxDogs = -1,
    this.dates = const <DateCount>[],
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