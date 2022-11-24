import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/utils/token_utils.dart';

import '../../data/models/address_req_dto.dart';
import '../../data/provider/user.dart';
import '../page_status.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(const UserDataState());

  final UserProvider _provider = UserProvider();

  void setZone(String zone) {
    emit(state.copyWith(zone: zone));
  }

  void setAddress1(String address1) {
    emit(state.copyWith(address1: address1));
  }

  void setAddress2(String address2) {
    emit(state.copyWith(address2: address2));
  }

  void setCountry(int country) {
    emit(state.copyWith(country: country));
  }

  void setCity(int city) {
    emit(state.copyWith(city: city));
  }

  void submit() async {
    emit(state.copyWith(status: PageStatus.loading));

    String? token = await TokenUtils.getToken();

    if (token == null) {
      emit(state.copyWith(status: PageStatus.error));
      return;
    }

    AddressReqDto req = AddressReqDto(
      zone: state.zone,
      address1: state.address1,
      address2: state.address2,
      countryId: state.country,
      cityId: state.city,
    );

    try {
      await _provider.postUserAddress(token, req);
      emit(state.copyWith(status: PageStatus.success));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.error));
    }
  }

}
