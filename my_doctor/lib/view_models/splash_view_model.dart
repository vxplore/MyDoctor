import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
part 'splash_view_model.g.dart';
class SplashViewModel = _SplashViewModel with _$SplashViewModel;



abstract class _SplashViewModel with Store {

  @observable
  int a = 0;

  @action
  inc(){
    a++;
  }
}