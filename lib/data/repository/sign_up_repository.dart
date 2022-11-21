
import 'package:fielamigo_app/data/models/create_user_res_dto.dart';

import '../models/response_dto.dart';
import '../models/user_dto.dart';
import '../provider/auth.dart';
import '../provider/user.dart';

class SignUpRepository {
  final _userProvider = UserProvider();
  final _authProvider = AuthProvider();

  Future<CreateUserResDto> signUp(UserDto user) {
    return _userProvider.createUser(user);
  }

  Future<bool> sendVerificationCode(int code, String cookie) {
    return _authProvider.sendVerificationCode(code, cookie);
  }
}