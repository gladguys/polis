import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/post/comments/widget/comment_tile.dart';
import 'package:polis/page/post/comments/widget/menu_edit_delete_comment.dart';

import '../../../mock.dart';
import '../../../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
    initializeDateFormatting('pt_BR', null);
  });

  group('description', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          CommentTile(
            CommentModel(
              id: 1,
              texto: 'texto',
              usuarioNome: 'user',
              diaHora: DateTime.now(),
            ),
          ),
          withScaffold: true,
        ),
      );
    });

    testWidgets('should go to sub comments page when click on comments',
        (tester) async {
      final mockCommentBloc = MockCommentBloc();
      when(mockCommentBloc.post).thenReturn(
        PropostaModel(
          id: '1',
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: CommentTile(
              CommentModel(
                id: 1,
                texto: 'texto',
                usuarioNome: 'user',
                diaHora: DateTime.now(),
              ),
            ),
          ),
          withScaffold: true,
        ),
      );
      final comments = find.byKey(commentsKey);
      await tester.tap(comments);
      verify(mockObserver.didPush(any, any));
    });
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

  testWidgets('should open menu and edit comment', (tester) async {
    final mockCommentBloc = MockCommentBloc();
    final comment = CommentModel(
      id: 1,
      diaHora: DateTime.now(),
      texto: 'texto',
      usuarioNome: 'user',
      usuarioId: '1',
    );
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
          page: PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: CommentTile(comment),
          ),
        ),
      ),
    );
    expect(find.byType(MenuEditDeleteComment), findsOneWidget);
    final menuOpen = find.byKey(menuEditDeleteKey);
    expect(menuOpen, findsOneWidget);
    await tester.tap(menuOpen);
    await tester.pumpAndSettle();
    final editOption = find.text(EDIT);
    expect(editOption, findsOneWidget);
    await tester.tap(editOption);
    verify(mockCommentBloc.add(StartEditingComment(comment)));
  });

  testWidgets('should open menu and delete comment', (tester) async {
    final mockCommentBloc = MockCommentBloc();
    final comment = CommentModel(
      id: 1,
      diaHora: DateTime.now(),
      texto: 'texto',
      usuarioNome: 'user',
      usuarioId: '1',
    );
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
          page: PageConnected<CommentBloc>(
            bloc: mockCommentBloc,
            page: CommentTile(comment),
          ),
        ),
      ),
    );
    expect(find.byType(MenuEditDeleteComment), findsOneWidget);
    final menuOpen = find.byKey(menuEditDeleteKey);
    expect(menuOpen, findsOneWidget);
    await tester.tap(menuOpen);
    await tester.pumpAndSettle();
    final deleteOption = find.text(DELETE);
    expect(deleteOption, findsOneWidget);
    await tester.tap(deleteOption);
    verify(mockCommentBloc.add(DeleteComment(comment)));
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
