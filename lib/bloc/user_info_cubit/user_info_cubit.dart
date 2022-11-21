import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../utils/token_utils.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(const UserInfoState());

  void setUserInfo(int? userId, String? firstName, String? lastName) {
    emit(UserInfoState(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
    ));
  }

  void init() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "token");
    int? userId = TokenUtils.getUserId(token);
    String? firstName = TokenUtils.getFirstName(token);
    String? lastName = TokenUtils.getLastName(token);
    emit(UserInfoState(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
    ));
  }

  void clear() {
    emit(const UserInfoState());
  }

}
