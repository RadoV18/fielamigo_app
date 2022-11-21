import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/models/user_details_req_dto.dart';
import '../../data/repository/user_details_repository.dart';
import '../../utils/token_utils.dart';
import '../page_status.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final _userDetailsRepository = UserDetailsRepository();

  UserDetailsCubit() : super(const UserDetailsState());

  void setImage(File? image) {
    emit(state.copyWith(image: image));
  }

  void setFirstName(String name) {
    emit(state.copyWith(name: name));
  }

  void setLastName(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }

  void setPhoneNumber(String phoneNumber) {
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  void setBirthDate(String birthDate) {
    emit(state.copyWith(birthDate: birthDate));
  }

  void clear() {
    emit(const UserDetailsState());
  }

  void submit() async {
    emit(state.copyWith(status: PageStatus.loading));
    UserDetailsReqDto req = UserDetailsReqDto(
      firstName: state.name,
      lastName: state.lastName,
      phoneNumber: state.phoneNumber,
      birthDate: state.birthDate,
    );

    try {
      String? token = await TokenUtils.getToken();
      if (token != null) {
        await _userDetailsRepository.submitUserDetails(req, state.image, token);
        emit(state.copyWith(status: PageStatus.success));
      } else {
        emit(state.copyWith(status: PageStatus.error));
      }
    } on Exception catch (e) {
      emit(state.copyWith(status: PageStatus.error));
    }
  }

}
