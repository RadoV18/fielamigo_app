import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/screens/caregiver_biography/widgets/list_item.dart';

import '../../data/provider/bio.dart';

part 'bio_features_state.dart';

class BioFeaturesCubit extends Cubit<BioFeaturesState> {
  BioFeaturesCubit() : super(BioFeaturesInitial());

  Future<void> init() async {
    emit(BioFeaturesLoading());

    try {
      // FeatureDto featureDto = await BioProvider.getBioFeatures();
      await Future.delayed(Duration(seconds: 3)); //TODO: remove this after backend is done
      emit(BioFeaturesLoaded(bio: "SEXOOOOO", experiences: ["Bueno con los perros"], houseFeatures: ["Test 1"])); //change this with data from dto
    } catch (e) {
      // emit(BioFeaturesError());
    }
    return;
  }

  void addBioFeatures() async{
    // emit(); // Page loading
    try {
      await BioProvider.addBioFeatures(state.bio, state.experiences, state.houseFeatures);
    } catch (e) {

    }
  }
}

class FeatureDto {}
