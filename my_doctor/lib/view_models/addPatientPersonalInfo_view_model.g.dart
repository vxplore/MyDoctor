// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addPatientPersonalInfo_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddPatientPersonalInfoViewModel
    on _AddPatientPersonalInfoViewModel, Store {
  late final _$mobileNumberControllerAtom = Atom(
      name: '_AddPatientPersonalInfoViewModel.mobileNumberController',
      context: context);

  @override
  TextEditingController get mobileNumberController {
    _$mobileNumberControllerAtom.reportRead();
    return super.mobileNumberController;
  }

  @override
  set mobileNumberController(TextEditingController value) {
    _$mobileNumberControllerAtom
        .reportWrite(value, super.mobileNumberController, () {
      super.mobileNumberController = value;
    });
  }

  late final _$fullNameControllerAtom = Atom(
      name: '_AddPatientPersonalInfoViewModel.fullNameController',
      context: context);

  @override
  TextEditingController get fullNameController {
    _$fullNameControllerAtom.reportRead();
    return super.fullNameController;
  }

  @override
  set fullNameController(TextEditingController value) {
    _$fullNameControllerAtom.reportWrite(value, super.fullNameController, () {
      super.fullNameController = value;
    });
  }

  @override
  String toString() {
    return '''
mobileNumberController: ${mobileNumberController},
fullNameController: ${fullNameController}
    ''';
  }
}
