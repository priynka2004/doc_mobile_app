import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/create_staff_model.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/create_staff_request_model.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_request_model.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_response_model.dart';
import 'package:healtether_clinic_app/constants.dart';
import 'package:healtether_clinic_app/utils/save_token.dart';
import 'package:http/http.dart' as http;




class StaffServices {
  // final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDc3OWFjNTU0NTE1YzQ3ZTNiODkwZCIsImlhdCI6MTcxODk0ODIyNywiZXhwIjoxNzE5MTIxMDI3fQ.diFaNkPztjTzm0jfrAWmhkREHglj080JKdlNtufNgDY';
  String tokens = "";

  Future<void> fetchToken() async {
    tokens = (await SharedPrefService.getAccessToken())!;
    print(tokens);
  }

  Future<List<StaffModel>> fetchStaff() async {
    await fetchToken();

    String url = ApiEndPoint.getStaff;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokens'
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse.containsKey('data')) {
          List<dynamic> dataList = jsonResponse['data'];
          List<StaffModel> staffList =
              dataList.map((json) => StaffModel.fromJson(json)).toList();
          return staffList;
        } else {
          throw 'Key "data" not found in response';
        }
      } else {
        throw 'Failed to load data: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Failed to load data: $e';
    }
  }

  Future<void> deleteStaff(String id) async {
    await fetchToken();
    String url = 'https://api-uhi.azurewebsites.net/api/staff/deletestaff?id=$id';
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
          print('Delete Staff successful');
        }
      } else {
        if (kDebugMode) {
          print(
              'Delete Staff request failed with status: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Delete Staff Error: $e');
      }
    }
  }

  // Future<bool> addNewStaff(Staff newStaff) async {
  //   try {
  //     final url = Uri.parse(ApiEndPoint.addStaff);
  //     final headers = {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $tokens', // Ensure tokens is correctly set
  //     };
  //
  //     final body = jsonEncode(newStaff.toJson());
  //
  //     final response = await http.post(
  //       url,
  //       headers: headers,
  //       body: body,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> jsonResponse = json.decode(response.body);
  //
  //       if (jsonResponse['isSuccess'] == true) {
  //         print('Staff added successfully');
  //         return true;
  //       } else {
  //         print('Error: ${jsonResponse['description']}');
  //         return false;
  //       }
  //     } else {
  //       print('Failed to add staff. Status code: ${response.statusCode}');
  //       print('Server error: ${response.body}');
  //       return false;
  //     }
  //   } catch (e) {
  //     print('Error during API call: $e');
  //     return false;
  //   }
  // }

  Future<CreateStaffResponse> createStaff(CreateStaff createStaff) async {
    await fetchToken();

    String url = ApiEndPoint.createStaff;
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens'
      },
      // body: json.encode(createStaff.toJson()),
      body: json.encode({"data":createStaff.toJson()}),
    );
    print("res:::::${response.body}");

    if (response.statusCode == 200) {
      return CreateStaffResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create staff');
    }
  }
}
