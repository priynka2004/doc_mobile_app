import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:healtether_clinic_app/models/patient/patient_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PatientApi {
  static Future<List<dynamic>> getPatent(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String token = prefs.getString('token')!;

      http.Response respnse = await http.get(
          Uri.parse(
              "https://api-uhi.azurewebsites.net/api/patient/getpatients?clientId=$id&page=0&size=5"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
            'Authorization': 'Bearer $token'
          });
      if (kDebugMode) {
        print("response found");
      }

      if (respnse.statusCode == 200) {
        var result = jsonDecode(respnse.body);

        List<dynamic> patients = result['data'];

        return patients;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<PatientModel?> getFullPatientRecord(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      String token = prefs.getString('token')!;
      http.Response response = await http.get(
          Uri.parse(
              "https://api-uhi.azurewebsites.net/api/patient/getpatientlatestappointment?id=$id"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
            'Authorization': 'Bearer $token'
          });

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        PatientModel patient = PatientModel.fromJson(result);

        if (kDebugMode) {
          print(patient);
        }

        return patient;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
