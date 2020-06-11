import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/despesa_model.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/widget/button_action_card.dart';
import 'package:polis/widget/post/post_despesa.dart';

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

  DespesaModel despesa;

  group('PostDespesa tests', () {
    setUp(() {
      despesa = DespesaModel(
        fotoPolitico: 'foto',
        nomePolitico: 'nome',
        nomeFornecedor: 'fornecedor',
        tipoAtividade: 'ativi',
        tipoDespesa: 'despesa',
        valorLiquido: '3.51',
        valorDocumento: '3.51',
        valorGlosa: '3.51',
        dataDocumento: '10-01-2020',
        urlDocumento: 'urlDoc',
        urlPartidoLogo: 'logo',
      );
    });

    test('assert', () {
      expect(
          () => PostDespesa(
                null,
                screenshotController: MockScreenshotController(),
              ),
          throwsAssertionError);
      expect(
          () => PostDespesa(
                DespesaModel(),
                screenshotController: null,
              ),
          throwsAssertionError);
    });

    testWidgets('should build without exploding', (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.state).thenReturn(InitialPostState());
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostDespesa(
              despesa,
              screenshotController: MockScreenshotController(),
            ),
          ),
        ),
      );
    });

    testWidgets('should do something when click on card', (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.state).thenReturn(InitialPostState());
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostDespesa(
              despesa,
              screenshotController: MockScreenshotController(),
            ),
          ),
        ),
      );
      final card = find.byKey(cardBaseContentKey);
      expect(card, findsOneWidget);
      await tester.tap(card);
    });

    testWidgets('should do something when click on share btn', (tester) async {
      final mockFile = MockFile();
      final mockScreenshotController = MockScreenshotController();
      when(mockScreenshotController.capture())
          .thenAnswer((_) => Future.value(mockFile));
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.state).thenReturn(InitialPostState());
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostDespesa(
              despesa,
              screenshotController: mockScreenshotController,
            ),
          ),
        ),
      );
      final shareButton = find.byWidgetPredicate((widget) {
        if (widget is ButtonActionCard &&
            widget.icon == FontAwesomeIcons.shareAlt) {
          return true;
        }
        return false;
      });
      expect(shareButton, findsOneWidget);
      await tester.tap(shareButton);
      verify(mockPostBloc.add(SharePost(postImage: mockFile))).called(1);
    });

    testWidgets('should do something when click on bookmark btn',
        (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.state).thenReturn(InitialPostState());
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostDespesa(
              despesa,
              screenshotController: MockScreenshotController(),
            ),
          ),
        ),
      );
      final likeButton = find.byWidgetPredicate((widget) {
        if (widget is ButtonActionCard &&
            widget.icon == FontAwesomeIcons.bookmark) {
          return true;
        }
        return false;
      });
      expect(likeButton, findsOneWidget);
      await tester.tap(likeButton);
    });

    testWidgets('should go to profile page when click on politic photo',
        (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.state).thenReturn(InitialPostState());
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostDespesa(
              despesa,
              screenshotController: MockScreenshotController(),
            ),
          ),
        ),
      );
      final politicPhoto = find.byType(ClipRRect);
      expect(politicPhoto, findsOneWidget);
      await tester.tap(politicPhoto);
      verify(mockObserver.didPush(any, any));
    });

    testWidgets('should open despesa image when clicked document icon',
        (tester) async {
      final mockDocumentBloc = MockDocumentBloc();
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.state).thenReturn(InitialPostState());
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PageConnected<DocumentBloc>(
              bloc: mockDocumentBloc,
              page: PostDespesa(
                despesa,
                screenshotController: MockScreenshotController(),
              ),
            ),
          ),
        ),
      );
      final despesaIcon = find.byKey(despesaImageIconKey);
      expect(despesaIcon, findsOneWidget);
      await tester.tap(despesaIcon);
      verify(mockDocumentBloc.add(OpenDocumentImage('urlDoc'))).called(1);
    });
  });
}
