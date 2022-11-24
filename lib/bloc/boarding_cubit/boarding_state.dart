part of 'boarding_cubit.dart';

class BoardingState extends Equatable {
  final List<int> dogs;
  final int? cityId;
  final DateTime? startingDate;
  final DateTime? endingDate;
  final List<CaregiverCardDto> caregivers;
  final PageStatus status;

  const BoardingState({
    required this.dogs,
    this.cityId,
    this.startingDate,
    this.endingDate,
    required this.caregivers,
    this.status = PageStatus.initial,
  });

  BoardingState copyWith({
    List<int>? dogs,
    int? cityId,
    DateTime? startingDate,
    DateTime? endingDate,
    List<CaregiverCardDto>? caregivers,
    PageStatus? status,
  }) {
    return BoardingState(
      dogs: dogs ?? this.dogs,
      cityId: cityId ?? this.cityId,
      startingDate: startingDate ?? this.startingDate,
      endingDate: endingDate ?? this.endingDate,
      caregivers: caregivers ?? this.caregivers,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    dogs,
    cityId,
    startingDate,
    endingDate,
    caregivers,
    status,
  ];
}
