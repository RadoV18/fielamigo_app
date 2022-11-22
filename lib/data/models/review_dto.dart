class ReviewDto {
  int reviewId;
  int rating;
  String comments;
  String firstName;
  String lastName;
  String? imageUrl;

  ReviewDto({
    required this.reviewId,
    required this.rating,
    required this.comments,
    required this.firstName,
    required this.lastName,
    this.imageUrl,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) => ReviewDto(
    reviewId: json["reviewId"],
    rating: json["rating"],
    comments: json["comments"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "reviewId": reviewId,
    "rating": rating,
    "comments": comments,
    "firstName": firstName,
    "lastName": lastName,
    "imageUrl": imageUrl,
  };

}