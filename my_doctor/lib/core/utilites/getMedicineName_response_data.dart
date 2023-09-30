import 'dart:convert';

class GetmedicinenameResponseData {
  Data data;
  int httpStatus;

  GetmedicinenameResponseData({
    required this.data,
    required this.httpStatus,
  });

  factory GetmedicinenameResponseData.fromJson(String str) => GetmedicinenameResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetmedicinenameResponseData.fromMap(Map<String, dynamic> json) => GetmedicinenameResponseData(
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
  List<Datum> data;

  Data({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
