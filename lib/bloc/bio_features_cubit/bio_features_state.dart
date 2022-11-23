part of 'bio_features_cubit.dart';

abstract class BioFeaturesState extends Equatable {
  List<String> experiences;
  List<String> houseFeatures;

  BioFeaturesState({
    required this.experiences,
    required this.houseFeatures,
  });

  @override
  List<Object> get props => [];
}

class BioFeaturesInitial extends BioFeaturesState {
  //TODO: make backend GET repuest
  BioFeaturesInitial() : super(experiences: [], houseFeatures: []);
}

class BioFeaturesLoading extends BioFeaturesState {
  BioFeaturesLoading() : super(experiences: [], houseFeatures: []);
}

class BioFeaturesLoaded extends BioFeaturesState {
  BioFeaturesLoaded({
    required List<String> experiences,
    required List<String> houseFeatures,
  }) : super(experiences: experiences, houseFeatures: houseFeatures);
}
