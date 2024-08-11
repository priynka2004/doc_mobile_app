import 'package:healtether_clinic_app/Screens/patients_records/model/patient_model.dart';

class PatientResponse {
  List<PatientModel>? data;
  int? totalCount;

  PatientResponse({this.data, this.totalCount});

  PatientResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PatientModel>[];
      json['data'].forEach((v) {
        data!.add(PatientModel.fromJson(v));
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



