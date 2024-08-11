import 'package:flutter/material.dart';

class AppointmentData extends ChangeNotifier {
  final List<Appointments> _appointments = [];

  List<Appointments> get appointments => _appointments;

  void addAppointment(Appointments appointment) {
    _appointments.add(appointment);
    notifyListeners();
  }

  void deleteAppointment(Appointments appointment) {
    _appointments.removeWhere((element) => element == appointment);
    notifyListeners();
  }
}

class Appointments {
  String name;
  String mobileNo;
  String doctor;
  DateTime? selectedDate;
  bool isVirtualConsultation;
  bool isCancelled;
  DateTime? dob;

  Appointments({
    required this.name,
    required this.mobileNo,
    required this.doctor,
    required this.selectedDate,
    required this.isVirtualConsultation,
    required this.isCancelled,
    required this.dob,
  });
}
