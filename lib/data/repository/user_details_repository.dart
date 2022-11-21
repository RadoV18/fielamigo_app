import 'dart:io';

import '../models/user_details_req_dto.dart';
import '../models/user_details_res_dto.dart';
import '../provider/user.dart';

class UserDetailsRepository {
  final _userProvider = UserProvider();

  Future<void> submitUserDetails(UserDetailsReqDto req, File? image, String token) async {
    await _userProvider.submitUserDetails(req, image, token);
  }

  Future<UserDetailsResDto> getUserDetails(String token) async {
    return await _userProvider.getUserDetails(token);
  }
}