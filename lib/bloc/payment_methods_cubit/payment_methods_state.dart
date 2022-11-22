part of 'payment_methods_cubit.dart';

abstract class PaymentMethodsState extends Equatable {
  final List<PaymentMethodDto>? paymentMethods;

  final String? errorMessage;

  const PaymentMethodsState({
    this.paymentMethods,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [paymentMethods, errorMessage];
}

class PaymentMethodsLoading extends PaymentMethodsState {
  const PaymentMethodsLoading() : super();
}

class PaymentMethodsError extends PaymentMethodsState {
  const PaymentMethodsError({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class PaymentMethodsLoaded extends PaymentMethodsState {
  const PaymentMethodsLoaded({required List<PaymentMethodDto> paymentMethods, required PageStatus pageStatus})
      : super(
          paymentMethods: paymentMethods,
        );
}
