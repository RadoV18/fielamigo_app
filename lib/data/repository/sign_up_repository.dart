
import '../models/user_dto.dart';
import '../provider/user.dart';

class SignUpRepository {
  final _userProvider = UserProvider();

  Future<UserDto> signUp(UserDto user) {
    return _userProvider.createUser(user);
  }
}