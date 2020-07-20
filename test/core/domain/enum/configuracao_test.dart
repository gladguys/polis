import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/enum/configuracao.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('Configuracao tests', () {
    test('isActionFollowUnfollow', () {
      expect(
        isConfigEnabledForUser(
          user: UserModel(
            userConfigs: {
              'isActivityInfoEnabled': true,
            },
          ),
          configuracao: Configuracao.isActivityInfoEnabled,
        ),
        true,
      );
    });

    group('isConfigEnabledForUser', () {
      group(
          '''should return default of each config in case user dont have configs setted''',
          () {
        test('isActivityInfoEnabled should default to true', () {
          expect(
            isConfigEnabledForUser(
              user: UserModel(
                userConfigs: {},
              ),
              configuracao: Configuracao.isActivityInfoEnabled,
            ),
            true,
          );
        });

        test('isNotificationEnabled should default to true', () {
          expect(
            isConfigEnabledForUser(
              user: UserModel(
                userConfigs: {},
              ),
              configuracao: Configuracao.isNotificationEnabled,
            ),
            true,
          );
        });

        test('isDarkModeEnabled should default to false', () {
          expect(
            isConfigEnabledForUser(
              user: UserModel(
                userConfigs: {},
              ),
              configuracao: Configuracao.isDarkModeEnabled,
            ),
            false,
          );
        });
      });
    });

    test('isThemeConfig', () {
      expect(isThemeConfig('isDarkModeEnabled'), true);
    });

    test('stringToConfig', () {
      expect(stringToConfig('isNotificationEnabled'),
          Configuracao.isNotificationEnabled);
      expect(stringToConfig('isActivityInfoEnabled'),
          Configuracao.isActivityInfoEnabled);
      expect(
          stringToConfig('isDarkModeEnabled'), Configuracao.isDarkModeEnabled);
    });

    test('configToStringKey', () {
      expect(configToStringKey(Configuracao.isNotificationEnabled),
          'isNotificationEnabled');
      expect(configToStringKey(Configuracao.isActivityInfoEnabled),
          'isActivityInfoEnabled');
      expect(configToStringKey(Configuracao.isDarkModeEnabled),
          'isDarkModeEnabled');
    });

    test('getConfigDefaultValue', () {
      expect(getConfigDefaultValue(Configuracao.isNotificationEnabled), true);
      expect(getConfigDefaultValue(Configuracao.isActivityInfoEnabled), true);
      expect(getConfigDefaultValue(Configuracao.isDarkModeEnabled), false);
    });

    test('getConfigValueForUser', () {
      expect(
        getConfigValueForUser(
          user: UserModel(
            userConfigs: {
              'isActivityInfoEnabled': true,
            },
          ),
          configuracao: Configuracao.isActivityInfoEnabled,
        ),
        true,
      );
      expect(
        getConfigValueForUser(
          user: UserModel(
            userConfigs: {
              'isActivityInfoEnabled': false,
            },
          ),
          configuracao: Configuracao.isActivityInfoEnabled,
        ),
        false,
      );
    });

    test('configToDescription', () {
      expect(configToDescription(Configuracao.isNotificationEnabled),
          'Habilitar notificações?');
      expect(configToDescription(Configuracao.isActivityInfoEnabled),
          'Habilitar visualização de suas informações?');
      expect(configToDescription(Configuracao.isDarkModeEnabled),
          'Usar modo escuro?');
    });
  });
}
