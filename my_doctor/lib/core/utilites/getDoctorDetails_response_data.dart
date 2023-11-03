import 'dart:convert';

class GetdoctordetailsResponseData {
  bool status;
  String message;
  Doctor doctor;

  GetdoctordetailsResponseData({
    required this.status,
    required this.message,
    required this.doctor,
  });

  factory GetdoctordetailsResponseData.fromJson(String str) => GetdoctordetailsResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetdoctordetailsResponseData.fromMap(Map<String, dynamic> json) => GetdoctordetailsResponseData(
    status: json["status"],
    message: json["message"],
    doctor: Doctor.fromMap(json["doctor"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "doctor": doctor.toMap(),
  };
}

class Doctor {
  String docId;
  String registrationNo;
  String email;
  String age;
  String gender;
  String qualifications;
  String medicalCouncil;
  String licenceNo;
  String degrees;
  String experiance;
  String profileImage;
  String name;
  String phineNo;

  Doctor({
    required this.docId,
    required this.registrationNo,
    required this.email,
    required this.age,
    required this.gender,
    required this.qualifications,
    required this.medicalCouncil,
    required this.licenceNo,
    required this.degrees,
    required this.experiance,
    required this.profileImage,
    required this.name,
    required this.phineNo,
  });

  factory Doctor.fromJson(String str) => Doctor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Doctor.fromMap(Map<String, dynamic> json) => Doctor(
    docId: json["docId"],
    registrationNo: json["registrationNo"],
    email: json["email"],
    age: json["age"],
    gender: json["gender"],
    qualifications: json["qualifications"],
    medicalCouncil: json["medicalCouncil"],
    licenceNo: json["licenceNo"],
    degrees: json["degrees"],
    experiance: json["experiance"],
    profileImage: json["profileImage"],
    name: json["name"],
    phineNo: json["phineNo"],
  );

  Map<String, dynamic> toMap() => {
    "docId": docId,
    "registrationNo": registrationNo,
    "email": email,
    "age": age,
    "gender": gender,
    "qualifications": qualifications,
    "medicalCouncil": medicalCouncil,
    "licenceNo": licenceNo,
    "degrees": degrees,
    "experiance": experiance,
    "profileImage": profileImage,
    "name": name,
    "phineNo": phineNo,
  };
}
