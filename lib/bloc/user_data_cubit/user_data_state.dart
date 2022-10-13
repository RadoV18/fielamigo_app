part of 'user_data_cubit.dart';

class UserDataState extends Equatable {
  // user form
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String birthDate;
  // address form
  final String address1;
  final String address2;
  final String country;
  final String city;
  
  const UserDataState({
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.birthDate = 'dd/mm/aaaa',
    this.address1 = '',
    this.address2 = '',
    this.country = '',
    this.city = ''
  });

  UserDataState copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDate,
    String? address1,
    String? address2,
    String? country,
    String? city
  }) => UserDataState(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    birthDate: birthDate ?? this.birthDate,
    address1: address1 ?? this.address1,
    address2: address2 ?? this.address2,
    country: country ?? this.country,
    city: city ?? this.city
  );

  @override
  List<Object> get props => [
    firstName,
    lastName,
    phoneNumber,
    birthDate,
    address1,
    address2,
    country,
    city
  ];
}
