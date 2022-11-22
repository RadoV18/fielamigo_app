import 'dart:convert';

import 'package:fielamigo_app/data/models/caregiver_booked_dates_dto.dart';

import '../models/caregiver_card_dto.dart';
import 'package:http/http.dart' as http;
import '../models/response_dto.dart';
import 'api.dart';

class CaregiverProvider {

  // TODO: uncomment to use with Flutter
  // final String _url = "${Api.url}/caregivers";

  // testing url
  final String _url = "http://localhost:8080/api/v1/caregivers";

  // GET /caregivers/boarding - Search
  Future<List<CaregiverCardDto>> searchBoarding(
    String token, String startingDate, String endingDate,
    int dogCount, int cityId
  ) async {
    Map<String, String> queryParams = {
      'starting': startingDate,
      'ending': endingDate,
      'dogCount': dogCount.toString(),
      'cityId': cityId.toString(),
    };

    final response = await http.get(
      Uri.parse("$_url/boarding?${Uri(queryParameters: queryParams).query}"),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return backendResponse.data.map<CaregiverCardDto>((json) => CaregiverCardDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search boarding');
    }
  }

  // GET /caregiver/{id}/bio
  Future<String> getCaregiverBio(String token, int id) async {
    final response = await http.get(
      Uri.parse("$_url/$id/bio"),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return backendResponse.data;
    } else {
      throw Exception('Failed to get caregiver bio');
    }
  }

  // GET /caregiver/{id}/pictures
  Future<List<String>> getCaregiverPictures(String token, int id) async {
    final response = await http.get(
      Uri.parse("$_url/$id/pictures"),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return backendResponse.data.map<String>((json) => json.toString()).toList();
    } else {
      throw Exception('Failed to get caregiver pictures');
    }
  }

  // GET /caregiver/{id}/experience
  Future<List<String>>  getCaregiverExperience(String token, int id) async {
    final response = await http.get(
      Uri.parse("$_url/$id/experience"),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return backendResponse.data.map<String>((json) => json.toString()).toList();
    } else {
      throw Exception('Failed to get caregiver experience');
    }
  }

  // GET /caregiver/{id}/boarding/booked-dates
  Future<CaregiverBookedDatesDto> getCaregiverBookedDates(
    String token, int id, int month, int year
  ) async {
    final response = await http.get(
      Uri.parse("$_url/$id/boarding/booked-dates?month=$month&year=$year"),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return CaregiverBookedDatesDto.fromJson(backendResponse.data);
    } else {
      throw Exception('Failed to get caregiver booked dates');
    }
  }
}

// For testing purposes only
void main() async {
  CaregiverProvider caregiverProvider = CaregiverProvider();

  String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzNCIsImZpcnN0TmFtZSI6Ik1vYmlsZSB0ZXN0IDIiLCJsYXN0TmFtZSI6InRlc3RldCIsImlzT3duZXIiOnRydWUsInJvbGVzIjpbIkdFVF9DSVRJRVMiLCJHRVRfQ09VTlRSSUVTIiwiR0VUX0JSRUVEUyIsIlVQREFURV9QUk9GSUxFIiwiU0VORF9NRVNTQUdFIiwiR0VUX0RPR19CWV9JRCIsIkdFVF9PV05FUl9CT09LSU5HUyIsIkFERF9QQVlNRU5UX01FVEhPRCIsIlZJRVdfVkVURVJJTkFSSUVTIiwiQlVZX0lOU1VSQU5DRSIsIkdFVF9JTlNVUkFOQ0VfUExBTlMiLCJHRVRfUkVWSUVXUyIsIkdFVF9QUk9GSUxFIiwiQk9PS19OVVJTSU5HIiwiU0VBUkNIX05VUlNJTkciLCJCT09LX1RSQUlOSU5HIiwiU0VBUkNIX1RSQUlOSU5HIiwiQk9PS19XQUxLSU5HIiwiU0VBUkNIX1dBTEtJTkciLCJCT09LX0JPQVJESU5HIiwiU0VBUkNIX0JPQVJESU5HIiwiQUREX0RPRyIsIkdFVF9ET0dTIl0sImlzcyI6ImZpZWxhbWlnbyIsImNhcmVnaXZlcklkIjotMSwiZXhwIjoxNjY5MTY0MzUyLCJ1c2VySWQiOjM0fQ.nvrVBOkGMwj-FNNWsmVVCuV7k4E9-vtSoeKlqJrOBbY";
  int id = 3;

  // List<CaregiverCardDto> caregivers = await caregiverProvider.searchBoarding(token, "2021-11-15T00:00", "2021-11-18T00:00", 2, 336);
  // caregivers.forEach((c) {
  //   print("${c.firstName} ${c.lastName} ${c.reviewCount} ${c.rating} ${c.imageUrl}");
  // });

  // print(await caregiverProvider.getCaregiverBio(token, id));

  // print(await caregiverProvider.getCaregiverPictures(token, 2));
  // print(await caregiverProvider.getCaregiverExperience(token, 2));
  CaregiverBookedDatesDto res = await caregiverProvider.getCaregiverBookedDates(token, 2, 11, 2022);
}