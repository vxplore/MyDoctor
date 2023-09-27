import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'addPatientPersonalInfo_view_model.g.dart';

class AddPatientPersonalInfoViewModel = _AddPatientPersonalInfoViewModel
    with _$AddPatientPersonalInfoViewModel;


abstract class  _AddPatientPersonalInfoViewModel with Store{
  @observable
  TextEditingController mobileNumberController = TextEditingController();
  @observable
  TextEditingController fullNameController = TextEditingController();

}
