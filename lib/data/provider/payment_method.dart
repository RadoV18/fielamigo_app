import 'dart:convert';

import 'package:fielamigo_app/data/models/payment_method_dto.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class PaymentMethodProvider {
  final String _url = Api.url;

  //TODO: remove after testing payment methods
  Future<List<PaymentMethodDto>> getPaymentMethodsTest() async {
    List<PaymentMethodDto> data = [
      PaymentMethodDto(
        paymentMethodId: 1,
        lastDigits: 1111,
        expirationDate: '12/22',
        name: 'Visa',
      ),
      PaymentMethodDto(
        paymentMethodId: 2,
        lastDigits: 2222,
        expirationDate: '12/22',
        name: 'Visa',
      ),
      PaymentMethodDto(
        paymentMethodId: 3,
        lastDigits: 3333,
        expirationDate: '12/22',
        name: 'Visa',
      ),
    ];

    await Future.delayed(const Duration(seconds: 3));
    
    return data;
  }

  //Gets all the payment methods of the user in a List
  Future<List<PaymentMethodDto>> getPaymentMethods() async {
    final response = await http.get(
      Uri.parse('$_url/payment-methods'),
      headers: {
        // 'Authorization': 'Bearer ${Api.token}', //TODO: implement token authentication
        'Content-Type': 'application/json',
      },
    );

    // if status is OK
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data
          .map<PaymentMethodDto>((json) => PaymentMethodDto.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load payment methods');
    }
  }
}
