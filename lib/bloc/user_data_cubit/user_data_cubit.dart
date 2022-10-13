import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(const UserDataState());

  void setFirstName(String firstName) {
    emit(state.copyWith(firstName: firstName));
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

  void setAddress1(String address1) {
    emit(state.copyWith(address1: address1));
  }

  void setAddress2(String address2) {
    emit(state.copyWith(address2: address2));
  }

  void setCountry(String country) {
    emit(state.copyWith(country: country));
  }

  void setCity(String city) {
    emit(state.copyWith(city: city));
  }

  void submit() {
    // TODO: send http request
    print(state.toString());
  }

}
