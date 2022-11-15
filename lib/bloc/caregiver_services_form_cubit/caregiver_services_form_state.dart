import 'package:equatable/equatable.dart';

class CaregiverServiesFormState extends Equatable {
  final bool hasBoardingConfiguration;
  final bool hasWalkingConfiguration;
  final bool hasTrainingConfiguration;
  final bool hasNursingConfiguration;

  const CaregiverServiesFormState({
    this.hasBoardingConfiguration = false, 
    this.hasWalkingConfiguration = false, 
    this.hasTrainingConfiguration = false, 
    this.hasNursingConfiguration = false
  });

  CaregiverServiesFormState copyWith({
    bool ? hasBoardingConfiguration,
    bool ? hasWalkingConfiguration,
    bool ? hasTrainingConfiguration,
    bool ? hasNursingConfiguration,
  }) => CaregiverServiesFormState(
    hasBoardingConfiguration: hasBoardingConfiguration ?? this.hasBoardingConfiguration,
    hasWalkingConfiguration: hasWalkingConfiguration ?? this.hasWalkingConfiguration,
    hasTrainingConfiguration: hasTrainingConfiguration ?? this.hasTrainingConfiguration,
    hasNursingConfiguration: hasNursingConfiguration ?? this.hasNursingConfiguration,
  );

  @override
  List<Object> get props => [
    hasBoardingConfiguration, 
    hasWalkingConfiguration, 
    hasTrainingConfiguration, 
    hasNursingConfiguration
  ];
}