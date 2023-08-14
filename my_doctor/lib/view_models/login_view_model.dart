import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';
class LoginViewModel = _LoginViewModel with _$LoginViewModel;



abstract class _LoginViewModel with Store {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}