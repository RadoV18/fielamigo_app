import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../utils/token_utils.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(const UserInfoState(isOwner: false));

  void setUserInfo(int? userId, String? firstName, String? lastName, bool isOwner) {
    emit(UserInfoState(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      isOwner: isOwner,
    ));
  }

  void init() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "token");
    int? userId = TokenUtils.getUserId(token);
    String? firstName = TokenUtils.getFirstName(token);
    String? lastName = TokenUtils.getLastName(token);
    bool? isOwner = TokenUtils.checkIsOwner(token!);
    emit(UserInfoState(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      isOwner: isOwner,
    ));
  }

  void clear() {
    emit(const UserInfoState(isOwner: false));
  }

}
