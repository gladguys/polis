import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/enum/acao_type.dart';
import 'package:polis/core/domain/enum/post_type.dart';
import 'package:polis/core/domain/model/acao_usuario_model.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/user_profile/widget/like_unlike_action_tile.dart';
import 'package:polis/widget/card_base.dart';

import '../../../mock.dart';
import '../../../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    initializeDateFormatting('pt_BR', null);
  });

  group('LikeUnlikeActionTile tests', () {
    testWidgets('should build without exploding', (tester) async {
      final mockUserProfileCubit = MockUserProfileCubit();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserCubit>(
            bloc: mockUserProfileCubit,
            page: Scaffold(
              body: LikeUnlikeActionTile(
                action: AcaoUsuarioModel(
                  nomePolitico: 'nome',
                  idPolitico: '1',
                  sexoPolitico: 'M',
                  mensagem: 'msg',
                  tipo: AcaoType.follow,
                  urlFotoPolitico: 'foto',
                  tipoPost: PostType.PROPOSICAO,
                  idPost: '1',
                  data: DateTime.now(),
                ),
              ),
            ),
          ),
        ),
      );
    });

    testWidgets('should add GetPostInfo when tap', (tester) async {
      final mockUserProfileCubit = MockUserProfileCubit();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserProfileCubit>(
            bloc: mockUserProfileCubit,
            page: Scaffold(
              body: LikeUnlikeActionTile(
                action: AcaoUsuarioModel(
                  nomePolitico: 'nome',
                  idPolitico: '1',
                  sexoPolitico: 'M',
                  mensagem: 'msg',
                  tipo: AcaoType.follow,
                  urlFotoPolitico: 'foto',
                  tipoPost: PostType.PROPOSICAO,
                  idPost: '1',
                  data: DateTime.now(),
                ),
              ),
            ),
          ),
        ),
      );
      final card = find.byType(CardBase);
      expect(card, findsOneWidget);
      await tester.tap(card);
      verify(
        mockUserProfileCubit.getPostInfo(
          postId: '1',
          politicId: '1',
          postType: PostType.PROPOSICAO,
        ),
      );
    });
  });
}
