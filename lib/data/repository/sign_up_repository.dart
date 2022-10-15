
import '../models/user_dto.dart';
import '../provider/auth.dart';
import '../provider/user.dart';

class SignUpRepository {
  final _userProvider = UserProvider();
  final _authProvider = AuthProvider();

  Future<UserDto> signUp(UserDto user) {
    return _userProvider.createUser(user);
  }

  Future<bool> sendVerificationCode(int code) {
    return _authProvider.sendVerificationCode(code);
  }
}