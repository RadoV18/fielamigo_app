import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/repository/add_pet_repository.dart';

import '../../data/models/dog_req_dto.dart';
import '../../utils/token_utils.dart';
import '../page_status.dart';

part 'add_pet_state.dart';

class AddPetCubit extends Cubit<AddPetState> {
  final AddPetRepository _addPetRepository = AddPetRepository();

  AddPetCubit() : super(const AddPetState());

  void setImage(File? image) {
    emit(state.copyWith(image: image));
  }

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setBreed(String breed) {
    emit(state.copyWith(breed: breed));
  }

  void setBreedId(int id) {
    emit(state.copyWith(breedId: id));
  }

  void setBirthDate(String birthDate) {
    emit(state.copyWith(birthDate: birthDate));
  }

  void setMale() {
    emit(state.copyWith(
      isMale: true,
      isFemale: false
    ));
  }

  void setFemale() {
    emit(state.copyWith(
      isFemale: true,
      isMale: false
    ));
  }

  void setSmall() {
    emit(state.copyWith(
      isSmall: true,
      isMedium: false,
      isLarge: false
    ));
  }

  void setMedium() {
    emit(state.copyWith(
      isMedium: true,
      isSmall: false,
      isLarge: false
    ));
  }

  void setLarge() {
    emit(state.copyWith(
      isLarge: true,
      isSmall: false,
      isMedium: false
    ));
  }

  void setIsSterilized(bool isSterilized) {
    emit(state.copyWith(isSterilized: isSterilized));
  }

  void setNotes(String notes) {
    emit(state.copyWith(notes: notes));
  }

  void save() async {
    emit(state.copyWith(status: PageStatus.loading));
    // validating fields
    bool ok = true;
    if (state.image == null) {
      ok = false;
    }
    if (state.name.isEmpty) {
      ok = false;
    }
    if (state.breed.isEmpty) {
      ok = false;
    }
    if (state.birthDate.isEmpty) {
      ok = false;
    }
    if(!state.isMale && !state.isFemale) {
      ok = false;
    }
    if(!state.isSmall && !state.isMedium && !state.isLarge) {
      ok = false;
    }

    String? token = await TokenUtils.getToken();
    if (token == null) {
      print("error");
      return;
    }

    if(!ok) {
      emit(state.copyWith(status: PageStatus.error));
      return;
    }
    print("ok");
    bool isMale = state.isMale;
    int size = state.isSmall ? 342 : state.isMedium ? 343 : 344;

    DogReqDto newPetDto = DogReqDto(
      name: state.name,
      breed: state.breedId,
      birthDate: state.birthDate,
      isMale: isMale,
      size: size,
      isSterilized: state.isSterilized,
      notes: state.notes,
    );
    try {
      await _addPetRepository.addPet(newPetDto, state.image!, token);
      emit(state.copyWith(status: PageStatus.success));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.error));
    }
  }

  void clear() {
    emit(const AddPetState());
  }
}
