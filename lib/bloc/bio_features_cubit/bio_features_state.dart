part of 'bio_features_cubit.dart';

abstract class BioFeaturesState extends Equatable {
  String bio;
  List<String> experiences;
  List<String> houseFeatures;

  BioFeaturesState({
    required this.bio,
    required this.experiences,
    required this.houseFeatures,
  });

  @override
  List<Object> get props => [];
}

class BioFeaturesInitial extends BioFeaturesState {
  //TODO: make backend GET repuest
  BioFeaturesInitial() : super(bio: "", experiences: [], houseFeatures: []);
}

class BioFeaturesLoading extends BioFeaturesState {
  BioFeaturesLoading() : super(bio: "", experiences: [], houseFeatures: []);
}

class BioFeaturesLoaded extends BioFeaturesState {
  BioFeaturesLoaded({
    required String bio,
    required List<String> experiences,
    required List<String> houseFeatures,
  }) : super(bio: bio, experiences: experiences, houseFeatures: houseFeatures);
}
