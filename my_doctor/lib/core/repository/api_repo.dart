import 'package:http/http.dart ' as http;

abstract class ApiRepository {
  Future<http.StreamedResponse> login(String email, String password);

  Future<http.StreamedResponse> register(
      String name, String number, String email, String password, String image);

  Future<http.StreamedResponse> otpverify(String otp, String phnumber);

  Future<http.StreamedResponse> getdoctordetails(String docId);

  Future<http.StreamedResponse> getdoctorspecializationlist();

  Future<http.StreamedResponse> addprofessionaldetails(
      String specialtyIds,
      String kycFontpic,
      String kycBackpic,
      String userid,
      String stateMedicalCouncil,
      String yearsOfExperience,
      String regNo);

  Future<http.StreamedResponse> getpatientlists(String docId);

  Future<http.StreamedResponse> addpatientpersonalinfo(
      String userid, String img, String age, String gender, String ageTypes);

  Future<http.StreamedResponse> addmedicine();

  Future<http.StreamedResponse> getmedicinedosageform();

  Future<http.StreamedResponse> getmedicinename();

  Future<http.StreamedResponse> getmedicinedosagequantity();

  Future<http.StreamedResponse> getmedicinedosageregimen();

  Future<http.StreamedResponse> getmedicinedosagedurations();

  Future<http.StreamedResponse> getmedicinelists();

  Future<http.StreamedResponse> verifymobileno(String phNo);
}
