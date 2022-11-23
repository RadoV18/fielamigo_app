import 'dart:convert';
import 'dart:io';
import 'package:fielamigo_app/data/models/user_details_req_dto.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../models/create_user_res_dto.dart';
import '../models/response_dto.dart';
import '../models/user_details_res_dto.dart';
import '../models/user_dto.dart';
import 'api.dart';

class UserProvider {
  final String _url = "${Api.url}/users";
  
  Future<CreateUserResDto> createUser(UserDto user) async {
    CreateUserResDto result;

    final response = await http.post(
      Uri.parse(_url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if(response.statusCode == 201) {
      print("user created succesfully");

      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      if(backendResponse.succesful) {
        result = CreateUserResDto.fromJson(backendResponse.data);
        return result;
      } else {
        throw Exception(backendResponse.message);
      }
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<void> submitUserDetails(UserDetailsReqDto req, File? image, String token) async {
    var request = http.MultipartRequest("POST", Uri.parse("$_url/details"))
      ..headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token'
      });

    request.files.add(
      http.MultipartFile.fromBytes(
        'data',
        utf8.encode(jsonEncode(req.toJson())),
        contentType: MediaType(
          'application',
          'json',
          {'charset': 'utf-8'},
        ),
      ),
    );
    if(image != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          image.readAsBytesSync(),
          filename: image.path.split("/").last,
          contentType: MediaType('image', image.path.split(".").last == "jpg" ? "jpeg" : image.path.split(".").last),
        ),
      );
    }
    var response = await request.send();

    if(response.statusCode == 201) {
      print("user details submitted succesfully");
    } else {
      throw Exception('Failed to submit user details');
    }
  }

  Future<UserDetailsResDto> getUserDetails(String token) async {
    UserDetailsResDto result;

    final response = await http.get(
      Uri.parse("$_url/details"),
      headers: <String, String> {
        'Authorization': 'Bearer $token'
      },
    );

    if(response.statusCode == 200) {
      print("user details fetched succesfully");

      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      if(backendResponse.succesful) {
        result = UserDetailsResDto.fromJson(backendResponse.data);
        return result;
      } else {
        throw Exception(backendResponse.message);
      }
    } else if(response.statusCode == 404) {
      return UserDetailsResDto();
    } else {
      throw Exception('Failed to get user details');
    }
  }

  Future<String?> getProfilePicture(String token, int userId) async {
    String? result = null;
    
    final response = http.get(
      Uri.parse("$_url/$userId/profile-picture"),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );

    if((await response).statusCode == 200) {
      print("profile picture fetched succesfully");

      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode((await response).body));
      if(backendResponse.succesful) {
        result = backendResponse.data;
        return result;
      } else {
        throw Exception(backendResponse.message);
      }
    } else if((await response).statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to get profile picture');
    }
  }
} 
