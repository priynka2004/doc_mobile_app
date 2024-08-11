// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:healtether_clinic_app/Screens/ManageStaff/api/get_staff_service.dart';
// import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_request_model.dart';
// import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_response_model.dart';
//
// class ChatProvider extends ChangeNotifier {
//   bool isLoading = false;
//   GetStaffResponse? getStaffResponse;
//
//   Future fetchStaff(GetStaffRequest request) async {
//     try {
//       isLoading = true;
//       notifyListeners();
//       GetStaffService getStaffService = Get.find();
//       getStaffResponse = await getStaffService.fetchStaff(request);
//       isLoading = false;
//       notifyListeners();
//     } catch (e) {
//       isLoading = false;
//       notifyListeners();
//       print('error:$e');
//     }
//   }
//   String? get firstName => getStaffResponse?.firstName;
//   String? get lastName => getStaffResponse?.lastName;
// }
//
