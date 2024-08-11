import 'package:healtether_clinic_app/Screens/AppointmentScreen/model/appointment_request_model.dart';

class AppointmentModel {
  List<AppointmentResponse>? data;
  int? totalCount;

  AppointmentModel({this.data, this.totalCount});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AppointmentResponse>[];
      json['data'].forEach((v) {
        data!.add(AppointmentResponse.fromJson(v));
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


