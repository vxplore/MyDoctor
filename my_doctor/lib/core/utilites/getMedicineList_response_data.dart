import 'dart:convert';

class GetmedicinesResponseData {
  bool status;
  String message;
  List<Medicine> medicine;

  GetmedicinesResponseData({
    required this.status,
    required this.message,
    required this.medicine,
  });

  factory GetmedicinesResponseData.fromJson(String str) => GetmedicinesResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetmedicinesResponseData.fromMap(Map<String, dynamic> json) => GetmedicinesResponseData(
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
  String medNameId;
  String medFormId;
  String medDoseId;
  String medDurationId;
  String medRegimenId;
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
    required this.medNameId,
    required this.medFormId,
    required this.medDoseId,
    required this.medDurationId,
    required this.medRegimenId,
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
    medNameId: json["medNameId"],
    medFormId: json["medFormId"],
    medDoseId: json["medDoseId"],
    medDurationId: json["medDurationId"],
    medRegimenId: json["medRegimenId"],
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
    "medNameId": medNameId,
    "medFormId": medFormId,
    "medDoseId": medDoseId,
    "medDurationId": medDurationId,
    "medRegimenId": medRegimenId,
    "duration": duration,
    "regimen": regimen,
    "type": type,
    "dose": dose,
    "name": name,
  };
}
