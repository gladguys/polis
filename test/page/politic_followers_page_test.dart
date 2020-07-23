import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/card_base.dart';
import 'package:polis/widget/empty_info.dart';
import 'package:polis/widget/loading.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  MockPoliticFollowersCubit mockPoliticFollowersCubit;

  group('PoliticFollowersPage tests', () {
    setUp(() {
      mockPoliticFollowersCubit = MockPoliticFollowersCubit();
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticFollowersCubit>(
            bloc: mockPoliticFollowersCubit,
            page: PoliticFollowersPage(),
          ),
        ),
      );
    });

    testWidgets('should build connected without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PoliticFollowersPageConnected('1'),
        ),
      );
    });

    testWidgets('should show followers', (tester) async {
      when(mockPoliticFollowersCubit.state).thenReturn(
        GetPoliticFollowersSuccess(followers: [
          UsuarioSeguindoPolitico(
            userId: '1',
            name: 'name1',
            photoUrl: 'photo1',
            email: 'email1',
          ),
          UsuarioSeguindoPolitico(
            userId: '2',
            name: 'name2',
            photoUrl: null,
            email: 'email2',
          ),
        ]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticFollowersCubit>(
            bloc: mockPoliticFollowersCubit,
            page: PoliticFollowersPage(),
          ),
        ),
      );
      expect(find.byType(CardBase), findsNWidgets(2));
    });

    testWidgets('should EmptyInfo when there is not followers', (tester) async {
      when(mockPoliticFollowersCubit.state).thenReturn(
        GetPoliticFollowersSuccess(followers: []),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticFollowersCubit>(
            bloc: mockPoliticFollowersCubit,
            page: PoliticFollowersPage(),
          ),
        ),
      );
      expect(find.byType(EmptyInfo), findsOneWidget);
    });

    testWidgets('should show loading', (tester) async {
      when(mockPoliticFollowersCubit.state)
          .thenReturn(LoadingPoliticFollowers());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticFollowersCubit>(
            bloc: mockPoliticFollowersCubit,
            page: PoliticFollowersPage(),
          ),
        ),
      );
      expect(find.byType(Loading), findsOneWidget);
    });
  });
}
