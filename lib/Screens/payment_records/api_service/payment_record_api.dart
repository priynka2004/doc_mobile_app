import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:healtether_clinic_app/constants.dart';
import 'package:http/http.dart' as http;

import '../../../models/payment_model.dart/payment_json_model.dart';
import '../../../utils/save_token.dart';
import '../model/payment_response_model.dart';

class PaymentService {
  String tokens = "";

  Future<void> fetchToken() async {
    tokens = (await SharedPrefService.getAccessToken())!;
    if (kDebugMode) {
      print(tokens);
    }
  }
  // final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDc3OWFjNTU0NTE1YzQ3ZTNiODkwZCIsImlhdCI6MTcxODk0NDI2NiwiZXhwIjoxNzE5MTE3MDY2fQ.3bWsiBNlWytxxIToA2SCo4rojaxpeXffanDEy2meUO8';

  Future<List<GetPayment>> fetchPayment() async {
    await fetchToken();
    String url = ApiEndPoint.getPayment;

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens'
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      if (jsonResponse.containsKey('data')) {
        List<dynamic> paymentList = jsonResponse['data'];
        List<GetPayment> payments = paymentList.map((json) => GetPayment.fromJson(json)).toList();
        return payments;
      } else {
        throw 'Key "data" not found in response';
      }
    } else {
      throw 'Failed to load payments: ${response.statusCode}';
    }
  }
}

