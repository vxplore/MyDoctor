import 'package:http/http.dart ' as http;

abstract class ApiRepository {
  Future<http.StreamedResponse> getdoctordetails(String docId);
}
