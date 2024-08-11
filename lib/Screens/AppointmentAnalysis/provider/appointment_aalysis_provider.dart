// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:healtether_clinic_app/Screens/AppointmentAnalysis/model/appointment_analysis_request_model.dart';
// import 'package:healtether_clinic_app/Screens/AppointmentAnalysis/model/appointment_analysis_resopens_model.dart';
// import 'package:healtether_clinic_app/Screens/AppointmentAnalysis/service/appointment_analysis_service.dart';
//
// class AppointmentAnalysisProvider extends ChangeNotifier {
//   bool isLoading = false;
//   AppointmentAnalysisResponseModel? appointmentAnalysisResponseModel;
//
//   Future fetchAppointment(
//       AppointmentAnalysisRequestModel appointmentAnalysisRequestModel) async {
//     try {
//       isLoading = true;
//       notifyListeners();
//       AppointmentAnalysisService appointmentAnalysisService = Get.find();
//       appointmentAnalysisResponseModel = (await appointmentAnalysisService
//               .fetchAppointment(appointmentAnalysisRequestModel))
//           as AppointmentAnalysisResponseModel?;
//       isLoading = false;
//       notifyListeners();
//     } catch (e) {
//       isLoading = false;
//       notifyListeners();
//       print('error:$e');
//     }
//   }
// // String? get firstName => appointmentAnalysisResponseModel?.firstName;
// // String? get lastName => appointmentAnalysisResponseModel?.lastName;
// }
