import 'package:fielamigo_app/data/provider/caregiver.dart';

import '../models/caregiver_card_dto.dart';

class BoardingRepository {
  final CaregiverProvider _caregiverProvider = CaregiverProvider();

  Future<List<CaregiverCardDto>> searchBoarding(String token, String startingDate,
      String endingDate, int dogCount, int cityId) async {
    return await _caregiverProvider.searchBoarding(token, startingDate,
      endingDate, dogCount, cityId);
  }
}