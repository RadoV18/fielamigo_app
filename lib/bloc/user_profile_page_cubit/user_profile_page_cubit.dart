import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/models/dog_res_dto.dart';
import 'package:fielamigo_app/data/repository/user_profile_page_repository.dart';

import '../../utils/token_utils.dart';
import '../page_status.dart';

part 'user_profile_page_state.dart';

class UserProfilePageCubit extends Cubit<UserProfilePageState> {
  final UserProfilePageRepository _repository = UserProfilePageRepository();

  UserProfilePageCubit() : super(const UserProfilePageState());

  void init(int caregiverId) async {
    emit(state.copyWith(status: PageStatus.fetching));
    String? token = await TokenUtils.getToken();
    if (token == null) {
      print("error");
      return;
    }
    String? bio = await _repository.getBio(token, caregiverId);
    List<String>? images = await _repository.getImages(token, caregiverId);
    List<DogResDto>? dogs = await _repository.getDogs(token, caregiverId);
    List<String>? experience = await _repository.getExperience(token, caregiverId);
    emit(state.copyWith(
      bio: bio,
      images: images,
      dogs: dogs,
      experience: experience,
      status: PageStatus.initial,
    ));
  }
}
