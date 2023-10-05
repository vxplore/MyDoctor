import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repo_implementation/api_repo_impl.dart';
import '../repo_implementation/pref_repo_impl.dart';
import '../repository/api_repo.dart';
import '../repository/preference_repo.dart';

final dependency = GetIt.instance;

Future<void> setupLocator() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  dependency
      .registerLazySingleton<PreferenceRepo>(() => PreferenceRepoImpl(prefs));
  dependency.registerLazySingleton<ApiRepository>(() => ApiRepositoryImpl());
}
