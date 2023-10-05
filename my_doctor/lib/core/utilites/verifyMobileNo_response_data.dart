import 'dart:convert';

class VerifymobilenoResponseData {
  Data data;
  int httpStatus;

  VerifymobilenoResponseData({
    required this.data,
    required this.httpStatus,
  });

  factory VerifymobilenoResponseData.fromJson(String str) => VerifymobilenoResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VerifymobilenoResponseData.fromMap(Map<String, dynamic> json) => VerifymobilenoResponseData(
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
  bool isVerified;
  String otp;

  Data({
    required this.status,
    required this.message,
    required this.isVerified,
    required this.otp,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
