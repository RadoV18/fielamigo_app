import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_services_state.dart';

class UserServicesCubit extends Cubit<UserServicesState> {
  UserServicesCubit() : super(UserServicesInitial());
}
