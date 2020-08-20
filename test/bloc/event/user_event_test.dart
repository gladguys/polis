import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/enum/configuracao.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('UserEvent tests', () {
    group('StoreUser', () {
      test('props', () {
        final ev1 = StoreUser(UserModel(userId: '1'));
        final ev2 = StoreUser(UserModel(userId: '1'));
        final ev3 = StoreUser(UserModel(userId: '2'));

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('Logout', () {
      test('props', () {
        final ev1 = Logout();
        final ev2 = Logout();

        expect(ev1 == ev2, true);
      });
    });

    group('ChangeUserConfig', () {
      test('props', () {
        final ev1 = ChangeUserConfig(
          value: true,
          config: Configuracao.isActivityInfoEnabled,
          user: UserModel(
            userId: '1',
          ),
        );
        final ev2 = ChangeUserConfig(
          value: true,
          config: Configuracao.isActivityInfoEnabled,
          user: UserModel(
            userId: '1',
          ),
        );
        final ev3 = ChangeUserConfig(
          value: true,
          config: Configuracao.isDarkModeEnabled,
          user: UserModel(
            userId: '1',
          ),
        );

        expect(ev1 == ev2, true);
        expect(ev1 == ev3, false);
      });
    });

    group('SetUserPickedTheme', () {
      test('props', () {
        final ev1 = SetUserPickedTheme(
          UserModel(
            userId: '1',
          ),
        );
        final ev2 = SetUserPickedTheme(
          UserModel(
            userId: '1',
          ),
        );
        final ev3 = SetUserPickedTheme(
          UserModel(
            userId: '2',
          ),
        );

        expect(ev1 == ev2, true);
        expect(ev1 == ev3, false);
      });
    });
  });
}
