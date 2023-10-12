import 'dart:convert';

class RegisterResponseData {
  bool status;
  String message;
  bool isAdded;
  String userId;

  RegisterResponseData({
    required this.status,
    required this.message,
    required this.isAdded,
    required this.userId,
  });

  factory RegisterResponseData.fromJson(String str) => RegisterResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseData.fromMap(Map<String, dynamic> json) => RegisterResponseData(
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
