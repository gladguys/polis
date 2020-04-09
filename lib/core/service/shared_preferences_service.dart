import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/models.dart';

const USER_PREF = 'USER';
const PARTIDO_HASH_PREF = 'PARTIDO_HASH';
const POLITICO_HASH_PREF = 'POLITICO_HASH';

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

  Future<void> setPartidoHash(String partidoHash) async {
    if (partidoHash != null) {
      await sharedPreferences.setString(PARTIDO_HASH_PREF, partidoHash);
    } else {
      await sharedPreferences.setString(PARTIDO_HASH_PREF, null);
    }
  }

  String getPartidoHash() {
    return sharedPreferences.getString(PARTIDO_HASH_PREF);
  }

  Future<void> setPoliticoHash(String politicoHash) async {
    if (politicoHash != null) {
      await sharedPreferences.setString(POLITICO_HASH_PREF, politicoHash);
    } else {
      await sharedPreferences.setString(POLITICO_HASH_PREF, null);
    }
  }

  String getPoliticoHash() {
    return sharedPreferences.getString(POLITICO_HASH_PREF);
  }
}
