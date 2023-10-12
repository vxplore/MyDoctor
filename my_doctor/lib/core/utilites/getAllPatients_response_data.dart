import 'dart:convert';

class GetallpatientsResponseData {
  bool status;
  String message;
  List<Patient> patients;

  GetallpatientsResponseData({
    required this.status,
    required this.message,
    required this.patients,
  });

  factory GetallpatientsResponseData.fromJson(String str) => GetallpatientsResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetallpatientsResponseData.fromMap(Map<String, dynamic> json) => GetallpatientsResponseData(
    status: json["status"],
    message: json["message"],
    patients: List<Patient>.from(json["patients"].map((x) => Patient.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "patients": List<dynamic>.from(patients.map((x) => x.toMap())),
  };
}

class Patient {
  String age;
  String profileImage;
  String name;
  String phoneNumber;
  String gender;
  String id;
  String ageType;

  Patient({
    required this.age,
    required this.profileImage,
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.id,
    required this.ageType,
  });

  factory Patient.fromJson(String str) => Patient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Patient.fromMap(Map<String, dynamic> json) => Patient(
    age: json["age"],
    profileImage: json["profileImage"],
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    id: json["id"],
    ageType: json["age_type"],
  );

  Map<String, dynamic> toMap() => {
    "age": age,
    "profileImage": profileImage,
    "name": name,
    "phoneNumber": phoneNumber,
    "gender": gender,
    "id": id,
    "age_type": ageType,
  };
}
