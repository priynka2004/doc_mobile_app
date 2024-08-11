import 'dart:convert';
import 'package:healtether_clinic_app/utils/save_token.dart';
import 'package:http/http.dart' as http;

class TimeSlotApi {
  String tokens = "";

  Future<void> fetchToken() async {
    tokens = (await SharedPrefService.getAccessToken())!;
    print(tokens);
  }

  Future<List<Map<String, dynamic>>> fetchTimeSlots() async {
    final response = await http.get(
      Uri.parse(
          'https://api-uhi.azurewebsites.net/api/clinic/getclinictimeslots?id=65be5ecf4d5cb412fc374d60'),
      headers: <String, String>{
        'Authorization': 'Bearer $tokens',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<Map<String, dynamic>> timeSlotsList = [];
      data.forEach((timeSlot) {
        final startTime = timeSlot['startTime'] ?? {};
        final endTime = timeSlot['endTime'] ?? {};
        timeSlotsList.add({
          'startTime': {
            'hours': startTime['hours'] ?? 0,
            'min': startTime['min'] ?? 0,
            'tt': startTime['tt'] ?? '',
          },
          'endTime': {
            'hours': endTime['hours'] ?? 0,
            'min': endTime['min'] ?? 0,
            'tt': endTime['tt'] ?? '',
          }
        });
      });
      return timeSlotsList;
    } else {
      throw Exception('Failed to load time slots');
    }
  }
}
