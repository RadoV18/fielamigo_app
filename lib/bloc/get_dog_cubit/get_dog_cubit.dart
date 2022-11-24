import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/data/provider/dog.dart';

import '../../data/models/dog_res_dto.dart';
import '../../utils/token_utils.dart';
import '../page_status.dart';

part 'get_dog_state.dart';

class GetDogCubit extends Cubit<GetDogState> {
  final DogProvider _dogProvider = DogProvider();

  GetDogCubit() : super(const GetDogState());

  void init(int dogId) async {
    emit(state.copyWith(
      dogId: dogId,
      status: PageStatus.loading,
    ));

  String? token = await TokenUtils.getToken();

  if(token == null) {
    print("error");
    emit(state.copyWith(
      status: PageStatus.error,
    ));
  }
  try {
    DogResDto dog = await _dogProvider.getDogById(token!, dogId);
    print("${dog.dogId} ${dog.name} ${dog.birthDate} ${dog.size} ${dog.breed} ${dog.notes} ${dog.isSterilized} ${dog.imageUrl}");
    emit(state.copyWith(
      dogId: dog.dogId,
      userId: dog.userId,
      name: dog.name,
      birthDate: dog.birthDate,
      size: dog.size,
      breed: dog.breed,
      notes: dog.notes,
      isSterilized: dog.isSterilized,
      isMale: dog.isMale,
      imageUrl: dog.imageUrl,
      status: PageStatus.success,
    ));
  } catch (e) {
    print(e);
    emit(state.copyWith(
      status: PageStatus.error,
    ));
  }
  }


}
