import 'package:shared_preferences/shared_preferences.dart';

import '../repository/preference_repo.dart';

class PreferenceRepoImpl extends PreferenceRepo {
  SharedPreferences instance;

  PreferenceRepoImpl(this.instance);

  Future<bool> setUserId(String userid) {
    return instance.setString("UserId", userid);
  }
  @override
  String? userid() {
    return instance.getString("UserId");
  }
}