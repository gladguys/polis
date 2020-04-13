import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/widget/button_action_card.dart';
import 'package:polis/widget/post/post_proposta.dart';

import '../mock.dart';
import 'utils.dart';

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
        dataDocumento: '10-01-2020',
        dataApresentacao: '10-01-2020',
      );
    });

    testWidgets('should build without exploding', (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(true);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostProposta(proposta),
          ),
        ),
      );
    });

    testWidgets('should do something when click on share btn', (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(true);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostProposta(proposta),
          ),
        ),
      );
      final likeButton = find.byWidgetPredicate((widget) {
        if (widget is ButtonActionCard &&
            widget.icon == FontAwesomeIcons.shareAlt) {
          return true;
        }
        return false;
      });
      expect(likeButton, findsOneWidget);
      await tester.tap(likeButton);
    });

    testWidgets('should do something when click on bookmark btn',
        (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostProposta(proposta),
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
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostProposta(proposta),
          ),
        ),
      );
      final politicPhoto = find.byType(ClipRRect);
      expect(politicPhoto, findsOneWidget);
      await tester.tap(politicPhoto);
      verify(mockObserver.didPush(any, any));
    });
  });
}
