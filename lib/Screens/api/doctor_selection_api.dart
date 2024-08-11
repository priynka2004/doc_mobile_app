import 'dart:convert';
import 'package:http/http.dart' as http;

class DoctorApi {
  Future<List<Map<String, String>>> fetchDoctors() async {
    final response = await http.get(Uri.parse(
        'https://api-uhi.azurewebsites.net/api/staff/getdoctorsbyclinic?clinicId=65be5ecf4d5cb412fc374d60'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<Map<String, String>> doctorsList = [];
      data.forEach((doctor) {
        final firstName = doctor['firstName'] ?? '';
        final lastName = doctor['lastName'] ?? '';
        final specialization = doctor['specialization'] ?? '';
        final id = doctor['_id'] ?? ''; // Retrieve doctor's ID
        doctorsList.add({
          'id': id,
          'firstName': firstName,
          'lastName': lastName,
          'specialization': specialization,
        });
      });
      return doctorsList;
    } else {
      throw Exception('Failed to load doctors');
    }
  }
}
