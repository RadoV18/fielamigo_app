part of 'boarding_cubit.dart';

class BoardingState extends Equatable {
  final int? boardingServiceId;
  final List<DogResDto> dogs;
  final int? cityId;
  final DateTime? startingDate;
  final DateTime? endingDate;
  final List<CaregiverCardDto> caregivers;
  final bool pickup;
  final String notes;
  final int paymentMethod;
  final PageStatus status;

  const BoardingState({
    this.boardingServiceId,
    required this.dogs,
    this.cityId,
    this.startingDate,
    this.endingDate,
    required this.caregivers,
    this.pickup = false,
    this.notes = '',
    this.paymentMethod = -1,
    this.status = PageStatus.initial,
  });

  BoardingState copyWith({
    int? boardingServiceId,
    List<DogResDto>? dogs,
    int? cityId,
    DateTime? startingDate,
    DateTime? endingDate,
    List<CaregiverCardDto>? caregivers,
    bool? pickup,
    String? notes,
    int? paymentMethod,
    PageStatus? status,
  }) {
    return BoardingState(
      boardingServiceId: boardingServiceId ?? this.boardingServiceId,
      dogs: dogs ?? this.dogs,
      cityId: cityId ?? this.cityId,
      startingDate: startingDate ?? this.startingDate,
      endingDate: endingDate ?? this.endingDate,
      caregivers: caregivers ?? this.caregivers,
      pickup: pickup ?? this.pickup,
      notes: notes ?? this.notes,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    boardingServiceId,
    dogs,
    cityId,
    startingDate,
    endingDate,
    caregivers,
    pickup,
    notes,
    paymentMethod,
    status,
  ];
}
