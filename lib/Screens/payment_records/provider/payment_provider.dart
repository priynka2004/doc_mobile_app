// import 'package:flutter/material.dart';
// import 'package:healtether_clinic_app/Screens/payment_records/api_service/payment_record_api.dart';
// import 'package:healtether_clinic_app/Screens/payment_records/model/payment_response_model.dart';
// import 'package:healtether_clinic_app/Screens/payment_records/model/payment_model.dart';
// import 'package:get/get.dart';
//
// class PaymentProvider with ChangeNotifier {
//   List<Payment> _payments = [];
//   int _totalCount = 0;
//   bool isLoading = false;
//   String _errorMessage = '';
//   PaymentResponse? paymentResponse;
//
//   List<Payment> get payments => _payments;
//
//   int get totalCount => _totalCount;
//
//   String get errorMessage => _errorMessage;
//
//   Future<void> fetchPayments(GetPaymentRequest request) async {
//     try {
//       isLoading = true;
//       notifyListeners();
//       PaymentService paymentService = Get.find();
//       paymentResponse = await paymentService.fetchPayments(request);
//       _payments = paymentResponse!.data;
//       _totalCount = paymentResponse!.totalCount;
//       _errorMessage = '';
//     } catch (error) {
//       _errorMessage = error.toString();
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtether_clinic_app/Screens/payment_records/api_service/payment_record_api.dart';
import 'package:healtether_clinic_app/Screens/payment_records/model/payment_response_model.dart';

class PaymentProvider extends ChangeNotifier {
  bool isLoading = false;
  List<GetPayment> payments  =[];

  Future fetchPayments() async {
    try {
      isLoading = true;
      notifyListeners();

      PaymentService paymentService = Get.find();
      payments = await paymentService.fetchPayment();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('Error fetching payments: $e');

    }
  }
}
