import 'dart:convert';

class SpecialityDropdownData {
  bool status;
  String message;
  List<Specialization> specializations;

  SpecialityDropdownData({
    required this.status,
    required this.message,
    required this.specializations,
  });

  factory SpecialityDropdownData.fromJson(String str) => SpecialityDropdownData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SpecialityDropdownData.fromMap(Map<String, dynamic> json) => SpecialityDropdownData(
    status: json["status"],
    message: json["message"],
    specializations: List<Specialization>.from(json["specializations"].map((x) => Specialization.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "specializations": List<dynamic>.from(specializations.map((x) => x.toMap())),
  };
}

class Specialization {
  String id;
  String name;

  Specialization({
    required this.id,
    required this.name,
  });

  factory Specialization.fromJson(String str) => Specialization.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Specialization.fromMap(Map<String, dynamic> json) => Specialization(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
