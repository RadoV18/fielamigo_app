import '../models/boarding_req_dto.dart';
import '../models/boarding_reservation_req_dto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api.dart';

class BoardingReservationProvider {

  // TODO: uncomment to use with flutter
  final String _url = "${Api.url}/boarding-reservations";

  // testing url
  // final String _url = "http://localhost:8080/api/v1/boarding-reservations";

  // POST /boarding-reservations
  Future<void> createBoardingReservation(String token, BoardingReqDto req) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json;charset=UTF-8',
      },
      body: jsonEncode(req.toJson())
    );

    if(response.statusCode == 201) {
      return;
    } else {
      throw Exception('Failed to create boarding reservation');
    }
  }
}

// for testing purposes only
void main() async {
  // BoardingReservationProvider boardingReservation = BoardingReservationProvider();
  // String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzNCIsImZpcnN0TmFtZSI6Ik1vYmlsZSB0ZXN0IDIiLCJsYXN0TmFtZSI6InRlc3RldCIsImlzT3duZXIiOnRydWUsInJvbGVzIjpbIkdFVF9DSVRJRVMiLCJHRVRfQ09VTlRSSUVTIiwiR0VUX0JSRUVEUyIsIlVQREFURV9QUk9GSUxFIiwiU0VORF9NRVNTQUdFIiwiR0VUX0RPR19CWV9JRCIsIkdFVF9PV05FUl9CT09LSU5HUyIsIkFERF9QQVlNRU5UX01FVEhPRCIsIlZJRVdfVkVURVJJTkFSSUVTIiwiQlVZX0lOU1VSQU5DRSIsIkdFVF9JTlNVUkFOQ0VfUExBTlMiLCJHRVRfUkVWSUVXUyIsIkdFVF9QUk9GSUxFIiwiQk9PS19OVVJTSU5HIiwiU0VBUkNIX05VUlNJTkciLCJCT09LX1RSQUlOSU5HIiwiU0VBUkNIX1RSQUlOSU5HIiwiQk9PS19XQUxLSU5HIiwiU0VBUkNIX1dBTEtJTkciLCJCT09LX0JPQVJESU5HIiwiU0VBUkNIX0JPQVJESU5HIiwiQUREX0RPRyIsIkdFVF9ET0dTIl0sImlzcyI6ImZpZWxhbWlnbyIsImNhcmVnaXZlcklkIjotMSwiZXhwIjoxNjY5MjQzMTMyLCJ1c2VySWQiOjM0fQ.jJaFtSr5-_CgpZixf8wD5zIfnYJtB7HS6tuz76okZUk";
  // BoardingReservationReqDto req = BoardingReservationReqDto(
  //   boardingServiceId: 2,
  //   startingDate: DateTime(2022, 11, 15),
  //   endingDate: DateTime(2022, 11, 16),
  //   dogs: [1, 2],
  //   includePickup: false,
  //   paymentMethodId: 2,
  //   notes: "notes",
  // );
  // boardingReservation.createBoardingReservation(req, token);
}