import 'dart:convert';

class OtpResponseData {
  bool status;
  String message;
  bool isMatched;
  String userId;

  OtpResponseData({
    required this.status,
    required this.message,
    required this.isMatched,
    required this.userId,
  });

  factory OtpResponseData.fromJson(String str) => OtpResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OtpResponseData.fromMap(Map<String, dynamic> json) => OtpResponseData(
    status: json["status"],
    message: json["message"],
    isMatched: json["isMatched"],
    userId: json["userId"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "isMatched": isMatched,
    "userId": userId,
  };
}
