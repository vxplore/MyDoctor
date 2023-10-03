import 'dart:convert';

class AddmedicineResponseData {
  Data data;
  int httpStatus;

  AddmedicineResponseData({
    required this.data,
    required this.httpStatus,
  });

  factory AddmedicineResponseData.fromJson(String str) =>
      AddmedicineResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddmedicineResponseData.fromMap(Map<String, dynamic> json) =>
      AddmedicineResponseData(
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
