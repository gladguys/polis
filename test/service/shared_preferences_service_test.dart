import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/service/services.dart';
import 'package:polis/model/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mock.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({
    'USER': null,
    'PARTIDO_HASH_PREF': 'PARTIDO_HASH',
    'POLITICO_HASH_PREF': 'POLITICO_HASH',
    'ORGAO_HASH_PREF': 'ORGAO_HASH',
  });
  MockSharedPreferences mockSharedPreferences;
  SharedPreferencesService sharedPreferencesService;

  group('SharedPreferencesService tests', () {
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
      sharedPreferencesService.setUser(null);
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

    group('setPartidoHash', () {
      test('non null', () {
        sharedPreferencesService.setUser(null);
        expect(sharedPreferencesService.getPartidoHash(), isNull);
        sharedPreferencesService.setPartidoHash('hash');
      });

      test('null', () {
        sharedPreferencesService.setUser(null);
        expect(sharedPreferencesService.getPartidoHash(), isNull);
        sharedPreferencesService.setPartidoHash(null);
        expect(sharedPreferencesService.getPartidoHash(), isNull);
      });
    });

    test('getPartidoHash', () {
      when(mockSharedPreferences.getString(PARTIDO_HASH_PREF))
          .thenReturn('PARTIDO_HASH');
      expect(sharedPreferencesService.getPartidoHash(), 'PARTIDO_HASH');
    });

    group('setPoliticoHash', () {
      test('non null', () {
        sharedPreferencesService.setUser(null);
        expect(sharedPreferencesService.getPoliticoHash(), isNull);
        sharedPreferencesService.setPoliticoHash('hash');
      });

      test('null', () {
        sharedPreferencesService.setUser(null);
        expect(sharedPreferencesService.getPoliticoHash(), isNull);
        sharedPreferencesService.setPoliticoHash(null);
        expect(sharedPreferencesService.getPoliticoHash(), isNull);
      });
    });

    test('getPoliticoHash', () {
      when(mockSharedPreferences.getString(POLITICO_HASH_PREF))
          .thenReturn('POLITICO_HASH');
      expect(sharedPreferencesService.getPoliticoHash(), 'POLITICO_HASH');
    });

    group('setOrgaoHash', () {
      test('non null', () {
        sharedPreferencesService.setUser(null);
        expect(sharedPreferencesService.getOrgaoHash(), isNull);
        sharedPreferencesService.setOrgaoHash('hash');
      });

      test('null', () {
        sharedPreferencesService.setUser(null);
        expect(sharedPreferencesService.getOrgaoHash(), isNull);
        sharedPreferencesService.setOrgaoHash(null);
        expect(sharedPreferencesService.getOrgaoHash(), isNull);
      });
    });

    test('getOrgaoHash', () {
      when(mockSharedPreferences.getString(ORGAO_HASH_PREF))
          .thenReturn('ORGAO_HASH');
      expect(sharedPreferencesService.getOrgaoHash(), 'ORGAO_HASH');
    });
  });
}
