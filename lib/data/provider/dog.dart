import 'dart:convert';
import 'dart:io';

import '../models/dog_req_dto.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../models/dog_res_dto.dart';
import '../models/response_dto.dart';
import 'api.dart';

class DogProvider {
  // TODO: uncomment to use with Flutter
  // final String _url = "${Api.url}/dogs";

  // testing url
  final String _url = "http://localhost:8080/api/v1/dogs";

  // POST /dogs
  Future<void> addDog(DogReqDto data, File? image, String token) async {
    var request = http.MultipartRequest("POST", Uri.parse(_url))
    ..headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token'
    });

    request.files.add(
      http.MultipartFile.fromBytes(
        'data',
        utf8.encode(jsonEncode(data.toJson())),
        contentType: MediaType(
          'application',
          'json',
          {'charset': 'utf-8'},
        ),
      )
    );

    if(image != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          image.readAsBytesSync(),
          filename: image.path.split('/').last,
          contentType: MediaType('image', image.path.split(".").last == "jpg" ? "jpeg" : image.path.split(".").last),
        ),
      );
    }

    var response = await request.send();

    if(response.statusCode == 201) {
      print("dog created succesfully");
      return;
    } else {
      throw Exception('Failed to create dog');
    }
  }

  // GET /dogs
  Future<List<DogResDto>> getAllDogs(String token) async {

    final response = await http.get(
      Uri.parse(_url),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json; charset=UTF-8',
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return backendResponse.data.map<DogResDto>((json) => DogResDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load dogs');
    }    
  }

  // GET /dogs/caregiver/{caregiverId}
  Future<List<DogResDto>> getDogsByCaregiverId(String token, int id) async {
    final response = await http.get(
      Uri.parse("$_url/caregiver/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json; charset=UTF-8',
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return backendResponse.data.map<DogResDto>((json) => DogResDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load dogs');
    }
  }

}

// for testing purposes only
void main() async {
  DogProvider dogProvider = DogProvider();

  String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzNCIsImZpcnN0TmFtZSI6Ik1vYmlsZSB0ZXN0IDIiLCJsYXN0TmFtZSI6InRlc3RldCIsImlzT3duZXIiOnRydWUsInJvbGVzIjpbIkdFVF9DSVRJRVMiLCJHRVRfQ09VTlRSSUVTIiwiR0VUX0JSRUVEUyIsIlVQREFURV9QUk9GSUxFIiwiU0VORF9NRVNTQUdFIiwiR0VUX0RPR19CWV9JRCIsIkdFVF9PV05FUl9CT09LSU5HUyIsIkFERF9QQVlNRU5UX01FVEhPRCIsIlZJRVdfVkVURVJJTkFSSUVTIiwiQlVZX0lOU1VSQU5DRSIsIkdFVF9JTlNVUkFOQ0VfUExBTlMiLCJHRVRfUkVWSUVXUyIsIkdFVF9QUk9GSUxFIiwiQk9PS19OVVJTSU5HIiwiU0VBUkNIX05VUlNJTkciLCJCT09LX1RSQUlOSU5HIiwiU0VBUkNIX1RSQUlOSU5HIiwiQk9PS19XQUxLSU5HIiwiU0VBUkNIX1dBTEtJTkciLCJCT09LX0JPQVJESU5HIiwiU0VBUkNIX0JPQVJESU5HIiwiQUREX0RPRyIsIkdFVF9ET0dTIl0sImlzcyI6ImZpZWxhbWlnbyIsImNhcmVnaXZlcklkIjotMSwiZXhwIjoxNjY5MTY0MzUyLCJ1c2VySWQiOjM0fQ.nvrVBOkGMwj-FNNWsmVVCuV7k4E9-vtSoeKlqJrOBbY";
  // open image
  File image = File("C:/Users/Radomir/Desktop/test_img/img.jpg");
  if(image == null) {
    throw Exception("Image not found");
  }
  // new dog
  DogReqDto dog = DogReqDto(
    name: "name",
    breed: 1,
    birthDate: "2021-01-01",
    isMale: true,
    size: 1,
    isSterilized: true,
    notes: "notes",
  );

  // dogProvider.addDog(dog, image, token);
  // List<DogResDto> dogs = await dogProvider.getAllDogs(token);
  List<DogResDto> dogs = await dogProvider.getDogsByCaregiverId(token, 3);

  print(dogs.length);
  // print every dog
  dogs.forEach((dog) {
    print("${dog.name}, ${dog.breed}, ${dog.birthDate}, ${dog.dogId}, ${dog.size}, ${dog.imageUrl}");
  });

}