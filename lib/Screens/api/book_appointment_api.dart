import 'dart:convert';
import 'package:http/http.dart' as http;

class BookAppointmentApi {
  static Future<void> bookAppointment({
    required String token,
    required String mobile,
    required String name,
    required String gender,
    required String age,
    required String birthDate,
    required String appointmentDate,
    required String timeSlot,
    required String reason,
    required String patientId,
    required String doctorId,
    required String doctorName,
    required String clientId,
  }) async {
    String url = 'https://api-uhi.azurewebsites.net/api/appointment/upsert';
    Map<String, dynamic> body = {
      'data': {
        'mobile': mobile,
        'name': name,
        'gender': gender,
        'age': age,
        'birthDate': birthDate,
        'appointmentDate': appointmentDate,
        'timeSlot': timeSlot,
        'reason': reason,
        'virtualConsultation': 'false',
        'patientId': patientId,
        'doctorId': doctorId,
        'doctorName': doctorName,
        'clientId': clientId,
      }
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print('Appointment created successfully.');
      } else {
        print('Failed to create appointment: ${response.body}');
      }
    } catch (e) {
      print('Error creating appointment: $e');
    }
  }
}
