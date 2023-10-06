import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:my_doctor/core/repository/api_repo.dart';
import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../core/repository/repository.dart';
import '../core/utilites/getAllPatients_response_data.dart';
import '../service/global_variables.dart';

part 'myPatient_view_model.g.dart';

class MyPatientViewModel = _MyPatientViewModel with _$MyPatientViewModel;

abstract class _MyPatientViewModel with Store {
  final prefs = dependency<PreferenceRepo>();

  Future<GetallpatientsResponseData?> getAllPatient() async {
    final repo = dependency<Repository>();
    var response = await repo.getpatientlists(prefs.userid() ?? "");


    if (response == null) {
      return null;
    } else {
      // globalVariables.getAllPatientsFromApi = response;
      return response;
    }
  }
}
