import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/repository/add_pet_repository.dart';

import '../../data/models/new_pet_dto.dart';

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

  void save() {
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

    if(!ok) {
      return;
    }
    print("ok");
    bool isMale = state.isMale;
    int size = state.isSmall ? 1 : state.isMedium ? 2 : 3;

    NewPetDto newPetDto = NewPetDto(
      // TODO: get user id from auth token
      userId: '1',
      name: state.name,
      breed: state.breed,
      birthDate: state.birthDate,
      isMale: isMale,
      size: size,
      isSterilized: state.isSterilized,
      notes: state.notes,
      image: state.image!
    );
    _addPetRepository.addPet(newPetDto);
  }
}
