part of 'add_payment_method_cubit.dart';

abstract class AddPaymentMethodState extends Equatable {
  final PageStatus status;

  const AddPaymentMethodState({required this.status});

  @override
  List<Object> get props => [status];
}

class AddPaymentMethodInitial extends AddPaymentMethodState {
  const AddPaymentMethodInitial() : super(status: PageStatus.initial);
}

class AddPaymentMethodLoading extends AddPaymentMethodState {
  const AddPaymentMethodLoading() : super(status: PageStatus.loading);
}

class AddPaymentMethodSuccess extends AddPaymentMethodState {
  final String successMessage;
  const AddPaymentMethodSuccess(this.successMessage)
      : super(status: PageStatus.success);
}

class AddPaymentMethodError extends AddPaymentMethodState {
  final String errorMessage;

  const AddPaymentMethodError({required this.errorMessage})
      : super(status: PageStatus.error);
}
