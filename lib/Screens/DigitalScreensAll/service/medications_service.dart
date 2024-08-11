import 'dart:convert';

import 'package:healtether_clinic_app/Screens/DigitalScreensAll/model/create_medications_model.dart';
import 'package:healtether_clinic_app/constants.dart';
import 'package:healtether_clinic_app/utils/save_token.dart';
import 'package:http/http.dart' as http;

class MedicationsService {
  String tokens = "";

  Future<String?> fetchToken() async {
    return tokens = (await SharedPrefService.getAccessToken())!;
  }

  Future<CreateMedications?> createMedications(CreateMedications createMedications) async {
    await fetchToken();
    print("Token: $tokens");

    String url = ApiEndPoint.postMedicationDdx;
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(createMedications.toJson()),
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return CreateMedications.fromJson(jsonResponse);
    } else {
      print('Failed to post medications: ${response.body}');
      return null;
    }
  }
}
