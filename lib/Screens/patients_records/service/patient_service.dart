import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/patient_response_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/post/patient_create_model.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import '../../../utils/save_token.dart';

class GetPatientService {
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDc3OWFjNTU0NTE1YzQ3ZTNiODkwZCIsImlhdCI6MTcxODk0ODIyNywiZXhwIjoxNzE5MTIxMDI3fQ.diFaNkPztjTzm0jfrAWmhkREHglj080JKdlNtufNgDY';
  String tokens = "";

  Future<void> fetchToken() async {
    tokens = (await SharedPrefService.getAccessToken())!;
    print(tokens);
  }

  Future<PatientResponse> fetchPatients() async {
    await fetchToken();
    String url = ApiEndPoint.getPatient;
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $tokens',
      },
    );
    if (response.statusCode == 200) {
      String body = response.body;
      print('Response body: $body');
      final data = jsonDecode(body);
      return PatientResponse.fromJson(data);
    } else {
      throw Exception('Failed to load patients: ${response.statusCode}');
    }
  }

  Future<PatientCreate> postPatient(PatientCreate patientCreate) async {
    try {
      await fetchToken();
      final url = Uri.parse(ApiEndPoint.postPatient);
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokens',
      };
      final body = json.encode({"patientData": patientCreate.toJson()});

      http.Response response =
          await http.post(url, headers: headers, body: body);
      print("res:::::${response.body}");
      if (response.statusCode == 200) {
        return PatientCreate.fromJson(json.decode(response.body));
      } else {
        print(response.body);
        throw Exception('Failed to create patient');
      }
    } catch (e, strack) {
      print("strack:e:$e");
      print("strack:$strack");
      throw Exception('Failed to create patient throw catch');
    }
  }


  Future<void> deletePatient(String id) async {
    await fetchToken();
    String url =
        'https://api-uhi.azurewebsites.net/api/patient/deletepatient?id=$id';
    try {
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokens'
        },
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Delete Patient successful');
        }
      } else {
        if (kDebugMode) {
          print(
              'Delete Patient request failed with status: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Delete Patient Error: $e');
      }
    }
  }
}
