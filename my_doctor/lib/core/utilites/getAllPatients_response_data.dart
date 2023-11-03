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
  String name;
  String phoneNo;
  String gender;
  String patientId;
  String age;
  String ageType;
  String email;
  String height;
  String weight;
  String bmi;
  String profileImage;

  Patient({
    required this.name,
    required this.phoneNo,
    required this.gender,
    required this.patientId,
    required this.age,
    required this.ageType,
    required this.email,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.profileImage,
  });

  factory Patient.fromJson(String str) => Patient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Patient.fromMap(Map<String, dynamic> json) => Patient(
    name: json["name"],
    phoneNo: json["phone_no"],
    gender: json["gender"],
    patientId: json["patient_id"],
    age: json["age"],
    ageType: json["age_type"],
    email: json["email"],
    height: json["height"],
    weight: json["weight"],
    bmi: json["bmi"],
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "phone_no": phoneNo,
    "gender": gender,
    "patient_id": patientId,
    "age": age,
    "age_type": ageType,
    "email": email,
    "height": height,
    "weight": weight,
    "bmi": bmi,
    "profileImage": profileImage,
  };
}
