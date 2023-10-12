import 'package:my_doctor/core/repository/repository.dart';
import 'package:my_doctor/core/utilites/addMedicine_response_data.dart';
import 'package:my_doctor/core/utilites/addPatientPersonalInfo_response_data.dart';
import 'package:my_doctor/core/utilites/getAllPatients_response_data.dart';
import 'package:my_doctor/core/utilites/getDoctorDetails_response_data.dart';
import 'package:my_doctor/core/utilites/getMedicineList_response_data.dart';
import 'package:my_doctor/core/utilites/otp_response_data.dart';
import 'package:my_doctor/core/utilites/professional_add_response_data.dart';
import 'package:my_doctor/core/utilites/register_response_data.dart';
import 'package:my_doctor/core/utilites/speciality_dropdown_data.dart';
import '../../service/global_variables.dart';
import '../utilites/login_response_data.dart';

class RepositoryImpl extends Repository {
  @override
  Future<LoginResponseData?> login(String email, String password) async {
    var result = await ApiRepo.login(email, password);
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resp = LoginResponseData.fromJson(rr);
      return resp;
    } else {
      return null;
    }
  }

  @override
  Future<RegisterResponseData?> register(String name, String number,
      String email, String password, String image) async {
    var result = await ApiRepo.register(name, number, email, password, image);
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resp = RegisterResponseData.fromJson(rr);
      return resp;
    } else {
      return null;
    }
  }

  @override
  Future<OtpResponseData?> otpverify(String otp, String phnumber) async {
    var result = await ApiRepo.otpverify(otp, phnumber);
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resp = OtpResponseData.fromJson(rr);
      return resp;
    } else {
      return null;
    }
  }

  @override
  Future getdoctorspecializationlist() async {
    var result = await ApiRepo.getdoctorspecializationlist();
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      globalVariables.res =
          SpecialityDropdownData.fromJson(rr).specializations;
      globalVariables.specialityapiName =
          globalVariables.res.map((e) => e.name.toString()).toList();
      print(globalVariables.specialityapiName);
    }
  }

  @override
  Future<ProfessionaladdResponseData?> addprofessionaldetails(
      String specialtyIds,
      String kycFontpic,
      String kycBackpic,
      String userid,
      String stateMedicalCouncil,
      String yearsOfExperience,
      String regNo) async {
    var result = await ApiRepo.addprofessionaldetails(specialtyIds, kycFontpic,
        kycBackpic, userid, stateMedicalCouncil, yearsOfExperience, regNo);
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resp = ProfessionaladdResponseData.fromJson(rr);
      return resp;
    } else {
      return null;
    }
  }

  @override
  Future<GetdoctordetailsResponseData?> getdoctordetails(String docId) async {
    var result = await ApiRepo.getdoctordetails(docId);
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resp = GetdoctordetailsResponseData.fromJson(rr);
      return resp;
    } else {
      return null;
    }
  }

  @override
  Future<GetallpatientsResponseData?> getpatientlists(String docId) async {
    var result = await ApiRepo.getpatientlists(docId);
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resp = GetallpatientsResponseData.fromJson(rr);
      return resp;
    } else {
      return null;
    }
  }

  @override
  Future<AddpatientpersonalinfoResponseData?> addpatientpersonalinfo(
      String userid,
      String img,
      String age,
      String gender,
      String ageTypes) async {
    var result = await ApiRepo.addpatientpersonalinfo(
        userid, img, age, gender, ageTypes);
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resps = AddpatientpersonalinfoResponseData.fromJson(rr);
      return resps;
    } else {
      return null;
    }
  }

  @override
  Future<AddmedicineResponseData?> addmedicine() async {
    var result = await ApiRepo.addmedicine();
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resp = AddmedicineResponseData.fromJson(rr);
      return resp;
    } else {
      return null;
    }
  }

  @override
  Future<GetmedicinesResponseData?> getmedicinelists() async {
    var result = await ApiRepo.getmedicinelists();
    var rr = "";
    if (result.statusCode == 200) {
      rr = await result.stream.bytesToString();
      print(rr);
      var resp = GetmedicinesResponseData.fromJson(rr);
      return resp;
    } else {
      return null;
    }
  }
}
