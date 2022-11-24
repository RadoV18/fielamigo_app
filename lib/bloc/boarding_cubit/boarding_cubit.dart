import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/models/caregiver_card_dto.dart';
import 'package:fielamigo_app/data/repository/boarding_repository.dart';
import 'package:fielamigo_app/utils/token_utils.dart';

import '../page_status.dart';

part 'boarding_state.dart';

class BoardingCubit extends Cubit<BoardingState> {
  BoardingCubit() : super(const BoardingState(
    dogs: [],
    caregivers: []
  ));

  final BoardingRepository _boardingRepository = BoardingRepository();

  void addDog(int dogId) {
    List<int> dogs = [...state.dogs, dogId];
    emit(state.copyWith(
      dogs: List.of(dogs)
    ));
  }

  void removeDog(int dogId) {
    List<int> dogs = [...state.dogs, dogId];
    emit(state.copyWith(
      dogs: List.of(dogs)
    ));
  }

  bool isDogSelected(int dogId) {
    return state.dogs.contains(dogId);
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
}
