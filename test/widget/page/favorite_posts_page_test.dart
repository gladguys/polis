import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/timeline/widget/timeline.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  MockFavoritePostsBloc mockFavoritePostsBloc;

  group('FavoritePostsPage tests', () {
    setUp(() {
      mockFavoritePostsBloc = MockFavoritePostsBloc();
    });

    testWidgets('shoud build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(FavoritePostsPageConnected()));
    });

    testWidgets('shoud show timeline when fetch success', (tester) async {
      when(mockFavoritePostsBloc.state)
          .thenReturn(FetchUserFavoritePostsSuccess([]));
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<FavoritePostsBloc>(
            bloc: mockFavoritePostsBloc,
            page: FavoritePostsPage(),
          ),
        ),
      );
      expect(find.byType(Timeline), findsOneWidget);
    });
  });
}
