import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/models/caregiver_booked_dates_dto.dart';

import '../../data/provider/caregiver.dart';
import '../../utils/token_utils.dart';

part 'user_services_state.dart';

class UserServicesCubit extends Cubit<UserServicesState> {
  final CaregiverProvider _caregiverProvider = CaregiverProvider();

  UserServicesCubit() : super(UserServicesState(month: DateTime.now().month, year: DateTime.now().year));

  void init(int caregiverId) {
    emit(state.copyWith(caregiverId: caregiverId));
    getBookedDates();
  }

  void setCaregiverId(int? value) {
    emit(state.copyWith(
      caregiverId: value
    ));
  }

  void setMonth(int? value) {
    emit(state.copyWith(
      month: value
    ));
    init(state.caregiverId);
  }

  void setYear(int? value) {
    emit(state.copyWith(
      year: value
    ));
  }

  void getBookedDates() async {
    try {
      String? token = await TokenUtils.getToken();
      if (token == null) {
        print("token is invalid");
      }
      CaregiverBookedDatesDto bookedDates = await _caregiverProvider.getCaregiverBookedDates(
        token!, state.caregiverId, state.month, state.year
      );
      emit(state.copyWith(
        bookedDates: bookedDates,
      ));
    } catch (e) {
      print(e);
    }
  }
}
