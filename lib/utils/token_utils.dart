import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class TokenUtils {

  static int getUserId(String token) {
    return int.parse(Jwt.parseJwt(token)['sub']);
  }

  static bool checkIsOwner(String token) {
    return Jwt.parseJwt(token)['isOwner'] == true;
  }

  static bool isTokenValid(String token) {
    return !Jwt.isExpired(token);
  }

  static String? getFirstName(token) {
    if (token != null) {
      return Jwt.parseJwt(token)['firstName'];
    }
    return null;
  }

  static Future<String?> getToken() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return await storage.read(key: "token");
  }
}