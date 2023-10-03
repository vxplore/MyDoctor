import 'dart:convert';

class AddpatientpersonalinfoResponseData {
  Data data;
  int httpStatus;

  AddpatientpersonalinfoResponseData({
    required this.data,
    required this.httpStatus,
  });

  factory AddpatientpersonalinfoResponseData.fromJson(String str) =>
      AddpatientpersonalinfoResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddpatientpersonalinfoResponseData.fromMap(
          Map<String, dynamic> json) =>
      AddpatientpersonalinfoResponseData(
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

  Data({
    required this.status,
    required this.message,
    required this.isAdded,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        status: json["status"],
        message: json["message"],
        isAdded: json["isAdded"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "isAdded": isAdded,
      };
}
