class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String? email;
  final bool isSuperAdmin;
  final List<dynamic> linkedClinics;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    required this.isSuperAdmin,
    required this.linkedClinics,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        isSuperAdmin: json["isSuperAdmin"],
        linkedClinics:
            List<dynamic>.from(json["linkedClinics"].map((x) => x) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "isSuperAdmin": isSuperAdmin,
        "linkedClinics": List<dynamic>.from(linkedClinics.map((x) => x)),
      };
}
