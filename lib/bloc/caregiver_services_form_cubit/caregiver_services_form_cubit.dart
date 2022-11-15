import 'package:bloc/bloc.dart';
import 'package:fielamigo_app/bloc/caregiver_services_form_cubit/caregiver_services_form_state.dart';

class CaregiverServicesFormCubit extends Cubit<CaregiverServiesFormState> {
  CaregiverServicesFormCubit() : super(const CaregiverServiesFormState());

  // all these function toggles the value of the state corresponding to the service buttons
  void toggleBoardingConfiguration() => emit(state.copyWith(hasBoardingConfiguration: !state.hasBoardingConfiguration));
  void toggleWalkingConfiguration() => emit(state.copyWith(hasWalkingConfiguration: !state.hasWalkingConfiguration));
  void toggleTrainingConfiguration() => emit(state.copyWith(hasTrainingConfiguration: !state.hasTrainingConfiguration));
  void toggleNursingConfiguration() => emit(state.copyWith(hasNursingConfiguration: !state.hasNursingConfiguration));
}
