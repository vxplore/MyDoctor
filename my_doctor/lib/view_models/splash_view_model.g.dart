// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashViewModel on _SplashViewModel, Store {
  late final _$aAtom = Atom(name: '_SplashViewModel.a', context: context);

  @override
  int get a {
    _$aAtom.reportRead();
    return super.a;
  }

  @override
  set a(int value) {
    _$aAtom.reportWrite(value, super.a, () {
      super.a = value;
    });
  }

  late final _$_SplashViewModelActionController =
      ActionController(name: '_SplashViewModel', context: context);

  @override
  dynamic inc() {
    final _$actionInfo = _$_SplashViewModelActionController.startAction(
        name: '_SplashViewModel.inc');
    try {
      return super.inc();
    } finally {
      _$_SplashViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
a: ${a}
    ''';
  }
}
