import 'dart:convert';

class SpecialityDropdownData {
  Data data;
  int httpStatus;

  SpecialityDropdownData({
    required this.data,
    required this.httpStatus,
  });

  factory SpecialityDropdownData.fromJson(String str) =>
      SpecialityDropdownData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SpecialityDropdownData.fromMap(Map<String, dynamic> json) =>
      SpecialityDropdownData(
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
  List<Specialization> specializations;

  Data({
    required this.status,
    required this.message,
    required this.specializations,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        status: json["status"],
        message: json["message"],
        specializations: List<Specialization>.from(
            json["specializations"].map((x) => Specialization.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "specializations":
            List<dynamic>.from(specializations.map((x) => x.toMap())),
      };
}

class Specialization {
  String id;
  String name;

  Specialization({
    required this.id,
    required this.name,
  });

  factory Specialization.fromJson(String str) =>
      Specialization.fromMap(json.decode(str));

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
