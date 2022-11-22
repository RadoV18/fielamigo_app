import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/auth_dto.dart';
import '../models/log_in_dto.dart';
import '../models/response_dto.dart';
import '../models/verification_code_req_dto.dart';
import './api.dart';

class AuthProvider {
  final String _url = "${Api.url}/auth";

  // POST /auth/login
  Future<AuthDto> login(LogInDto loginDto) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginDto.toJson()),
    );
    ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return AuthDto.fromJson(backendResponse.data);
    } else {
      throw Exception('Failed to login');
    }
  }

  // POST /auth/verification-code
  Future<bool> sendVerificationCode(int code, String cookie) async {
    VerificationCodeReqDto req = VerificationCodeReqDto(code: code, cookie: cookie);

    final response = await http.post(
      Uri.parse('$_url/verification-code'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(req.toJson())
    );

    ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));

    if(response.statusCode == 200) {
      return true;
    } else {
      throw Exception(backendResponse.message);
    }
  }
}