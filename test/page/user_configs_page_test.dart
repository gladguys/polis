import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/enum/configuracao.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  MockUserBloc mockUserBloc;

  group('UserConfigsPage tests', () {
    setUp(() {
      mockUserBloc = MockUserBloc();
    });

    testWidgets('should build without exploding', (tester) async {
      when(mockUserBloc.user).thenReturn(
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
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
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
      when(mockUserBloc.user).thenReturn(user);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: UserConfigsPage(),
          ),
        ),
      );
      final firstConfig = find.byKey(configSwitchKey).first;
      await tester.tap(firstConfig);
      await tester.pumpAndSettle();
      verify(
        mockUserBloc.add(
          ChangeUserConfig(
            user: user,
            config: Configuracao.isNotificationEnabled,
            value: false,
          ),
        ),
      );
    });
  });
}
