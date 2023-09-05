// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OtpViewModel on _OtpViewModel, Store {
  late final _$otpControllerAtom =
      Atom(name: '_OtpViewModel.otpController', context: context);

  @override
  TextEditingController get otpController {
    _$otpControllerAtom.reportRead();
    return super.otpController;
  }

  @override
  set otpController(TextEditingController value) {
    _$otpControllerAtom.reportWrite(value, super.otpController, () {
      super.otpController = value;
    });
  }

  late final _$showToastAtom =
      Atom(name: '_OtpViewModel.showToast', context: context);

  @override
  String? get showToast {
    _$showToastAtom.reportRead();
    return super.showToast;
  }

  @override
  set showToast(String? value) {
    _$showToastAtom.reportWrite(value, super.showToast, () {
      super.showToast = value;
    });
  }

  @override
  String toString() {
    return '''
otpController: ${otpController},
showToast: ${showToast}
    ''';
  }
}
