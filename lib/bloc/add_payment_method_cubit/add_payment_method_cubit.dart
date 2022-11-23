import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/bloc/page_status.dart';
import 'package:fielamigo_app/data/models/payment_method_req_dto.dart';

import '../../data/provider/payment_method.dart';

part 'add_payment_method_state.dart';

class AddPaymentMethodCubit extends Cubit<AddPaymentMethodState> {
  AddPaymentMethodCubit() : super(const AddPaymentMethodInitial());

  Future<void> addCard(String cardNumber, String cardHolder,
      String expirationDate, String cvv) async {
    emit(const AddPaymentMethodLoading());

    PaymentMethodReqDto paymentMethodReqDto = PaymentMethodReqDto(
        name: cardHolder, numbers: cardNumber, expirationDate: expirationDate);

    try {
      await PaymentMethodProvider().addPaymentMethod(paymentMethodReqDto);
      emit(const AddPaymentMethodSuccess("Metodo de pago agregado con éxito."));

    } catch (e) {
      emit(AddPaymentMethodError(errorMessage: e.toString()));
    }

    return;
  }
}
