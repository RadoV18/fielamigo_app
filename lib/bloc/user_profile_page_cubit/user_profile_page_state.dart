part of 'user_profile_page_cubit.dart';

class UserProfilePageState extends Equatable {
  final String? bio;
  final List<String>? images;
  final List<DogResDto>? dogs;
  final List<String>? experience;
  final PageStatus status;

  const UserProfilePageState({
    this.bio,
    this.images,
    this.dogs = const [],
    this.experience = const [],
    this.status = PageStatus.initial,
  });

  UserProfilePageState copyWith({
    String? bio,
    List<String>? images,
    List<DogResDto>? dogs,
    List<String>? experience,
    PageStatus? status,
  }) {
    return UserProfilePageState(
      bio: bio ?? this.bio,
      images: images ?? this.images,
      dogs: dogs ?? this.dogs,
      experience: experience ?? this.experience,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    bio,
    images,
    dogs,
    experience,
    status,
  ];
}
