part of 'user_data_cubit.dart';

class UserDataState extends Equatable {
  // address form
  final String address1;
  final String address2;
  final String zone;
  final int country;
  final int city;
  final PageStatus status;
  
  const UserDataState({
    this.zone = '',
    this.address1 = '',
    this.address2 = '',
    this.country = -1,
    this.city = -1,
    this.status = PageStatus.initial,
  });

  UserDataState copyWith({
    String? zone,
    String? address1,
    String? address2,
    int? country,
    int? city,
    PageStatus? status,
  }) => UserDataState(
    zone: zone ?? this.zone,
    address1: address1 ?? this.address1,
    address2: address2 ?? this.address2,
    country: country ?? this.country,
    city: city ?? this.city,
    status: status ?? this.status,
  );

  @override
  List<Object> get props => [
    zone,
    address1,
    address2,
    country,
    city,
    status,
  ];
}
