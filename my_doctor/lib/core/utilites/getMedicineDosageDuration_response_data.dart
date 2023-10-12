import 'dart:convert';

class GetmedicinedodagedurationResponseData {
  bool status;
  String message;
  List<Datum> data;

  GetmedicinedodagedurationResponseData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetmedicinedodagedurationResponseData.fromJson(String str) => GetmedicinedodagedurationResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetmedicinedodagedurationResponseData.fromMap(Map<String, dynamic> json) => GetmedicinedodagedurationResponseData(
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
  String duration;

  Datum({
    required this.id,
    required this.duration,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    duration: json["duration"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "duration": duration,
  };
}
