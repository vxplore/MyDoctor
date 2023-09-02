// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationViewModel on _RegistrationViewModel, Store {
  late final _$nameControllerAtom =
      Atom(name: '_RegistrationViewModel.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$mobileControllerAtom =
      Atom(name: '_RegistrationViewModel.mobileController', context: context);

  @override
  TextEditingController get mobileController {
    _$mobileControllerAtom.reportRead();
    return super.mobileController;
  }

  @override
  set mobileController(TextEditingController value) {
    _$mobileControllerAtom.reportWrite(value, super.mobileController, () {
      super.mobileController = value;
    });
  }

  late final _$emailControllerAtom =
      Atom(name: '_RegistrationViewModel.emailController', context: context);

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  late final _$passwordControllerAtom =
      Atom(name: '_RegistrationViewModel.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$reenterpassowrdControllerAtom = Atom(
      name: '_RegistrationViewModel.reenterpassowrdController',
      context: context);

  @override
  TextEditingController get reenterpassowrdController {
    _$reenterpassowrdControllerAtom.reportRead();
    return super.reenterpassowrdController;
  }

  @override
  set reenterpassowrdController(TextEditingController value) {
    _$reenterpassowrdControllerAtom
        .reportWrite(value, super.reenterpassowrdController, () {
      super.reenterpassowrdController = value;
    });
  }

  @override
  String toString() {
    return '''
nameController: ${nameController},
mobileController: ${mobileController},
emailController: ${emailController},
passwordController: ${passwordController},
reenterpassowrdController: ${reenterpassowrdController}
    ''';
  }
}
