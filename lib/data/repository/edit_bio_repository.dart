import 'dart:io';

import 'package:fielamigo_app/data/models/bio_req_dto.dart';

import '../provider/caregiver.dart';

class EditBioRepository {
  final CaregiverProvider _caregiverProvider = CaregiverProvider();

  // get the current caregiver bio
  Future<String> getCaregiverBio(String token, int id) async {
    return await _caregiverProvider.getCaregiverBio(token, id);
  }
  
  // get the current caregiver experience
  Future<List<String>> getCaregiverExperience(String token, int id) async {
    return await _caregiverProvider.getCaregiverExperience(token, id);
  }

  // get the current caregiver's house details
  Future<List<String>> getCaregiverHouseDetails(String token, int id) async {
    return await _caregiverProvider.getHouseDetails(token, id);
  }

  // post the caregiver's new bio (bio, experience, house details)
  Future<void> postCaregiverBio(String token, BioReqDto req) async {
    await _caregiverProvider.postCaregiverNewBio(token, req);
  }

  // get the current caregiver pictures
  Future<List<String>> getCaregiverPictures(String token, int id) async {
    return await _caregiverProvider.getCaregiverPictures(token, id);
  }

  // post a new caregiver picture
  Future<void> uploadPicture(String token, File image) async {
    return await _caregiverProvider.uploadPicture(token, image);
  }

}
