// class AuthProvider {
//   final String _url = 'http://localhost:8080/api/v1/auth';

  // Future<AuthDto> login(LoginDto loginDto) async {
  //   final response = await http.post(
  //     Uri.parse(_url),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(loginDto.toJson()),
  //   );

  //   if (response.statusCode == 200) {
  //     return AuthDto.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to login');
  //   }
  // }
// }