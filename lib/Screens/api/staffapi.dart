import 'dart:convert';
import 'package:http/http.dart' as http;

class Staff {
  final String id;
  final String firstName;
  final String lastName;
  final String mobile;
  final bool isAdmin;

  Staff({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.isAdmin,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      mobile: json['mobile'] ?? '',
      isAdmin: json['linkedClinics'][0]['isAdmin'] ?? false,
    );
  }
}

class StaffApi {
  Future<List<Staff>> fetchStaff() async {
    final response = await http.get(
      Uri.parse(
          'https://api-uhi.azurewebsites.net/api/staff/getstaffs?clientId=65be5ecf4d5cb412fc374d60&page=0&size=5'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> staffData = jsonDecode(response.body)['data'];

      List<Staff> staffList = [];
      staffData.forEach((staff) {
        staffList.add(Staff.fromJson(staff));
      });
      return staffList;
    } else {
      throw Exception('Failed to load staff');
    }
  }

  Future<Staff?> fetchStaffById(String id) async {
    final response = await http.get(
      Uri.parse('https://api-uhi.azurewebsites.net/api/staff/getstaff/$id'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Staff.fromJson(data);
    } else {
      throw Exception('Failed to load staff details');
    }
  }
}
