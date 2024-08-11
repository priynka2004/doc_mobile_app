import 'dart:convert';
import 'package:http/http.dart' as http;

class Appointment {
  final String mobile;
  final String id;
  final String name;
  final DateTime scheduleDate;
  final String timeSlot;
  final bool virtualConsultation;
  final String doctorName;

  Appointment({
    required this.id,
    required this.mobile,
    required this.name,
    required this.scheduleDate,
    required this.timeSlot,
    required this.virtualConsultation,
    required this.doctorName,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      mobile: json['mobile'] ?? '',
      name: json['name'] ?? '',
      scheduleDate: DateTime.parse(json['appointmentDate'] ?? ''),
      timeSlot: json['timeSlot'] ?? '',
      virtualConsultation: json['virtualConsultation'] ?? false,
      doctorName: json['doctorName'] ?? '',
      id: json['id'] ?? '',
    );
  }
}

class AppointmentApi {
  static const String _bearerToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YTUxNzBkNDFmMTk5ZmIwM2M0YTRkOSIsImlhdCI6MTcxMjE2MzYwMywiZXhwIjoxNzEyMzM2NDAzfQ.z6f7eRwxC4BMIVxy27usOJpF_znVN6vuJWy2jFSuqZk';

  Future<List<Appointment>> fetchAppointments() async {
    final response = await http.get(
      Uri.parse(
          'https://api-uhi.azurewebsites.net/api/appointment/getappointments?clinicId=65be5ecf4d5cb412fc374d60&page=1&size=5'),
      headers: {'Authorization': 'Bearer $_bearerToken'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> appointmentsData =
          data['data']; // Access appointments under 'data'

      List<Appointment> appointmentsList = [];
      appointmentsData.forEach((appointment) {
        appointmentsList.add(Appointment.fromJson(appointment));
      });
      return appointmentsList;
    } else {
      throw Exception('Failed to load appointments');
    }
  }

  Future<Appointment?> fetchAppointmentById(String id) async {
    final response = await http.get(
      Uri.parse(
          'https://api-uhi.azurewebsites.net/api/appointment/getappointment/$id'), // Change the URL to fetch appointment by ID
      headers: {'Authorization': 'Bearer $_bearerToken'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Appointment.fromJson(data); // Parse the fetched appointment data
    } else {
      throw Exception('Failed to load appointment');
    }
  }
}



