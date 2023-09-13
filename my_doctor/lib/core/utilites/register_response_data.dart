import 'dart:convert';

class RegisterResponseData {
  Data data;
  int httpStatus;

  RegisterResponseData({
    required this.data,
    required this.httpStatus,
  });

  factory RegisterResponseData.fromJson(String str) => RegisterResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseData.fromMap(Map<String, dynamic> json) => RegisterResponseData(
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
  bool isAdded;
  String userId;

  Data({
    required this.status,
    required this.message,
    required this.isAdded,
    required this.userId,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    status: json["status"],
    message: json["message"],
    isAdded: json["isAdded"],
    userId: json["userId"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "isAdded": isAdded,
    "userId": userId,
  };
}
