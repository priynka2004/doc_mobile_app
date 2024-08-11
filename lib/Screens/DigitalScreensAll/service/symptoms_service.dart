import 'dart:convert';
import 'package:healtether_clinic_app/constants.dart';
import 'package:healtether_clinic_app/utils/save_token.dart';
import 'package:http/http.dart' as http;

class CreateSymptomsService {
  String tokens = "";

  Future<String?> fetchToken() async {
    return tokens = (await SharedPrefService.getAccessToken())!;
  }

  Future<Map<String, dynamic>> createSymptoms(
      String searchText, List<String> selectedSymptoms, List<String> selectedDiagnoses) async {
    print("Token: $tokens");

    String url = ApiEndPoint.createSymptoms;
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode({
        "search_text": searchText,
        "input_symptoms": selectedSymptoms,
        "input_diagnoses": selectedDiagnoses,
        "n_diseases": 3,
        "n_symptoms": 3,
        "min_symptoms": 3
      }),
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Decoded response: $data");

      if (data.containsKey('search_output')) {
        final searchOutput = data['search_output'];
        print("Search output: $searchOutput");

        final symptomsList = searchOutput['Symptoms'] as List<dynamic>?;
        final diagnosesList = searchOutput['Diagnoses'] as List<dynamic>?;
        final associatedSymptomsList = data['Associated_Symptoms'] as List<dynamic>?;
        final differentialDiagnosesList = data['Differential Diagnoses'] as List<dynamic>?;

        return {
          'symptoms': symptomsList?.cast<String>() ?? [],
          'diagnoses': diagnosesList?.cast<String>() ?? [],
          'associatedSymptoms': associatedSymptomsList?.cast<String>() ?? [],
          'differentialDiagnoses': differentialDiagnosesList?.cast<String>() ?? [],
        };
      } else {
        throw Exception('Missing "search_output" key in response');
      }
    } else {
      throw Exception(
          'Failed to create symptoms (Status code: ${response.statusCode})');
    }
  }
}
