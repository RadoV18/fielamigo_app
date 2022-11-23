import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/screens/caregiver_biography/widgets/list_item.dart';

import '../../data/provider/bio.dart';

part 'bio_features_state.dart';

class BioFeaturesCubit extends Cubit<BioFeaturesState> {
  BioFeaturesCubit() : super(BioFeaturesInitial());

  Future<void> getBioFeatures() async {
    emit(BioFeaturesLoading());

    try {
      
      FeatureDto featureDto = await BioProvider.getBioFeatures();
    } catch (e) {
      
    }
  }
}

class FeatureDto {
}
