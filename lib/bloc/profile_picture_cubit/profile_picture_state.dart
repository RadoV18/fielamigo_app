part of 'profile_picture_cubit.dart';

class ProfilePictureState extends Equatable {
  final String? imageUrl;
  final int? userId;
  
  const ProfilePictureState({
    this.imageUrl,
    this.userId
  });

  ProfilePictureState copyWith({
    String? imageUrl,
    int? userId
  }) {
    return ProfilePictureState(
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId
    );
  }

  @override
  List<Object?> get props => [imageUrl, userId];
}
