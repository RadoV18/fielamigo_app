import 'package:bloc/bloc.dart';
import 'package:fielamigo_app/bloc/bottom_navbar_cubit/bottom_navbar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarState());

  void setIndex(int index) {
    emit(BottomNavBarState(currentIndex: index));
  }
}
