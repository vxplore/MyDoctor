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
  String profileImage;
  String name;
  String phoneNo;

  Doctor({
    required this.docId,
    required this.registrationNo,
    required this.profileImage,
    required this.name,
    required this.phoneNo,
  });

  factory Doctor.fromJson(String str) => Doctor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Doctor.fromMap(Map<String, dynamic> json) => Doctor(
    docId: json["docId"],
    registrationNo: json["registrationNo"],
    profileImage: json["profileImage"],
    name: json["name"],
    phoneNo: json["phoneNo"],
  );

  Map<String, dynamic> toMap() => {
    "docId": docId,
    "registrationNo": registrationNo,
    "profileImage": profileImage,
    "name": name,
    "phoneNo": phoneNo,
  };
}
