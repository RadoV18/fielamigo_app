import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/auth_dto.dart';
import '../models/log_in_dto.dart';
import './api.dart';

class AuthProvider {
  final String _url = "${Api.url}/auth";

  Future<AuthDto> login(LogInDto loginDto) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginDto.toJson()),
    );

    if (response.statusCode == 200) {
      return AuthDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<bool> sendVerificationCode(int code) async {
    final response = await http.post(
      Uri.parse('$_url/email-verification-code'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"code": code})
    );

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}