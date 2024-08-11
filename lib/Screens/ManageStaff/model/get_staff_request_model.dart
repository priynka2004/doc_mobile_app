class StaffModel {
  String? sId;
  String? staffId;
  String? firstName;
  String? lastName;
  bool? isDoctor;
  String? mobile;
  String? role;

  StaffModel(
      {this.sId,
        this.staffId,
        this.firstName,
        this.lastName,
        this.isDoctor,
        this.mobile,
        this.role});

  StaffModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    staffId = json['staffId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    isDoctor = json['isDoctor'];
    mobile = json['mobile'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['staffId'] = this.staffId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['isDoctor'] = this.isDoctor;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
    return data;
  }
}