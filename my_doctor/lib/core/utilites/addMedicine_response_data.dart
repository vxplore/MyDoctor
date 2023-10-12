import 'dart:convert';

class AddmedicineResponseData {
  bool status;
  String message;
  bool isAdded;

  AddmedicineResponseData({
    required this.status,
    required this.message,
    required this.isAdded,
  });

  factory AddmedicineResponseData.fromJson(String str) => AddmedicineResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddmedicineResponseData.fromMap(Map<String, dynamic> json) => AddmedicineResponseData(
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
