class AppointmentResponse {
  String? sId;
  String? mobile;
  String? name;
  String? appointmentDate;
  String? timeSlot;
  bool? virtualConsultation;
  String? doctorName;
  String? patientId;
  String? id;

  AppointmentResponse(
      {this.sId,
        this.mobile,
        this.name,
        this.appointmentDate,
        this.timeSlot,
        this.virtualConsultation,
        this.doctorName,
        this.patientId,
        this.id});

  AppointmentResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mobile = json['mobile'];
    name = json['name'];
    appointmentDate = json['appointmentDate'];
    timeSlot = json['timeSlot'];
    virtualConsultation = json['virtualConsultation'];
    doctorName = json['doctorName'];
    patientId = json['patientId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['mobile'] = mobile;
    data['name'] = name;
    data['appointmentDate'] = appointmentDate;
    data['timeSlot'] = timeSlot;
    data['virtualConsultation'] = virtualConsultation;
    data['doctorName'] = doctorName;
    data['patientId'] = patientId;
    data['id'] = id;
    return data;
  }
}