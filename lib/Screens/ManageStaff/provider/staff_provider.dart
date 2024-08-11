import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/api/get_staff_service.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/create_staff_model.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/create_staff_request_model.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_request_model.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_response_model.dart';

class StaffProvider with ChangeNotifier {
  List<StaffModel> _staffList = [];
  bool isLoading = false;
  String? errorMessage;
  CreateStaffResponse? createStaffResponse;

  List<StaffModel> get staffList => _staffList;

  Future<void> fetchStaff() async {
    isLoading = true;
    notifyListeners();

    try {
      StaffServices service = Get.find();
      List<StaffModel> staff = await service.fetchStaff();
      _staffList = staff;
    } catch (error) {
      if (kDebugMode) {
        print('Failed to load data: $error');
      }
    }

    isLoading = false;
    notifyListeners();
  }



  Future<void> deleteStaff(String id) async {
    try {
      StaffServices service = Get.find();
      await service.deleteStaff(id);
      _staffList.removeWhere((staff) => staff.sId == id);
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print('Failed to delete staff: $error');
      }
      throw Exception('Failed to delete staff');
    }
  }

  Future<void> createStaff(CreateStaff createStaff) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      StaffServices staffServices = Get.find();
      createStaffResponse = await staffServices.createStaff(createStaff);
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
// Future<bool> addNewStaff(Staff newStaff) async {
//   try {
//     bool isSuccess = await _service.addNewStaff(newStaff);
//
//     if (isSuccess) {
//       await fetchStaff();
//       return true;
//     } else {
//       throw Exception('Failed to add staff: Service operation returned false');
//     }
//   } catch (error, stackTrace) {
//     if (kDebugMode) {
//       print('Failed to add new staff: $error');
//     }
//     if (kDebugMode) {
//       print(stackTrace);
//     }
//     throw Exception('Failed to add staff: $error');
//   }
// }
}