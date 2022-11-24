import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/bloc/page_status.dart';
import 'package:flutter/material.dart';

class CaregiverServiesFormState extends Equatable {
  final bool hasBoardingConfiguration;
  final bool hasWalkingConfiguration;
  final bool hasTrainingConfiguration;
  final bool hasNursingConfiguration;
  final PageStatus status;

  

  const CaregiverServiesFormState(
      {this.hasBoardingConfiguration = false,
      this.hasWalkingConfiguration = false,
      this.hasTrainingConfiguration = false,
      this.hasNursingConfiguration = false, 
      this.status = PageStatus.initial});


  CaregiverServiesFormState copyWith({
    bool? hasBoardingConfiguration,
    bool? hasWalkingConfiguration,
    bool? hasTrainingConfiguration,
    bool? hasNursingConfiguration,
    PageStatus? status,
  }) {
    return CaregiverServiesFormState(
      hasBoardingConfiguration: hasBoardingConfiguration ?? this.hasBoardingConfiguration,
      hasWalkingConfiguration: hasWalkingConfiguration ?? this.hasWalkingConfiguration,
      hasTrainingConfiguration: hasTrainingConfiguration ?? this.hasTrainingConfiguration,
      hasNursingConfiguration: hasNursingConfiguration ?? this.hasNursingConfiguration,
      status: status ?? this.status,
    );
  }
 

  @override
  List<Object> get props => [
        hasBoardingConfiguration,
        hasWalkingConfiguration,
        hasTrainingConfiguration,
        hasNursingConfiguration
      ];
}
