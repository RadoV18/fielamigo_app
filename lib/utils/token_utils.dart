import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class TokenUtils {

  static int? getUserId(String? token) {
    if(token != null) {
      return int.parse(Jwt.parseJwt(token)['sub']);
    }
    return null;
  }

  static int? getCaregiverId(String? token) {
    if(token != null) {
      return int.parse(Jwt.parseJwt(token)['caregiverId']);
    }
    return null;
  }

  static bool checkIsOwner(String token) {
    return Jwt.parseJwt(token)['isOwner'] == true;
  }

  static bool isTokenValid(String token) {
    return !Jwt.isExpired(token);
  }

  static String? getFirstName(String? token) {
    if (token != null) {
      return Jwt.parseJwt(token)['firstName'];
    }
    return null;
  }

  static String? getLastName(String? token) {
    if (token != null) {
      return Jwt.parseJwt(token)['lastName'];
    }
    return null;
  }

  static Future<String?> getToken(String s) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return await storage.read(key: "token");
  }
}