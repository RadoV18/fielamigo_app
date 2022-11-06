import '../models/new_pet_dto.dart';
import '../provider/pet.dart';

class AddPetRepository {
  final PetProvider _petProvider = PetProvider();

  Future<NewPetDto> addPet(NewPetDto newPetDto) {
    return _petProvider.addPet(newPetDto);
  }
}