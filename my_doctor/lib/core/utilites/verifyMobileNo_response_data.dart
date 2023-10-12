import 'dart:convert';

class VerifymobilenoResponseData {
  bool status;
  String message;
  bool isVerified;
  String otp;

  VerifymobilenoResponseData({
    required this.status,
    required this.message,
    required this.isVerified,
    required this.otp,
  });

  factory VerifymobilenoResponseData.fromJson(String str) => VerifymobilenoResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VerifymobilenoResponseData.fromMap(Map<String, dynamic> json) => VerifymobilenoResponseData(
    status: json["status"],
    message: json["message"],
    isVerified: json["isVerified"],
    otp: json["otp"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "isVerified": isVerified,
    "otp": otp,
  };
}
