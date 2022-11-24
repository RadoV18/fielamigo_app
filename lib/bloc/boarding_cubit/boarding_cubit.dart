import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/models/caregiver_card_dto.dart';
import 'package:fielamigo_app/data/repository/boarding_repository.dart';
import 'package:fielamigo_app/utils/token_utils.dart';

import '../../data/models/dog_res_dto.dart';
import '../page_status.dart';

part 'boarding_state.dart';

class BoardingCubit extends Cubit<BoardingState> {
  BoardingCubit() : super(const BoardingState(
    dogs: [],
    caregivers: []
  ));

  final BoardingRepository _boardingRepository = BoardingRepository();

  void addDog(DogResDto dog) {
    List<DogResDto> dogs = [...state.dogs, dog];
    emit(state.copyWith(
      dogs: List.of(dogs)
    ));
  }

  void removeDog(int dogId) {
    List<DogResDto> dogs = state.dogs.where((dog) => dog.dogId != dogId).toList();
    emit(state.copyWith(
      dogs: List.of(dogs)
    ));
  }

  bool isDogSelected(int dogId) {
    return state.dogs.any((dog) => dog.dogId == dogId);
  }

  setCityId(int? value) {
    emit(state.copyWith(
      cityId: value
    ));
  }

  setStartingDate(DateTime? value) {
    emit(state.copyWith(
      startingDate: value
    ));
  }

  setEndingDate(DateTime? value) {
    emit(state.copyWith(
      endingDate: value
    ));
  }

  void setNotes(String value) {
    emit(state.copyWith(
      notes: value
    ));
  }

  void selectPaymentMethod(int id) {
    emit(state.copyWith(
      paymentMethod: id
    ));
  }

  void clear() {
    emit(const BoardingState(
      dogs: [],
      caregivers: []
    ));
  }

  void submit() async {
    emit(state.copyWith(
      status: PageStatus.loading
    ));

    String? token = await TokenUtils.getToken();
    if(token == null) {
      // TODO: add error message
      emit(state.copyWith(
        status: PageStatus.error
      ));
    }
    
    List<CaregiverCardDto> caregivers = await _boardingRepository.searchBoarding(
      token!,
      state.startingDate!.toIso8601String().substring(0, 16),
      state.endingDate!.toIso8601String().substring(0, 16),
      state.dogs.length,
      state.cityId!
    );

    emit(state.copyWith(
      caregivers: List.of(caregivers),
      status: PageStatus.success
    ));
  }

  void setPickup(bool value) {
    emit(state.copyWith(
      pickup: value
    ));
  }

  void confirm() {
    emit(state.copyWith(
      status: PageStatus.submitting
    ));

    Future.delayed(const Duration(seconds: 3), () {
      emit(state.copyWith(
        status: PageStatus.finished
      ));
    });
  }

}
