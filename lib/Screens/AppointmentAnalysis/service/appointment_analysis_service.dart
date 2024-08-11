// import 'dart:convert';
//
// import 'package:healtether_clinic_app/Screens/AppointmentAnalysis/model/appointment_analysis_request_model.dart';
// import 'package:healtether_clinic_app/Screens/AppointmentAnalysis/model/appointment_analysis_resopens_model.dart';
// import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_request_model.dart';
// import 'package:healtether_clinic_app/constants.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
//
// class AppointmentAnalysisService {
//   Future<AppointmentAnalysisResponseModel> fetchAppointment(
//       AppointmentAnalysisRequestModel analysisRequestModel) async {
//     String url =
//         ApiEndPoint.getStaffUrl(analysisRequestModel as GetStaffRequest );
//
//     Response response = await http
//         .get(Uri.parse(url), headers: {"Content-Type": "application/json"});
//     if (response.statusCode == 200) {
//       String bodyRes = response.body;
//       Map<String, dynamic> json = jsonDecode(bodyRes);
//       AppointmentAnalysisResponseModel analysisResponseModel =
//           AppointmentAnalysisResponseModel.fromJson(json);
//       return analysisResponseModel;
//     }
//     throw 'Something went wrong';
//   }
// }
