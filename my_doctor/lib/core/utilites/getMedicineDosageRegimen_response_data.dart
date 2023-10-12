import 'dart:convert';

class GetmedicinedodageregimenResponseData {
  bool status;
  String message;
  List<Datum> data;

  GetmedicinedodageregimenResponseData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetmedicinedodageregimenResponseData.fromJson(String str) => GetmedicinedodageregimenResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetmedicinedodageregimenResponseData.fromMap(Map<String, dynamic> json) => GetmedicinedodageregimenResponseData(
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
  String regimen;

  Datum({
    required this.id,
    required this.regimen,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    regimen: json["regimen"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "regimen": regimen,
  };
}
