import 'dart:io';

import '../models/dog_req_dto.dart';
import '../provider/dog.dart';

class AddPetRepository {
  final DogProvider _dogProvider = DogProvider();

  Future<void> addPet(DogReqDto newPetDto, File? image, String token) async {
    return _dogProvider.addDog(newPetDto, image, token);
  }
}