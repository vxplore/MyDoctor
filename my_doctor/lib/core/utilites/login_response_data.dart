import 'dart:convert';

class LoginResponseData {
  Data data;
  int httpStatus;

  LoginResponseData({
    required this.data,
    required this.httpStatus,
  });

  factory LoginResponseData.fromJson(String str) => LoginResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseData.fromMap(Map<String, dynamic> json) => LoginResponseData(
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
  bool isUser;
  String userId;
  bool isMatched;

  Data({
    required this.status,
    required this.message,
    required this.isUser,
    required this.userId,
    required this.isMatched,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    status: json["status"],
    message: json["message"],
    isUser: json["isUser"],
    userId: json["userId"],
    isMatched: json["isMatched"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "isUser": isUser,
    "userId": userId,
    "isMatched": isMatched,
  };
}
