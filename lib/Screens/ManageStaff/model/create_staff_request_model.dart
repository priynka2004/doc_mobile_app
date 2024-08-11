import 'package:healtether_clinic_app/Screens/ManageStaff/model/create_staff_model.dart';

class CreateStaffResponse {
  CreateStaff? createStaff;

  CreateStaffResponse({this.createStaff});

  CreateStaffResponse.fromJson(Map<String, dynamic> json) {
    createStaff = json['createStaff'] != null
        ? CreateStaff.fromJson(json['createStaff'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (createStaff != null) {
      data['createStaff'] = createStaff!.toJson();
    }
    return data;
  }
}






