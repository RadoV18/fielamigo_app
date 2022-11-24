import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/models/caregiver_card_dto.dart';
import 'package:fielamigo_app/data/repository/boarding_repository.dart';
import 'package:fielamigo_app/utils/token_utils.dart';

import '../../data/models/boarding_req_dto.dart';
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

  void setBoardingServiceId(int? value) {
    emit(state.copyWith(
      boardingServiceId: value
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

  void confirm() async {
    emit(state.copyWith(
      status: PageStatus.submitting
    ));

    String? token = await TokenUtils.getToken();
    if(token == null) {
      print("error");
      return;
    }

    BoardingReqDto req = BoardingReqDto(
      boardingServiceId: state.boardingServiceId!,
      startingDate: state.startingDate!,
      endingDate: state.endingDate!,
      includePickup: state.pickup,
      notes: state.notes,
      paymentMethodId: state.paymentMethod,
      dogs: state.dogs.map((dog) => dog.dogId!).toList()
    );

    try {
      await _boardingRepository.confirmBoarding(token, req);
      emit(state.copyWith(
        status: PageStatus.finished
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(
        status: PageStatus.error
      ));
      return;
    }   
  }

  void orderBy(int value) {
    List<CaregiverCardDto> caregivers = [...state.caregivers];
    if(value == 1) {
      // precio
      // order caregivers by price
      caregivers.sort((a, b) => a.price!.compareTo(b.price!));
    } else if (value == 2) {
      // calificacion
      // order caregivers by rating
      caregivers.sort((a, b) => b.rating!.compareTo(a.rating!));
    } else if (value == 3) {
      // zona
      // order caregivers by zone
      caregivers.sort((a, b) => a.zone!.compareTo(b.zone!));
    }
    emit(state.copyWith(
      caregivers: List.of(caregivers)
    ));
  }

}
