// import 'dart:convert';
//
// import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_request_model.dart';
// import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_response_model.dart';
// import 'package:healtether_clinic_app/constants.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
//
// class ChatService {
//   Future<GetStaffResponse> fetchStaff(GetStaffRequest request) async {
//     String url = ApiEndPoint.getStaffUrl(request);
//
//     Response response = await http
//         .get(Uri.parse(url), headers: {"Content-Type": "application/json"});
//     if (response.statusCode == 200) {
//       String bodyRes = response.body;
//       Map<String, dynamic> json = jsonDecode(bodyRes);
//       GetStaffResponse getStaffResponse = GetStaffResponse.fromJson(json);
//       return getStaffResponse;
//     }
//     throw 'Something went wrong';
//   }
// }
