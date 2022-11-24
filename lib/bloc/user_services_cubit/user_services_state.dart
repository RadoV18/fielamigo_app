part of 'user_services_cubit.dart';

class UserServicesState extends Equatable {
  final int caregiverId;
  final int month;
  final int year;
  final CaregiverBookedDatesDto bookedDates;

  const UserServicesState({
    this.caregiverId = -1,
    required this.month,
    required this.year,
    this.bookedDates = const CaregiverBookedDatesDto(),
  });
  
  UserServicesState copyWith({
    int? caregiverId,
    int? month,
    int? year,
    CaregiverBookedDatesDto? bookedDates,
  }) {
    return UserServicesState(
      caregiverId: caregiverId ?? this.caregiverId,
      month: month ?? this.month,
      year: year ?? this.year,
      bookedDates: bookedDates ?? this.bookedDates,
    );
  }

  @override
  List<Object> get props => [
    caregiverId,
    month,
    year,
    bookedDates
  ];
}
