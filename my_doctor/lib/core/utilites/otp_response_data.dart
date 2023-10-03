import 'dart:convert';

class OtpResponseData {
  Data data;
  int httpStatus;

  OtpResponseData({
    required this.data,
    required this.httpStatus,
  });

  factory OtpResponseData.fromJson(String str) =>
      OtpResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OtpResponseData.fromMap(Map<String, dynamic> json) => OtpResponseData(
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
  bool isMatched;
  String userId;

  Data({
    required this.status,
    required this.message,
    required this.isMatched,
    required this.userId,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
