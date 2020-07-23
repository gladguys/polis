import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/enum/configuracao.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  MockUserCubit mockUserCubit;

  group('UserConfigsPage tests', () {
    setUp(() {
      mockUserCubit = MockUserCubit();
    });

    testWidgets('should build without exploding', (tester) async {
      when(mockUserCubit.user).thenReturn(
        UserModel(
          userId: '1',
          userConfigs: {
            'isNotificationEnabled': true,
            'isActivityInfoEnabled': true,
            'isDarkModeEnabled': true,
          },
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserCubit>(
            bloc: mockUserCubit,
            page: UserConfigsPage(),
          ),
        ),
      );
    });

    testWidgets('should call bloc when change', (tester) async {
      final user = UserModel(
        userId: '1',
        userConfigs: {
          'isNotificationEnabled': true,
          'isActivityInfoEnabled': true,
          'isDarkModeEnabled': true,
        },
      );
      when(mockUserCubit.user).thenReturn(user);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserCubit>(
            bloc: mockUserCubit,
            page: UserConfigsPage(),
          ),
        ),
      );
      final firstConfig = find.byKey(configSwitchKey).first;
      await tester.tap(firstConfig);
      await tester.pumpAndSettle();
      verify(
        mockUserCubit.changeUserConfig(
          currentUser: user,
          config: Configuracao.isNotificationEnabled,
          configValue: false,
        ),
      );
    });
  });
}
