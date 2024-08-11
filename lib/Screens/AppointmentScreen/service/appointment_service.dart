import 'dart:convert';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/model/appointment_resopnse_model.dart';
import 'package:healtether_clinic_app/constants.dart';
import 'package:healtether_clinic_app/utils/save_token.dart';
import 'package:http/http.dart' as http;


class AppointmentServices {
  // final String token =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDc3OWFjNTU0NTE1YzQ3ZTNiODkwZCIsImlhdCI6MTcxODk0ODIyNywiZXhwIjoxNzE5MTIxMDI3fQ.diFaNkPztjTzm0jfrAWmhkREHglj080JKdlNtufNgDY';
  String tokens = "";
  Future<void> fetchToken() async {
    tokens = (await SharedPrefService.getAccessToken())!;
    print(tokens);
  }

  Future<AppointmentModel> fetchAppointments() async {
    await fetchToken();
    String url = ApiEndPoint.getAppointment();

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokens'
        },
      );

      if (response.statusCode == 200) {
        String body = response.body;
        print('Response body: $body');
        Map<String, dynamic> jsonResponse = jsonDecode(body);
        return AppointmentModel.fromJson(jsonResponse);
      } else {
        print('Failed to load appointments: ${response.statusCode}');
        throw 'Failed to load appointments: ${response.statusCode}';
      }
    } catch (e) {
      print('Exception during fetchAppointments: $e');
      throw 'Failed to load appointments: $e';
    }
  }

}
// Future<List<AppointmentResponse>> fetchAppointments() async {
//   await fetchToken();
//   String url = ApiEndPoint.getAppointment();
//
//   try {
//     final response = await http.get(
//       Uri.parse(url),
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Authorization': 'Bearer $tokens'
//       },
//     );
//
//     if (response.statusCode == 200) {
//       String body = response.body;
//       print('Response body: $body');
//       Map<String, dynamic> jsonResponse = jsonDecode(body);
//
//       if (jsonResponse.containsKey('data')) {
//         List<dynamic> appointmentList = jsonResponse['data'];
//         List<AppointmentResponse> appointments = appointmentList
//             .map((json) => AppointmentResponse.fromJson(json))
//             .toList();
//         return appointments;
//       } else {
//         print('Key "data" not found in response');
//         throw 'Key "data" not found in response';
//       }
//     } else {
//       print('Failed to load appointments: ${response.statusCode}');
//       throw 'Failed to load appointments: ${response.statusCode}';
//     }
//   } catch (e) {
//     print('Exception during fetchAppointments: $e');
//     throw 'Failed to load appointments: $e';
//   }
// }