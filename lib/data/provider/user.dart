import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/create_user_res_dto.dart';
import '../models/response_dto.dart';
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
} 
