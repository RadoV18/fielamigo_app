part of 'bio_features_cubit.dart';

class BioFeaturesState extends Equatable {
  final String bio;
  final List<XFile ?> imagesReq;
  final List<String> imagesRes;
  final List<String> experiences;
  final List<String> houseFeatures;
  final PageStatus pageStatus;

  const BioFeaturesState({
    this.bio = '',
    this.imagesRes = const [],
    this.imagesReq = const [],
    this.experiences = const [],
    this.houseFeatures = const [],
    this.pageStatus = PageStatus.initial,
  });

  BioFeaturesState copyWith({
    String? bio,
    List<String>? imagesRes,
    List<XFile ?> imagesReq = const [],
    List<String>? experiences,
    List<String>? houseFeatures,
    PageStatus? pageStatus,
  }) =>
      BioFeaturesState(
        bio: bio ?? this.bio,
        imagesRes: imagesRes ?? this.imagesRes,
        imagesReq: imagesReq,
        experiences: experiences ?? this.experiences,
        houseFeatures: houseFeatures ?? this.houseFeatures,
        pageStatus: pageStatus ?? this.pageStatus,
      );

  @override
  List<Object> get props => [
        bio,
        imagesRes,
        experiences,
        houseFeatures,
        pageStatus,
      ];
}
