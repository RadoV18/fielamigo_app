import 'dart:convert';
import 'dart:io';

import 'package:fielamigo_app/data/models/caregiver_booked_dates_dto.dart';
import 'package:http_parser/http_parser.dart';

import '../models/bio_req_dto.dart';
import '../models/caregiver_card_dto.dart';
import 'package:http/http.dart' as http;
import '../models/response_dto.dart';
import 'api.dart';

class CaregiverProvider {

  final String _url = "${Api.url}/caregivers";

  // testing url
  // final String _url = "http://localhost:8080/api/v1/caregivers";

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
      if(backendResponse.succesful) {
        return backendResponse.data.map<CaregiverCardDto>((json) => CaregiverCardDto.fromJson(json)).toList();
      } else {
        throw Exception(backendResponse.message);
      }
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

  // GET/caregivers/{id}/house-details
  Future<List<String>> getHouseDetails(String token, int id) async {
    final response = await http.get(
      Uri.parse("$_url/$id/house-details"),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return backendResponse.data.map<String>((json) => json.toString()).toList();
    } else {
      throw Exception('Failed to get caregiver house details');
    }
  }

  // POST /caregivers/pictures
  Future<void> uploadPicture(String token, File? image) async {
    if(image == null) {
      throw Exception('Image is null');
    }

    var request = http.MultipartRequest("POST", Uri.parse("$_url/pictures"))
    ..headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token'
    });

    request.files.add(
      http.MultipartFile.fromBytes(
        'image',
        image.readAsBytesSync(),
        filename: image.path.split('/').last,
        contentType: MediaType('image', image.path.split(".").last == "jpg" ? "jpeg" : image.path.split(".").last),
      )
    );

    var response = await request.send();

    if(response.statusCode != 201) {
      print(response.statusCode);
      throw Exception('Failed to upload picture');
    }
  }

  postCaregiverNewBio(String token, BioReqDto req) async {
    final response = await http.post(
      Uri.parse("$_url/bio-details"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode(req.toJson())
    );

    if(response.statusCode != 201) {
      throw Exception('Failed to post caregiver new bio');
    }
  }

}

// For testing purposes only
void main() async {
  CaregiverProvider caregiverProvider = CaregiverProvider();

  String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI3NyIsImlzT3duZXIiOmZhbHNlLCJyb2xlcyI6WyJHRVRfQ0lUSUVTIiwiR0VUX0NPVU5UUklFUyIsIlVQREFURV9QUk9GSUxFIiwiU0VORF9NRVNTQUdFIiwiRklOSVNIX0JPT0tJTkciLCJHRVRfRE9HX0JZX0lEIiwiUkVKRUNUX0JPT0tJTkciLCJDT05GSVJNX0JPT0tJTkciLCJHRVRfQ0FSRUdJVkVSX0JPT0tJTkdTIiwiQUREX0hPVVNFX0RFVEFJTFMiLCJBRERfRVhQRVJJRU5DRSIsIlVQREFURV9OVVJTSU5HIiwiVVBEQVRFX1dBTEtJTkciLCJVUERBVEVfVFJBSU5JTkciLCJVUERBVEVfQk9BUkRJTkciLCJDUkVBVEVfTlVSU0lORyIsIkNSRUFURV9XQUxLSU5HIiwiQ1JFQVRFX1RSQUlOSU5HIiwiQ1JFQVRFX0JPQVJESU5HIiwiVVBEQVRFX0JPT0tJTkciLCJDQU5DRUxfQk9PS0lORyIsIkdFVF9SRVZJRVdTIiwiR0VUX1BST0ZJTEUiLCJHRVRfRE9HUyJdLCJpc3MiOiJmaWVsYW1pZ28iLCJjYXJlZ2l2ZXJJZCI6OSwiZXhwIjoxNjY5MjQ2NDY4LCJ1c2VySWQiOjc3fQ.xrPnHp1vP_Z0UbZkxI2L23vAmIp6oZZjyRSVpitFtCM";
  int id = 3;

  // List<CaregiverCardDto> caregivers = await caregiverProvider.searchBoarding(token, "2021-11-15T00:00", "2021-11-18T00:00", 2, 336);
  // caregivers.forEach((c) {
  //   print("${c.firstName} ${c.lastName} ${c.reviewCount} ${c.rating} ${c.imageUrl}");
  // });

  // print(await caregiverProvider.getCaregiverBio(token, id));

  // print(await caregiverProvider.getCaregiverPictures(token, 9));
  // print(await caregiverProvider.getCaregiverExperience(token, 2));
  // CaregiverBookedDatesDto res = await caregiverProvider.getCaregiverBookedDates(token, 2, 11, 2022);
  // List<String> res = await caregiverProvider.getHouseDetails(token, 2);
  // File image = File("C:/Users/Radomir/Desktop/test_img/img.jpg");
  // await caregiverProvider.uploadPicture(token, image);

  BioReqDto req = BioReqDto(
    bio: "bio from frontend",
    experience: [
      "experience from frontend 1",
      "experience from frontend 2",
      "experience from frontend 3"
    ],
    houseFeatures: [
      "house features from frontend 1",
      "house features from frontend 2",
      "house features from frontend 3"
    ]
  );

  await caregiverProvider.postCaregiverNewBio(token, req);
}