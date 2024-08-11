import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_request_model.dart';

class GetStaffResponse {
  List<StaffModel>? data;
  int? totalCount;

  GetStaffResponse({this.data, this.totalCount});

  GetStaffResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StaffModel>[];
      json['data'].forEach((v) {
        data!.add(StaffModel.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = totalCount;
    return data;
  }
}
