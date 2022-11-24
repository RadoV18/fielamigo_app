import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_reviews_state.dart';

class UserReviewsCubit extends Cubit<UserReviewsState> {
  UserReviewsCubit() : super(UserReviewsInitial());
}
