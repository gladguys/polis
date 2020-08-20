import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/widget/button_action_card.dart';
import 'package:polis/widget/post/post_proposta.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('pt_BR', null);

  PropostaModel proposta;

  group('PostProposta tests', () {
    setUp(() {
      proposta = PropostaModel(
        fotoPolitico: 'foto',
        nomePolitico: 'nome',
        ementa: 'ementa',
        siglaPartido: 'sigla',
        tipoDocumento: 'tipo',
        status: 'status',
        dataAtualizacao: '10-01-2020',
        nomesAutores: ['a', 'b', 'c'],
        foiAtualizada: true,
        urlPartidoLogo: 'logo',
        qtdCurtidas: 0,
        qtdNaoCurtidas: 0,
      );
    });

    test('assert', () {
      expect(
          () => PostProposta(
                null,
                screenshotController: MockScreenshotController(),
              ),
          throwsAssertionError);
      expect(
          () => PostProposta(
                PropostaModel(),
                screenshotController: null,
              ),
          throwsAssertionError);
    });

    testWidgets('should build without exploding', (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(true);
      when(mockPostBloc.post).thenReturn(proposta.toJson());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostProposta(
              proposta,
              screenshotController: MockScreenshotController(),
            ),
          ),
        ),
      );
    });

    testWidgets('should build dark mode without exploding', (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(true);
      when(mockPostBloc.post).thenReturn(proposta.toJson());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostProposta(
              proposta,
              screenshotController: MockScreenshotController(),
            ),
          ),
          useDarkMode: true,
        ),
      );
    });

    testWidgets(
        'should style diferent when descricaoTipo equals PLENARY_AMENDMENT',
        (tester) async {
      final propostaDesc = proposta = PropostaModel(
        fotoPolitico: 'foto',
        nomePolitico: 'nome',
        ementa: 'ementa',
        siglaPartido: 'sigla',
        tipoDocumento: 'tipo',
        status: 'status',
        dataAtualizacao: '10-01-2020',
        descricaoTipo: PLENARY_AMENDMENT,
        nomesAutores: ['a', 'b', 'c'],
        foiAtualizada: false,
        urlPartidoLogo: 'logo',
      );
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(true);
      when(mockPostBloc.post).thenReturn(proposta.toJson());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostProposta(
              propostaDesc,
              screenshotController: MockScreenshotController(),
            ),
          ),
        ),
      );
      expect(find.text(PLENARY_AMENDMENT), findsOneWidget);
    });

    testWidgets('should do something when click on share btn', (tester) async {
      final mockFile = MockFile();
      final mockScreenshotController = MockScreenshotController();
      when(mockScreenshotController.capture())
          .thenAnswer((_) => Future.value(mockFile));
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(true);
      when(mockPostBloc.post).thenReturn(proposta.toJson());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostProposta(
              proposta,
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
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      when(mockPostBloc.post).thenReturn(proposta.toJson());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostProposta(
              proposta,
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
      when(mockPostBloc.isPostFavorite).thenReturn(true);
      when(mockPostBloc.post).thenReturn(proposta.toJson());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostProposta(
              proposta,
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

    testWidgets('should open document when theres one', (tester) async {
      final mockProposta = proposta.copyWith(
        urlInteiroTeor: 'iqjdpoqpoq',
      );
      final mockDocumentBloc = MockDocumentBloc();
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(true);
      when(mockPostBloc.post).thenReturn(proposta.toJson());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PageConnected<DocumentBloc>(
              bloc: mockDocumentBloc,
              page: PostProposta(
                mockProposta,
                screenshotController: MockScreenshotController(),
              ),
            ),
          ),
        ),
      );
      final seeDocumentButton = find.byKey(seePropostaDocumentKey);
      await tester.tap(seeDocumentButton);
      verify(mockDocumentBloc.add(OpenDocumentImage('iqjdpoqpoq')));
    });

    testWidgets('should go to tramitations page when click on icon',
        (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(true);
      when(mockPostBloc.post).thenReturn(proposta.toJson());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostProposta(
              proposta,
              screenshotController: MockScreenshotController(),
            ),
          ),
        ),
      );
      final tramitationsIcon = find.byKey(tramitationsIconKey);
      expect(tramitationsIcon, findsOneWidget);
      await tester.tap(tramitationsIcon);
      verify(mockObserver.didPush(any, any));
    });
  });
}
