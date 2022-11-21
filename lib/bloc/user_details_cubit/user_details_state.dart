part of 'user_details_cubit.dart';

class UserDetailsState extends Equatable {
  final File? image;
  final String imageUrl;
  final String name;
  final String lastName;
  final String phoneNumber;
  final String birthDate;
  final PageStatus status;

  const UserDetailsState({
    this.image,
    this.imageUrl = "",
    this.name = "",
    this.lastName = "",
    this.phoneNumber = "",
    this.birthDate = "",
    this.status = PageStatus.initial
  });

  UserDetailsState copyWith({
    File? image,
    String? imageUrl,
    String? name,
    String? lastName,
    String? phoneNumber,
    String? birthDate,
    PageStatus? status
  }) {
    return UserDetailsState(
      image: image ?? this.image,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthDate: birthDate ?? this.birthDate,
      status: status ?? this.status
    );
  }

  @override
  List<Object?> get props => [
    image,
    imageUrl,
    name,
    lastName,
    phoneNumber,
    birthDate,
    status
  ];
}
