import 'dart:convert';

class LoginResponseData {
  bool status;
  String message;
  bool isUser;
  String userId;
  bool isMatched;

  LoginResponseData({
    required this.status,
    required this.message,
    required this.isUser,
    required this.userId,
    required this.isMatched,
  });

  factory LoginResponseData.fromJson(String str) => LoginResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseData.fromMap(Map<String, dynamic> json) => LoginResponseData(
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
