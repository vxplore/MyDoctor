// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgotPasswordPhNo_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordPhNumberViewModel
    on _ForgotPasswordPhNumberViewModel, Store {
  late final _$emailControllerAtom = Atom(
      name: '_ForgotPasswordPhNumberViewModel.emailController',
      context: context);

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

  @override
  String toString() {
    return '''
emailController: ${emailController}
    ''';
  }
}
