import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_dto.dart';

class UserProvider {
  final String _url = 'http://10.0.2.2:8080/api/v1/users';
  
  Future<UserDto> createUser(UserDto user) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if(response.statusCode == 201) {
      return UserDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }
} 
