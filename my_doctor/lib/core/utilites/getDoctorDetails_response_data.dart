import 'dart:convert';

class GetdoctordetailsResponseData {
  Data data;
  int httpStatus;

  GetdoctordetailsResponseData({
    required this.data,
    required this.httpStatus,
  });

  factory GetdoctordetailsResponseData.fromJson(String str) => GetdoctordetailsResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetdoctordetailsResponseData.fromMap(Map<String, dynamic> json) => GetdoctordetailsResponseData(
    data: Data.fromMap(json["data"]),
    httpStatus: json["http_status"],
  );

  Map<String, dynamic> toMap() => {
    "data": data.toMap(),
    "http_status": httpStatus,
  };
}

class Data {
  bool status;
  String message;
  Doctor doctor;

  Data({
    required this.status,
    required this.message,
    required this.doctor,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
