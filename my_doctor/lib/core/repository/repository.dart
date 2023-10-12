import '../di/di.dart';
import '../utilites/addMedicine_response_data.dart';
import '../utilites/addPatientPersonalInfo_response_data.dart';
import '../utilites/getAllPatients_response_data.dart';
import '../utilites/getDoctorDetails_response_data.dart';
import '../utilites/getMedicineList_response_data.dart';
import '../utilites/login_response_data.dart';
import '../utilites/otp_response_data.dart';
import '../utilites/professional_add_response_data.dart';
import '../utilites/register_response_data.dart';
import 'api_repo.dart';

abstract class Repository {
  final ApiRepo = dependency<ApiRepository>();

  Future<LoginResponseData?> login(String email, String password);

  Future<RegisterResponseData?> register(
      String name, String number, String email, String password, String image);

  Future<OtpResponseData?> otpverify(String otp, String phnumber);

  Future getdoctorspecializationlist();

  Future<ProfessionaladdResponseData?> addprofessionaldetails(
      String specialtyIds,
      String kycFontpic,
      String kycBackpic,
      String userid,
      String stateMedicalCouncil,
      String yearsOfExperience,
      String regNo);

  Future<GetdoctordetailsResponseData?> getdoctordetails(String docId);

  Future<GetallpatientsResponseData?> getpatientlists(String docId);

  Future<AddpatientpersonalinfoResponseData?> addpatientpersonalinfo(
      String userid, String img, String age, String gender, String ageTypes);

  Future<AddmedicineResponseData?> addmedicine();
  Future<GetmedicinesResponseData?> getmedicinelists();
}
