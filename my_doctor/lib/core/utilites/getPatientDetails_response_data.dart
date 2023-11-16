import 'dart:convert';

class GetpatientdetailsResponseData {
  bool status;
  String message;
  Patient patient;

  GetpatientdetailsResponseData({
    required this.status,
    required this.message,
    required this.patient,
  });

  factory GetpatientdetailsResponseData.fromJson(String str) => GetpatientdetailsResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetpatientdetailsResponseData.fromMap(Map<String, dynamic> json) => GetpatientdetailsResponseData(
    status: json["status"],
    message: json["message"],
    patient: Patient.fromMap(json["patient"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "patient": patient.toMap(),
  };
}

class Patient {
  String userId;
  String name;
  String phoneNo;
  String gender;
  String doctorsId;
  String patientId;
  String age;
  String ageType;
  String email;
  String height;
  String weight;
  String bmi;
  String profileImage;

  Patient({
    required this.userId,
    required this.name,
    required this.phoneNo,
    required this.gender,
    required this.doctorsId,
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
    userId: json["user_id"],
    name: json["name"],
    phoneNo: json["phone_no"],
    gender: json["gender"],
    doctorsId: json["doctors_id"],
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
    "user_id": userId,
    "name": name,
    "phone_no": phoneNo,
    "gender": gender,
    "doctors_id": doctorsId,
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
