import 'package:fielamigo_app/data/provider/dog.dart';

import '../models/dog_res_dto.dart';

class DogRepository {
  final DogProvider _provider = DogProvider();

  Future<List<DogResDto>?> getAllDogs(String token) async {
    return await _provider.getAllDogs(token);
  }

  Future<List<DogResDto>?> getAllCaregiverDogs(String token, int caregiverId) async {
    return await _provider.getDogsByCaregiverId(token, caregiverId);
  }
}