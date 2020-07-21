import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/comment_model.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/post/comments/widget/comment_tile.dart';
import 'package:polis/page/post/comments/widget/menu_edit_delete_comment.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
    initializeDateFormatting('pt_BR', null);
  });

  testWidgets('should be different when user owns comment', (tester) async {
    await tester.pumpWidget(
      connectedWidget(
        PageConnected<UserBloc>(
          bloc: UserBloc(
            user: UserModel(
              userId: '1',
            ),
            repository: MockUserRepository(),
            analyticsService: MockAnalyticsService(),
            sharedPreferencesService: MockSharedPreferencesService(),
          ),
          page: CommentTile(
            CommentModel(
              id: 1,
              diaHora: DateTime.now(),
              texto: 'texto',
              usuarioNome: 'user',
              usuarioId: '1',
            ),
          ),
        ),
      ),
    );
  });

  testWidgets('should have menu to edit or delete if user owns comment',
      (tester) async {
    await tester.pumpWidget(
      connectedWidget(
        PageConnected<UserBloc>(
          bloc: UserBloc(
            user: UserModel(
              userId: '1',
            ),
            repository: MockUserRepository(),
            analyticsService: MockAnalyticsService(),
            sharedPreferencesService: MockSharedPreferencesService(),
          ),
          page: CommentTile(
            CommentModel(
              id: 1,
              diaHora: DateTime.now(),
              texto: 'texto',
              usuarioNome: 'user',
              usuarioId: '1',
            ),
          ),
        ),
      ),
    );
    expect(find.byType(MenuEditDeleteComment), findsOneWidget);
  });

  testWidgets('should go to user profile when click on name', (tester) async {
    await tester.pumpWidget(
      connectedWidget(
        PageConnected<UserBloc>(
          bloc: UserBloc(
            user: UserModel(
              userId: '1',
            ),
            repository: MockUserRepository(),
            analyticsService: MockAnalyticsService(),
            sharedPreferencesService: MockSharedPreferencesService(),
          ),
          page: CommentTile(
            CommentModel(
              id: 1,
              diaHora: DateTime.now(),
              texto: 'texto',
              usuarioNome: 'user',
              usuarioId: '1',
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('user'));
    await tester.pump();
    verify(mockObserver.didPush(any, any));
  });
}
