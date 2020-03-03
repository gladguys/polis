import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  AnalyticsService({this.firebaseAnalytics});

  FirebaseAnalytics firebaseAnalytics;

  Future<void> setUserProperties({String userId}) async {
    await firebaseAnalytics.setUserId(userId);
  }

  Future<void> logSignin({String method}) async {
    await firebaseAnalytics.logLogin(loginMethod: method);
  }

  Future<void> logSignup() async {
    await firebaseAnalytics.logSignUp(signUpMethod: 'EMAIL_AND_PASSWORD');
  }
}
