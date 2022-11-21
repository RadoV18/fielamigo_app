part of 'user_info_cubit.dart';

class UserInfoState extends Equatable {
  final int? userId;
  final String? firstName;
  final String? lastName;

  const UserInfoState({
    this.userId,
    this.firstName,
    this.lastName,
  });

  @override
  List<Object?> get props => [
    userId,
    firstName,
    lastName
  ];
}
