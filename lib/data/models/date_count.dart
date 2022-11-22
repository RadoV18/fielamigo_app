class DateCount {
  DateTime date;
  int count;

  DateCount({
    required this.date,
    required this.count,
  });

  factory DateCount.fromJson(Map<String, dynamic> json) => DateCount(
    date: DateTime.parse(json["date"]),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "count": count,
  };
}