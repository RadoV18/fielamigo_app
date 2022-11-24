import 'package:bloc/bloc.dart';
import 'package:fielamigo_app/bloc/caregiver_services_form_cubit/caregiver_services_form_state.dart';
import 'package:fielamigo_app/bloc/page_status.dart';
import 'package:fielamigo_app/data/provider/boarding_service.dart';
import 'package:fielamigo_app/utils/token_utils.dart';

import '../../data/models/boarding_service_dto.dart';

class CaregiverServicesFormCubit extends Cubit<CaregiverServiesFormState> {
  BoardingServiceProvider boardingServiceProvider = BoardingServiceProvider();

  CaregiverServicesFormCubit() : super(const CaregiverServiesFormState());

  // all these function toggles the value of the state corresponding to the service buttons
  void toggleBoardingConfiguration() => emit(state.copyWith(
      hasBoardingConfiguration: !state.hasBoardingConfiguration));
  void toggleWalkingConfiguration() => emit(
      state.copyWith(hasWalkingConfiguration: !state.hasWalkingConfiguration));
  void toggleTrainingConfiguration() => emit(state.copyWith(
      hasTrainingConfiguration: !state.hasTrainingConfiguration));
  void toggleNursingConfiguration() => emit(
      state.copyWith(hasNursingConfiguration: !state.hasNursingConfiguration));

  void setBoardingConfiguration(double nightlyRate, int maxNights, int maxDogs,
      bool canPickup, double pickupRat) async {
    emit(state.copyWith(status: PageStatus.loading));

    try {
      String? token = await TokenUtils.getToken();

      BoardingServiceDto boardingServiceDto = BoardingServiceDto(
          nightlyRate: nightlyRate,
          maxNumberOfDogs: maxDogs,
          maxNumberOfNights: maxNights,
          canPickup: canPickup,
          pickupRate: pickupRat);

      await boardingServiceProvider.setBoardingConfig(
          token!, boardingServiceDto);

      emit(state.copyWith(
          status: PageStatus.success, hasBoardingConfiguration: true));

      return;
    } catch (e) {
      emit(state.copyWith(status: PageStatus.error));
    }
    return;
  }

  setMaxNights(double v) {}
}
