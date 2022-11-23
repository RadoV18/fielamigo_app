import 'dart:convert';

import 'package:fielamigo_app/data/models/payment_method_dto.dart';
import 'package:fielamigo_app/data/models/payment_method_req_dto.dart';
import 'package:fielamigo_app/data/models/response_dto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class PaymentMethodProvider {
  final String _url = "${Api.url}/payment-methods";

  Future<void> addPaymentMethod(PaymentMethodReqDto paymentMethodReqDto) async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    final String? token = await flutterSecureStorage.read(key: "token");
    print("asdf");
    final response = await http.post(
      Uri.parse(_url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(paymentMethodReqDto.toJson()),
    );
    print("defg");
    if (response.statusCode != 201) {
      print(response.statusCode);
      throw Exception('Failed to add payment method');
    }
  }

  // GET /payment-methods
  //Gets all the payment methods of the user in a List
  Future<List<PaymentMethodDto>> getPaymentMethods() async {
    // return value
    List<PaymentMethodDto> paymentMethods = [];

    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "token");

    final response = await http.get(
      Uri.parse('$_url/payment-methods'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    // if status is OK
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ResponseDto backendResponse = ResponseDto.fromJson(data);

      if (backendResponse.succesful) {
        // put response data into List
        paymentMethods = backendResponse.data
            .map<PaymentMethodDto>((json) => PaymentMethodDto.fromJson(json))
            .toList();
      } else {
        throw Exception(backendResponse.message);
      }

      return paymentMethods;
    } else {
      throw Exception("Error desconocido en /payment-methods");
    }
  }
}
