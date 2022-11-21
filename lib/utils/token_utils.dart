import 'package:jwt_decode/jwt_decode.dart';

class TokenUtils {

  static int getUserId(String token) {
    return int.parse(Jwt.parseJwt(token)['sub']);
  }

  static bool checkIsOwner(String token) {
    return Jwt.parseJwt(token)['isOwner'] == true;
  }
}