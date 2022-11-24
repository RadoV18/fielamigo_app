import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/dog_res_dto.dart';
import '../../data/repository/dog_repository.dart';
import '../../utils/token_utils.dart';
import '../page_status.dart';

part 'dog_state.dart';

class DogCubit extends Cubit<DogState> {
  final DogRepository _repository = DogRepository();

  DogCubit() : super(const DogState());

  void init() async {
    emit(state.copyWith(status: PageStatus.fetching));

    String? token = await TokenUtils.getToken();
    if (token == null) {
      print("error");
      return;
    }

    List<DogResDto>? dogs = await _repository.getAllDogs(token);
    print("user has ${dogs?.length} dogs");
    emit(state.copyWith(
      dogs: dogs,
      status: PageStatus.initial,
    ));
  }

  void caregiverInit(int id) async {
    emit(state.copyWith(status: PageStatus.fetching));

    String? token = await TokenUtils.getToken();
    if (token == null) {
      print("error");
      return;
    }

    List<DogResDto>? dogs = await _repository.getAllCaregiverDogs(token, id);
    emit(state.copyWith(
      dogs: dogs,
      status: PageStatus.initial,
    ));
  }

  void setDogs(List<DogResDto> dogs) {
    emit(state.copyWith(dogs: dogs));
  }
}
