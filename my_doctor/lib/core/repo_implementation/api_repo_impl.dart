import 'package:my_doctor/core/repository/api_repo.dart';
import 'package:http/http.dart ' as http;

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<http.StreamedResponse> getdoctordetails(String docId) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://v-xplore.com/dev/rohan/e-prescription/user/doctor/details?doctorId=${docId}'));

    return await request.send();
  }
}
