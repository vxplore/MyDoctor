import 'dart:convert';

class GetmedicinedodagequantityResponseData {
  bool status;
  String message;
  List<Datum> data;

  GetmedicinedodagequantityResponseData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetmedicinedodagequantityResponseData.fromJson(String str) => GetmedicinedodagequantityResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetmedicinedodagequantityResponseData.fromMap(Map<String, dynamic> json) => GetmedicinedodagequantityResponseData(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  String id;
  String dose;

  Datum({
    required this.id,
    required this.dose,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    dose: json["dose"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "dose": dose,
  };
}
