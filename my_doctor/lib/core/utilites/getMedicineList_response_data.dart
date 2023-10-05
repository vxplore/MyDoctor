import 'dart:convert';

class GetmedicinesResponseData {
  Data data;
  int httpStatus;

  GetmedicinesResponseData({
    required this.data,
    required this.httpStatus,
  });

  factory GetmedicinesResponseData.fromJson(String str) => GetmedicinesResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetmedicinesResponseData.fromMap(Map<String, dynamic> json) => GetmedicinesResponseData(
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
  List<Medicine> medicine;

  Data({
    required this.status,
    required this.message,
    required this.medicine,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    status: json["status"],
    message: json["message"],
    medicine: List<Medicine>.from(json["medicine"].map((x) => Medicine.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "medicine": List<dynamic>.from(medicine.map((x) => x.toMap())),
  };
}

class Medicine {
  String id;
  String medTime;
  String startFrom;
  String remarks;
  String language;
  String duration;
  String regimen;
  String type;
  String dose;
  String name;

  Medicine({
    required this.id,
    required this.medTime,
    required this.startFrom,
    required this.remarks,
    required this.language,
    required this.duration,
    required this.regimen,
    required this.type,
    required this.dose,
    required this.name,
  });

  factory Medicine.fromJson(String str) => Medicine.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Medicine.fromMap(Map<String, dynamic> json) => Medicine(
    id: json["id"],
    medTime: json["medTime"],
    startFrom: json["startFrom"],
    remarks: json["remarks"],
    language: json["language"],
    duration: json["duration"],
    regimen: json["regimen"],
    type: json["type"],
    dose: json["dose"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "medTime": medTime,
    "startFrom": startFrom,
    "remarks": remarks,
    "language": language,
    "duration": duration,
    "regimen": regimen,
    "type": type,
    "dose": dose,
    "name": name,
  };
}
