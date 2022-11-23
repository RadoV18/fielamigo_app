import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/provider/user.dart';

import '../../utils/token_utils.dart';

part 'profile_picture_state.dart';

class ProfilePictureCubit extends Cubit<ProfilePictureState> {
  ProfilePictureCubit() : super(const ProfilePictureState());

  void init() async {
    String? token = await TokenUtils.getToken();
    int? userId = TokenUtils.getUserId(token);

    if(userId != null && token != null) {
      String? imageUrl = await UserProvider().getProfilePicture(token, userId);
      print("IMAGE UrL $imageUrl");
      emit(ProfilePictureState(imageUrl: imageUrl, userId: userId));
    }
  }
}
