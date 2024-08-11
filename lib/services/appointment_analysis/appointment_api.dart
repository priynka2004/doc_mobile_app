import 'dart:convert';
import 'package:http/http.dart' as http;

class AppointmentService{
  final String apiUrl;

  AppointmentService(this.apiUrl);

  Future<Map<String, dynamic>> fetchData() async
  {
    try{
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200){
        return json.decode(response.body);
      }else{
        throw Exception("Failed to load data");
      }
    }catch (error){
      throw Exception("Error: $error");
    }
  }}