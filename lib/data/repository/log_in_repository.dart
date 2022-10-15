import '../models/auth_dto.dart';
import '../models/log_in_dto.dart';
import '../provider/auth.dart';

class LogInRepository {
  final AuthProvider _authProvider = AuthProvider();

  Future<AuthDto> logIn(LogInDto logInDto) {
    return _authProvider.login(logInDto);
  }
}