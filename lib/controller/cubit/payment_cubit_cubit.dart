import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_integration_paymob_test/core/network/constant.dart';
import 'package:payment_integration_paymob_test/core/network/dio_helperr.dart';

import '../../models/order_registration_model.dart';

part 'payment_cubit_state.dart';

class PaymentCubitCubit extends Cubit<PaymentCubitState> {
  PaymentCubitCubit() : super(PaymentCubitInitial());
  static PaymentCubitCubit get(context) => BlocProvider.of(context);

  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingState());
    DioHelper.postDataDio(
        url: ApiConstant.getAuthToken,
        data: {"api_key": ApiConstant.paymentApiKey}).then((value) {
      ApiConstant.paymentFirstToken = value.data['token'];
      print('${ApiConstant.paymentFirstToken}');
      emit(PaymentAuthSuccessState());
    }).catchError((error) {
      emit(PaymentAuthErrorState());
    });
  }

  Future getOrderIdRegisterationId({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(PaymentGetOrderIdRegisterationIdLoading());
    DioHelper.postDataDio(url: ApiConstant.getOrderId, data: {
      'auth_token': ApiConstant.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items": [],
    }).then((value) {
      //ApiConstant.paymentOrderId = value.data["id"];
      OrderRegistrationModel orderRegistrationModel =
          OrderRegistrationModel.fromJson(value.data);
      ApiConstant.paymentOrderId = orderRegistrationModel.id.toString();
      print('payment id ${ApiConstant.paymentOrderId}');
      getPaymentRequest(
          firstname: firstname,
          lastname: lastname,
          email: email,
          phone: phone,
          price: price);
      emit(PaymentGetOrderIdRegisterationIdSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(PaymentGetOrderIdRegisterationIdError());
    });
  }

  Future<void> getPaymentRequest({
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    String? price,
  }) async {
    emit(PayymentgetPaymentRequestLoadingState());
    DioHelper.postDataDio(url: ApiConstant.getPaymentId, data: {
      "auth_token": ApiConstant.paymentFirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": ApiConstant.paymentOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstname,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastname,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": ApiConstant.integrationIdCard,
      "lock_order_when_paid": "false",
    }).then((value) {
      ApiConstant.finalToken = value.data['token'];
      print("final token ${ApiConstant.finalToken}");
      emit(PayymentgetPaymentRequestSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PayymentgetPaymentRequestErrorState());
    });
    ;
  }
}
