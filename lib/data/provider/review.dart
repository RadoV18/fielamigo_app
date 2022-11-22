import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/response_dto.dart';
import '../models/review_dto.dart';
import '../models/review_res_dto.dart';

class ReviewProvider {

  // TODO: uncomment to use with Flutter
  // final String _url = "${Api.url}/reviews";

  // testing url
  final String _url = "http://localhost:8080/api/v1/reviews";

  // GET /reviews/{id}
  Future<ReviewResDto> getCaregiverReviews(String token, int id,
    int limit, int offset
  ) async {
    final response = await http.get(
      Uri.parse("$_url/$id?limit=$limit&offset=$offset"),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return ReviewResDto.fromJson(backendResponse.data);
    } else {
      throw Exception('Failed to get caregiver reviews');
    }
  }
}

void main() async {
  String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzNCIsImZpcnN0TmFtZSI6Ik1vYmlsZSB0ZXN0IDIiLCJsYXN0TmFtZSI6InRlc3RldCIsImlzT3duZXIiOnRydWUsInJvbGVzIjpbIkdFVF9DSVRJRVMiLCJHRVRfQ09VTlRSSUVTIiwiR0VUX0JSRUVEUyIsIlVQREFURV9QUk9GSUxFIiwiU0VORF9NRVNTQUdFIiwiR0VUX0RPR19CWV9JRCIsIkdFVF9PV05FUl9CT09LSU5HUyIsIkFERF9QQVlNRU5UX01FVEhPRCIsIlZJRVdfVkVURVJJTkFSSUVTIiwiQlVZX0lOU1VSQU5DRSIsIkdFVF9JTlNVUkFOQ0VfUExBTlMiLCJHRVRfUkVWSUVXUyIsIkdFVF9QUk9GSUxFIiwiQk9PS19OVVJTSU5HIiwiU0VBUkNIX05VUlNJTkciLCJCT09LX1RSQUlOSU5HIiwiU0VBUkNIX1RSQUlOSU5HIiwiQk9PS19XQUxLSU5HIiwiU0VBUkNIX1dBTEtJTkciLCJCT09LX0JPQVJESU5HIiwiU0VBUkNIX0JPQVJESU5HIiwiQUREX0RPRyIsIkdFVF9ET0dTIl0sImlzcyI6ImZpZWxhbWlnbyIsImNhcmVnaXZlcklkIjotMSwiZXhwIjoxNjY5MTY0MzUyLCJ1c2VySWQiOjM0fQ.nvrVBOkGMwj-FNNWsmVVCuV7k4E9-vtSoeKlqJrOBbY";

  ReviewProvider reviewProvider = ReviewProvider();
  int limit = 5;
  int offset = 0;
  ReviewResDto reviews = await reviewProvider.getCaregiverReviews(token, 1, limit, offset);
  print(reviews.count);
  reviews.data!.forEach((r) => print("${r.reviewId} ${r.comments} ${r.rating} ${r.imageUrl} ${r.firstName} ${r.lastName}"));
}