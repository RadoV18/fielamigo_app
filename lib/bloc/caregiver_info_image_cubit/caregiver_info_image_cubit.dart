import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/repository/edit_bio_repository.dart';
import 'package:fielamigo_app/utils/token_utils.dart';
import 'package:image_picker/image_picker.dart';

part 'caregiver_info_image_state.dart';

class CaregiverInfoImageCubit extends Cubit<CaregiverInfoImageState> {
  final EditBioRepository _editBioRepository = EditBioRepository();
  CaregiverInfoImageCubit() : super(const CaregiverInfoImageLoading());

  Future<void> init() async {
    emit(const CaregiverInfoImageLoading());

    try {
      // gets token
      final String? token = await TokenUtils.getToken();
      // gets id
      final int? id = TokenUtils.getCaregiverId(token);

      List<String> images =
          await _editBioRepository.getCaregiverPictures(token!, id!);

      emit(CaregiverInfoImageLoaded(imagesPicked: [...images]));
    } catch (e) {
      emit(CaregiverInfoImageError(e.toString()));
    }
    return;
  }

  Future<void> addImages() async {
    //initializes the image picker
    final ImagePicker _picker = ImagePicker();
    List<XFile?> imagesPicked = await _picker.pickMultiImage();
    emit(const CaregiverInfoImageLoading());
    
    try {
      final String? token = await TokenUtils.getToken();
      for (int i = 0; i < imagesPicked.length; i++) {
        File image = File(imagesPicked[i]!.path);
        _editBioRepository.uploadPicture(token!, image);
      }
      emit(const CaregiverInfoImageSuccess());
    } catch (e) {
      emit(CaregiverInfoImageError(e.toString()));
    }
    return;
  }
}
