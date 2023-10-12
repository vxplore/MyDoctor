import 'dart:convert';

class ProfessionaladdResponseData {
  bool status;
  String message;
  bool isAdded;

  ProfessionaladdResponseData({
    required this.status,
    required this.message,
    required this.isAdded,
  });

  factory ProfessionaladdResponseData.fromJson(String str) => ProfessionaladdResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfessionaladdResponseData.fromMap(Map<String, dynamic> json) => ProfessionaladdResponseData(
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
