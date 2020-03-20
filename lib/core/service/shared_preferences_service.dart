import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';

const USER_PREF = 'USER';

class SharedPreferencesService {
  SharedPreferencesService({this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  Future<void> setUser(UserModel user) async {
    await sharedPreferences.setString(USER_PREF, jsonEncode(user.toJson()));
  }

  UserModel getUser() {
    final userEncoded = sharedPreferences.getString(USER_PREF);
    return userEncoded != null
        ? UserModel.fromJson(jsonDecode(userEncoded))
        : null;
  }

  bool isUserLogged() {
    return getUser() != null;
  }
}
