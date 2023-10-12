import 'dart:convert';

class GetmedicinenameResponseData {
  bool status;
  String message;
  List<Datum> data;

  GetmedicinenameResponseData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetmedicinenameResponseData.fromJson(String str) => GetmedicinenameResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetmedicinenameResponseData.fromMap(Map<String, dynamic> json) => GetmedicinenameResponseData(
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
  String name;

  Datum({
    required this.id,
    required this.name,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
