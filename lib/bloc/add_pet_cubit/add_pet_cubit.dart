import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_pet_state.dart';

class AddPetCubit extends Cubit<AddPetState> {
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
    print("new date");
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
    print(state);
  }
}
