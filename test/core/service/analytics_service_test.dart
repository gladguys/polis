import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/service/services.dart';

import '../../mock.dart';

void main() {
  group('AnalyticsService tests', () {
    AnalyticsService analyticsService;
    MockFirebaseAnalytics mockFirebaseAnalytics;

    setUp(() {
      mockFirebaseAnalytics = MockFirebaseAnalytics();
      analyticsService = AnalyticsService(analytics: mockFirebaseAnalytics);
    });

    test('should call setUserId with the given userId', () async {
      await analyticsService.setUserProperties(userId: '1');
      verify(mockFirebaseAnalytics.setUserId('1')).called(1);
    });

    test('should call logLogin with the given method', () async {
      await analyticsService.logSignin(method: 'GOOGLE');
      verify(mockFirebaseAnalytics.logLogin(loginMethod: 'GOOGLE')).called(1);
    });

    test('should call logSignup with the given method', () async {
      await analyticsService.logSignup();
      verify(mockFirebaseAnalytics.logSignUp(
              signUpMethod: 'EMAIL_AND_PASSWORD'))
          .called(1);
    });

    test('should call logBloc with the given method', () async {
      await analyticsService.logBloc(
        event: 'event',
        currentState: 'currentState',
        nextState: 'nextState',
      );
      verify(mockFirebaseAnalytics.logEvent(name: 'BLOC_EVENT', parameters: {
        'EVENT': 'event',
        'CURRENT_STATE': 'currentState',
        'NEXT_STATE': 'nextState',
      })).called(1);
    });

    test('should call logLogout with the given method', () async {
      await analyticsService.logLogout('bala');
      verify(
        mockFirebaseAnalytics.logEvent(
          name: 'LOGOUT',
          parameters: {
            'username': 'bala',
          },
        ),
      ).called(1);
    });
  });
}
