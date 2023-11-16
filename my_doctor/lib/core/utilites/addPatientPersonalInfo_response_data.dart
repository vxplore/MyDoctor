import 'dart:convert';

class AddpatientpersonalinfoResponseData {
  bool status;
  String message;
  bool isAdded;

  AddpatientpersonalinfoResponseData({
    required this.status,
    required this.message,
    required this.isAdded,
  });

  factory AddpatientpersonalinfoResponseData.fromJson(String str) => AddpatientpersonalinfoResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddpatientpersonalinfoResponseData.fromMap(Map<String, dynamic> json) => AddpatientpersonalinfoResponseData(
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
