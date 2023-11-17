import 'dart:convert';

class GetallpatientsResponseData {
  bool status;
  String message;
  List<Patient> patients;

  GetallpatientsResponseData({
    required this.status,
    required this.message,
    required this.patients,
  });

  factory GetallpatientsResponseData.fromRawJson(String str) => GetallpatientsResponseData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetallpatientsResponseData.fromJson(Map<String, dynamic> json) => GetallpatientsResponseData(
    status: json["status"],
    message: json["message"],
    patients: List<Patient>.from(json["patients"].map((x) => Patient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "patients": List<dynamic>.from(patients.map((x) => x.toJson())),
  };
}

class Patient {
  String name;
  String phoneNo;
  String gender;
  String patientId;
  String age;
  String ageType;
  String email;
  String bloodGroup;
  String referredBy;
  String address;
  String city;
  String pincode;
  String country;
  String maritalStatus;
  String height;
  String weight;
  String bmi;
  String profileImage;

  Patient({
    required this.name,
    required this.phoneNo,
    required this.gender,
    required this.patientId,
    required this.age,
    required this.ageType,
    required this.email,
    required this.bloodGroup,
    required this.referredBy,
    required this.address,
    required this.city,
    required this.pincode,
    required this.country,
    required this.maritalStatus,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.profileImage,
  });

  factory Patient.fromRawJson(String str) => Patient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    name: json["name"],
    phoneNo: json["phone_no"],
    gender: json["gender"],
    patientId: json["patient_id"],
    age: json["age"],
    ageType: json["age_type"],
    email: json["email"],
    bloodGroup: json["blood_group"],
    referredBy: json["referred_by"],
    address: json["address"],
    city: json["city"],
    pincode: json["pincode"],
    country: json["country"],
    maritalStatus: json["marital_status"],
    height: json["height"],
    weight: json["weight"],
    bmi: json["bmi"],
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone_no": phoneNo,
    "gender": gender,
    "patient_id": patientId,
    "age": age,
    "age_type": ageType,
    "email": email,
    "blood_group": bloodGroup,
    "referred_by": referredBy,
    "address": address,
    "city": city,
    "pincode": pincode,
    "country": country,
    "marital_status": maritalStatus,
    "height": height,
    "weight": weight,
    "bmi": bmi,
    "profileImage": profileImage,
  };
}
