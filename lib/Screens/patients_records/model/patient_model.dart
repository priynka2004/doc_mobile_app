import 'package:healtether_clinic_app/Screens/patients_records/model/appointments_model.dart';

class PatientModel {
  String? sId;
  String? patientId;
  String? firstName;
  String? lastName;
  String? mobile;
  List<Appointments>? appointments;
  String? id;

  PatientModel(
      {this.sId,
        this.patientId,
        this.firstName,
        this.lastName,
        this.mobile,
        this.appointments,
        this.id});

  PatientModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    patientId = json['patientId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(Appointments.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['patientId'] = patientId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['mobile'] = mobile;
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    return data;
  }
}