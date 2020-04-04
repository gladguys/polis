import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  AnalyticsService({this.analytics});

  FirebaseAnalytics analytics;

  Future<void> setUserProperties({String userId}) async {
    await analytics.setUserId(userId);
  }

  Future<void> logSignin({String method}) async {
    await analytics.logLogin(loginMethod: method);
  }

  Future<void> logSignup() async {
    await analytics.logSignUp(signUpMethod: 'EMAIL_AND_PASSWORD');
  }

  Future<void> logLogout(String username) async {
    await analytics.logEvent(
      name: 'LOGOUT',
      parameters: {
        'username': username,
      },
    );
  }

  Future<void> logBloc(
      {String event, String currentState, String nextState}) async {
    await analytics.logEvent(name: 'BLOC_EVENT', parameters: {
      'EVENT': event,
      'CURRENT_STATE': currentState,
      'NEXT_STATE': nextState,
    });
  }
}
