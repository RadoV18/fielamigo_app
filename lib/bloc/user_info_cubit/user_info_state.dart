part of 'user_info_cubit.dart';

class UserInfoState extends Equatable {
  final int? userId;
  final String? firstName;
  final String? lastName;
  final bool isOwner;

  const UserInfoState({
    this.userId,
    this.firstName,
    this.lastName,
    required this.isOwner,
  });

  @override
  List<Object?> get props => [userId, firstName, lastName, isOwner];
}
