part of 'boarding_cubit.dart';

class BoardingState extends Equatable {
  final List<DogResDto> dogs;
  final int? cityId;
  final DateTime? startingDate;
  final DateTime? endingDate;
  final List<CaregiverCardDto> caregivers;
  final bool pickup;
  final String notes;
  final PageStatus status;

  const BoardingState({
    required this.dogs,
    this.cityId,
    this.startingDate,
    this.endingDate,
    required this.caregivers,
    this.pickup = false,
    this.notes = '',
    this.status = PageStatus.initial,
  });

  BoardingState copyWith({
    List<DogResDto>? dogs,
    int? cityId,
    DateTime? startingDate,
    DateTime? endingDate,
    List<CaregiverCardDto>? caregivers,
    bool? pickup,
    String? notes,
    PageStatus? status,
  }) {
    return BoardingState(
      dogs: dogs ?? this.dogs,
      cityId: cityId ?? this.cityId,
      startingDate: startingDate ?? this.startingDate,
      endingDate: endingDate ?? this.endingDate,
      caregivers: caregivers ?? this.caregivers,
      pickup: pickup ?? this.pickup,
      notes: notes ?? this.notes,
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
    pickup,
    notes,
    status,
  ];
}
