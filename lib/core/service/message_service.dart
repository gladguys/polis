import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../exception/exceptions.dart';
import '../repository/concrete/firebase/firebase.dart';
import 'services.dart';

class MessageService {
  MessageService({
    @required this.firebaseMessaging,
    @required this.firestore,
    @required this.sharedPreferencesService,
  })  : assert(firebaseMessaging != null),
        assert(firestore != null),
        assert(sharedPreferencesService != null);

  final FirebaseMessaging firebaseMessaging;
  final Firestore firestore;
  final SharedPreferencesService sharedPreferencesService;

  Future<void> initMessaging() async {
    final user = await sharedPreferencesService.getUser();
    firebaseMessaging.configure(
      onMessage: (var message) async {},
      onLaunch: (var message) async {},
      onResume: (var message) async {},
    );
    firebaseMessaging.onTokenRefresh.listen((token) async {
      if (user != null) {
        saveUserToken(userId: user.userId, token: token);
        sharedPreferencesService.setUser(user.copyWith(fcmToken: token));
      }
    });
  }

  Future<String> getUserToken() async {
    return await firebaseMessaging.getToken();
  }

  Future<String> saveUserToken({String userId, String token}) async {
    try {
      final fcmToken = token ?? await getUserToken();
      await firestore.collection(USERS_COLLECTION).document(userId).updateData({
        FCM_TOKEN: fcmToken,
      });
      return fcmToken;
    } on Exception {
      throw ComunicationException();
    }
  }
}
