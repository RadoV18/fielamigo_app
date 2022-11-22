import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fielamigo_app/bloc/page_status.dart';

import '../../data/models/payment_method_dto.dart';
import '../../data/provider/payment_method.dart';

part 'payment_methods_state.dart';

class PaymentMethodsCubit extends Cubit<PaymentMethodsState> {
  PaymentMethodsCubit() : super(const PaymentMethodsLoading());

  Future<void> init() async {
    // sets state to loading
    emit(const PaymentMethodsLoading());
    try {
      //TODO: implement token authentication? maybe?

      // gets payment methods from provider
      final paymentMethods = await PaymentMethodProvider().getPaymentMethodsTest(); //TODO: change this after testing payment methods

      // sets state to loaded
      emit(PaymentMethodsLoaded(paymentMethods: paymentMethods, pageStatus: PageStatus.success));
    } catch (e) {
      // sets state to error if there is an exception
      emit(PaymentMethodsError(errorMessage: e.toString()));
    }
  }
}
