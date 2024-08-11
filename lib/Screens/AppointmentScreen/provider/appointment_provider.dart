import 'package:flutter/material.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/model/appointment_request_model.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/model/appointment_resopnse_model.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/service/appointment_service.dart';


class AppointmentProvider with ChangeNotifier {
  List<AppointmentResponse> _appointments = [];
  int _totalCount = 0;
  bool isLoading = false;

  List<AppointmentResponse> get appointments => _appointments;
  int get totalCount => _totalCount;

  Future<void> fetchAppointments() async {
    isLoading = true;
    notifyListeners();

    try {
      AppointmentServices service = AppointmentServices();
      AppointmentModel appointmentModel = await service.fetchAppointments();
      _appointments = appointmentModel.data ?? [];
      _totalCount = appointmentModel.totalCount ?? 0;
    } catch (error) {
      print('Failed to load appointments: $error');
    }

    isLoading = false;
    notifyListeners();
  }
}



