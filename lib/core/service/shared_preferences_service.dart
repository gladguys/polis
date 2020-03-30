import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/models.dart';

const USER_PREF = 'USER';

class SharedPreferencesService {
  SharedPreferencesService({@required this.sharedPreferences})
      : assert(sharedPreferences != null);

  final SharedPreferences sharedPreferences;

  Future<void> setUser(UserModel user) async {
    if (user != null) {
      await sharedPreferences.setString(USER_PREF, jsonEncode(user.toJson()));
    } else {
      await sharedPreferences.setString(USER_PREF, null);
    }
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
