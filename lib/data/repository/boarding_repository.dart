import 'package:fielamigo_app/data/provider/caregiver.dart';

import '../models/boarding_req_dto.dart';
import '../models/caregiver_card_dto.dart';
import '../provider/boarding_reservation.dart';

class BoardingRepository {
  final CaregiverProvider _caregiverProvider = CaregiverProvider();
  final BoardingReservationProvider _boardingReservationProvider = BoardingReservationProvider();

  Future<List<CaregiverCardDto>> searchBoarding(String token, String startingDate,
      String endingDate, int dogCount, int cityId) async {
    return await _caregiverProvider.searchBoarding(token, startingDate,
      endingDate, dogCount, cityId);
  }

  Future<void> confirmBoarding(String token, BoardingReqDto boardingReqDto) async {
    return await _boardingReservationProvider.createBoardingReservation(token, boardingReqDto);
  }
}