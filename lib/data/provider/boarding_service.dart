import 'dart:convert';

import 'package:fielamigo_app/data/models/boarding_service_dto.dart';

import '../models/response_dto.dart';
import 'api.dart';
import 'package:http/http.dart' as http;

class BoardingServiceProvider {
  final String _url = "${Api.url}/caregivers";

  Future<void> setBoardingConfig(
      String token, BoardingServiceDto boardingServiceDto) async {
    final response = await http.post(Uri.parse('"$_url/boarding/services'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(boardingServiceDto.toJson()));

    if (response.statusCode == 200) {
      ResponseDto backendResponse =
          ResponseDto.fromJson(jsonDecode(response.body));
      return backendResponse.data;
    } else {
      throw Exception('Failed to set boarding config');
    }
  }
}
