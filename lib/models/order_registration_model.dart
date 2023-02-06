import 'package:flutter/widgets.dart';
import 'package:payment_integration_paymob_test/models/model.dart';

class OrderRegistrationModel {
  int id;
  OrderRegistrationModel({
    required this.id,
  });
  factory OrderRegistrationModel.fromJson(Map<String, dynamic> json) {
    return OrderRegistrationModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
