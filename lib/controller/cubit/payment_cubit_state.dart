part of 'payment_cubit_cubit.dart';

@immutable
abstract class PaymentCubitState {}

class PaymentCubitInitial extends PaymentCubitState {}

class PaymentAuthLoadingState extends PaymentCubitState {}

class PaymentAuthSuccessState extends PaymentCubitState {}

class PaymentAuthErrorState extends PaymentCubitState {}

class PaymentGetOrderIdRegisterationIdLoading extends PaymentCubitState {}

class PaymentGetOrderIdRegisterationIdSuccess extends PaymentCubitState {}

class PaymentGetOrderIdRegisterationIdError extends PaymentCubitState {}

class PayymentgetPaymentRequestLoadingState extends PaymentCubitState {}

class PayymentgetPaymentRequestSuccessState extends PaymentCubitState {}

class PayymentgetPaymentRequestErrorState extends PaymentCubitState {}
