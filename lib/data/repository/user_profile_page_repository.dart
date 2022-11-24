import 'package:fielamigo_app/data/provider/dog.dart';

import '../models/dog_res_dto.dart';
import '../provider/caregiver.dart';

class UserProfilePageRepository {
  final CaregiverProvider _provider = CaregiverProvider();
  final DogProvider _dogProvider = DogProvider();

  Future<String?> getBio(String token, int caregiverId) async {
    return await _provider.getCaregiverBio(token, caregiverId);
  }

  Future<List<String>?> getImages(String token, int caregiverId) async {
    return await _provider.getCaregiverPictures(token, caregiverId);
  }

  Future<List<DogResDto>?>getDogs(String token, int caregiverId) async {
    return await _dogProvider.getDogsByCaregiverId(token, caregiverId);
  }

  Future<List<String>?> getExperience(String token, int caregiverId) async {
    return await _provider.getCaregiverExperience(token, caregiverId);
  }

}