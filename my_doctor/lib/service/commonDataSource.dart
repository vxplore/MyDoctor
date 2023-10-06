import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/repository/repository.dart';
import 'global_variables.dart';

class CommonDataSource {
  Future getDoctorDetails() async {
    final prefs = dependency<PreferenceRepo>();
    final repo = dependency<Repository>();
    var response = await repo.getdoctordetails(prefs.userid() ?? "");
    if (response == null) {
    } else {
      globalVariables.getDoctorDetailsFromApi = response;
    }
  }
}
