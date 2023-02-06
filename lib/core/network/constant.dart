class ApiConstant {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String getAuthToken = '/auth/tokens';
  static const String paymentApiKey = 'YOUR_API_KEY';
  static const String getOrderId = '/ecommerce/orders';
  static String visaUrl =
      '$baseUrl/acceptance/iframes/725899?payment_token=$finalToken';
  static String paymentFirstToken = "";
  static String paymentOrderId = '';
  static const String getPaymentId = "/acceptance/payment_keys";
  static const String getRefCode = '/acceptance/payments/pay';
  static String finalToken = '';

  static String integrationIdCard = "YOUR_INTEGRATION_CARD_NUMBER";
}

class AppImages {
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}
