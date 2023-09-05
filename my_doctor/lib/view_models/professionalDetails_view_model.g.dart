// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professionalDetails_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfessionalDetailsViewModel on _ProfessionalDetailsViewModel, Store {
  late final _$registrationNumberControllerAtom = Atom(
      name: '_ProfessionalDetailsViewModel.registrationNumberController',
      context: context);

  @override
  TextEditingController get registrationNumberController {
    _$registrationNumberControllerAtom.reportRead();
    return super.registrationNumberController;
  }

  @override
  set registrationNumberController(TextEditingController value) {
    _$registrationNumberControllerAtom
        .reportWrite(value, super.registrationNumberController, () {
      super.registrationNumberController = value;
    });
  }

  late final _$stateMedicalCouncilControllerAtom = Atom(
      name: '_ProfessionalDetailsViewModel.stateMedicalCouncilController',
      context: context);

  @override
  TextEditingController get stateMedicalCouncilController {
    _$stateMedicalCouncilControllerAtom.reportRead();
    return super.stateMedicalCouncilController;
  }

  @override
  set stateMedicalCouncilController(TextEditingController value) {
    _$stateMedicalCouncilControllerAtom
        .reportWrite(value, super.stateMedicalCouncilController, () {
      super.stateMedicalCouncilController = value;
    });
  }

  late final _$specialityControllerAtom = Atom(
      name: '_ProfessionalDetailsViewModel.specialityController',
      context: context);

  @override
  TextEditingController get specialityController {
    _$specialityControllerAtom.reportRead();
    return super.specialityController;
  }

  @override
  set specialityController(TextEditingController value) {
    _$specialityControllerAtom.reportWrite(value, super.specialityController,
        () {
      super.specialityController = value;
    });
  }

  late final _$yearsOfExperienceControllerAtom = Atom(
      name: '_ProfessionalDetailsViewModel.yearsOfExperienceController',
      context: context);

  @override
  TextEditingController get yearsOfExperienceController {
    _$yearsOfExperienceControllerAtom.reportRead();
    return super.yearsOfExperienceController;
  }

  @override
  set yearsOfExperienceController(TextEditingController value) {
    _$yearsOfExperienceControllerAtom
        .reportWrite(value, super.yearsOfExperienceController, () {
      super.yearsOfExperienceController = value;
    });
  }

  @override
  String toString() {
    return '''
registrationNumberController: ${registrationNumberController},
stateMedicalCouncilController: ${stateMedicalCouncilController},
specialityController: ${specialityController},
yearsOfExperienceController: ${yearsOfExperienceController}
    ''';
  }
}
