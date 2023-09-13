import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../core/di/di.dart';
import '../core/repository/preference_repo.dart';
import '../pages/intro_page.dart';
import '../pages/main_dashboard_page.dart';
import '../service/navigation_service.dart';
part 'splash_view_model.g.dart';
class SplashViewModel = _SplashViewModel with _$SplashViewModel;



abstract class _SplashViewModel with Store {

  @observable
  int a = 0;

  @action
  inc(){
    a++;
  }

  final prefs = dependency<PreferenceRepo>();
  screenSwitch(){
    if(prefs.userid() == null){
      NavigationService().navigateToScreen(IntroPage());
    }else{
      NavigationService().navigateToScreen(MainDashboardPage());
    }
  }
}