import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/bloc/page_status.dart';
import 'package:fielamigo_app/data/models/bio_req_dto.dart';
import 'package:fielamigo_app/data/repository/edit_bio_repository.dart';
import 'package:fielamigo_app/screens/caregiver_biography/widgets/custom_image.dart';
import 'package:fielamigo_app/screens/caregiver_biography/widgets/photo_grid.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/token_utils.dart';

part 'bio_features_state.dart';

class BioFeaturesCubit extends Cubit<BioFeaturesState> {
  final EditBioRepository _editBioRepository = EditBioRepository();

  BioFeaturesCubit() : super(const BioFeaturesState());

  void init() async {
    emit(state.copyWith(pageStatus: PageStatus.loading));
    try {
      final token = await TokenUtils.getToken();
      final id = TokenUtils.getCaregiverId(token);

      final bio = await _editBioRepository.getCaregiverBio(token!, id!);
      final imagesReq =
          await _editBioRepository.getCaregiverPictures(token, id);
      final experiences =
          await _editBioRepository.getCaregiverExperience(token, id);
      final houseFeatures =
          await _editBioRepository.getCaregiverHouseDetails(token, id);
      emit(state.copyWith(
        bio: bio,
        imagesRes: imagesReq,
        experiences: experiences,
        houseFeatures: houseFeatures,
        pageStatus: PageStatus.success,
      ));

      return;
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(pageStatus: PageStatus.error));
    }
    throw Exception("Error");
  }

  void setBio(String bio) {
    emit(state.copyWith(bio: bio));
  }

  void saveBio() async{
    emit(state.copyWith(pageStatus: PageStatus.loading));
    try {

      final token = await TokenUtils.getToken();
      final bioReq = BioReqDto(bio: state.bio, experience: [], houseFeatures: []);
      _editBioRepository.postCaregiverBio(token!, bioReq);
      emit(state.copyWith(pageStatus: PageStatus.success));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(pageStatus: PageStatus.error));
    }
  }

  void clear() {
    emit(const BioFeaturesState());
  }

  Future<void> setImagesReq() async {
    ImagePicker imagePicker = ImagePicker();
    List<XFile?> images = await imagePicker.pickMultiImage();

    final String? token = await TokenUtils.getToken()!;
    images.forEach((image) async {
      final imageFile = File(image!.path);

      try {
        await _editBioRepository.uploadPicture(token!, imageFile);
      } catch (e) {
        log(e.toString());
      }
    });
    init();
    return;
  }

  List<String> getExperiences() {
    return state.experiences;
  }

  void setExperiences({required List<String> experiences}) {
    emit(state.copyWith(experiences: experiences));
  }

  void updateExperiences({required String experience}) {
    final experiences = state.experiences;
    experiences.add(experience);
    emit(state.copyWith(experiences: experiences));
  }

  void setHouseFeatures(List<String> houseFeatures) {
    emit(state.copyWith(houseFeatures: houseFeatures));
  }

  void updateHouseFeatures(String houseFeature) {
    final houseFeatures = state.houseFeatures;
    houseFeatures.add(houseFeature);
    emit(state.copyWith(houseFeatures: houseFeatures));
  }

  void saveBioFeatures() async {
    final token = await TokenUtils.getToken();
    emit(state.copyWith(pageStatus: PageStatus.loading));
    try {
      final bio = BioReqDto(
          bio: state.bio,
          experience: state.experiences,
          houseFeatures: state.houseFeatures);

      await _editBioRepository.postCaregiverBio(token!, bio);

      for (int i = 0; i < state.imagesReq.length; i++) {
        log(state.imagesReq[i]!.path.toString());
        final image = File(state.imagesReq[i]!.path);
        await _editBioRepository.uploadPicture(token, image);
      }
      emit(state.copyWith(pageStatus: PageStatus.success));
      return;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
