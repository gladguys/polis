import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/service/services.dart';
import 'package:polis/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mock.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({
    'USER': null,
  });
  MockSharedPreferences mockSharedPreferences;
  SharedPreferencesService sharedPreferencesService;

  group('CrashlyticsService tests', () {
    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      sharedPreferencesService =
          SharedPreferencesService(sharedPreferences: mockSharedPreferences);
    });

    test('assert', () {
      expect(() => SharedPreferencesService(sharedPreferences: null),
          throwsAssertionError);
    });

    test('setUser', () {
      expect(sharedPreferencesService.getUser(), isNull);
      sharedPreferencesService.setUser(UserModel());
    });

    test('getUser', () {
      final user = UserModel(
        userId: '1',
      );
      final userEncoded = jsonEncode(user.toJson());
      when(mockSharedPreferences.getString('USER')).thenReturn(userEncoded);
      expect(sharedPreferencesService.getUser(), user);
    });
  });
}
