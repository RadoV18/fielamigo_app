part of 'caregiver_info_image_cubit.dart';

abstract class CaregiverInfoImageState extends Equatable {
  final List<String>? imagesPicked;

  const CaregiverInfoImageState({this.imagesPicked});

  @override
  List<Object?> get props => [
        imagesPicked,
      ];
}

class CaregiverInfoImageLoading extends CaregiverInfoImageState {
  const CaregiverInfoImageLoading() : super();
}

class CaregiverInfoImageLoaded extends CaregiverInfoImageState {
  const CaregiverInfoImageLoaded({required List<String> imagesPicked})
      : super(imagesPicked: imagesPicked);
}

class CaregiverInfoImageError extends CaregiverInfoImageState {
  final String errorMessage;

  const CaregiverInfoImageError(this.errorMessage) : super();
}

class CaregiverInfoImageSuccess extends CaregiverInfoImageState {
  const CaregiverInfoImageSuccess() : super();
}
