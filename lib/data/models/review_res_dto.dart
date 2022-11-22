import 'package:fielamigo_app/data/models/review_dto.dart';

class ReviewResDto {
  List<ReviewDto>? data;
  int count;
  int offset;
  int limit;
  int total;

  ReviewResDto({
    this.data,
    required this.count,
    required this.offset,
    required this.limit,
    required this.total,
  });

  factory ReviewResDto.fromJson(Map<String, dynamic> json) {
    print(json["data"].runtimeType);
    return ReviewResDto(
    data: List<ReviewDto>.from(json["data"].map((x) => ReviewDto.fromJson(x))),
    count: json["count"],
    offset: json["offset"],
    limit: json["limit"],
    total: json["total"],
  );
  }

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "count": count,
    "offset": offset,
    "limit": limit,
    "total": total,
  };

}