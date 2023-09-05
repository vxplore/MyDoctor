import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:my_doctor/service/navigation_service.dart';

import '../pages/congratulations_page.dart';

part 'professionalDetails_view_model.g.dart';

class ProfessionalDetailsViewModel = _ProfessionalDetailsViewModel
    with _$ProfessionalDetailsViewModel;

abstract class _ProfessionalDetailsViewModel with Store {
  @observable
  TextEditingController registrationNumberController = TextEditingController();
  @observable
  TextEditingController stateMedicalCouncilController = TextEditingController();
  @observable
  TextEditingController specialityController = TextEditingController();
  @observable
  TextEditingController yearsOfExperienceController = TextEditingController();

  bool isAllFieldComplete() {
    if (registrationNumberController.text.isNotEmpty &&
        stateMedicalCouncilController.text.isNotEmpty &&
        specialityController.text.isNotEmpty &&
        yearsOfExperienceController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  onNextPageClicked() {
    NavigationService().navigateToScreen(CongratulationsPage());
  }
}
