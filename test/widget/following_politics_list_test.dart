import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/user_following_politics/user_following_politics_bloc.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/user_following_politics/widget/following_politics_list.dart';
import 'package:polis/widget/photo.dart';

import '../mock.dart';
import 'utils.dart';

void main() {
  group('FollowingPoliticsList tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(
        FollowingPoliticsList([]),
      ));
    });

    testWidgets('should go to politic profile when click on photo',
        (tester) async {
      final mockUserFollowingPoliticsBloc = MockUserFollowingPoliticsBloc();
      when(mockUserFollowingPoliticsBloc.isPoliticBeingFollowed(any))
          .thenReturn(false);
      await tester.pumpWidget(connectedWidget(
        PageConnected<UserFollowingPoliticsBloc>(
          bloc: mockUserFollowingPoliticsBloc,
          page: FollowingPoliticsList([
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
              urlFoto: 'photo',
              urlPartidoLogo: 'logo',
            ),
          ]),
        ),
      ));
      final photo = find.byType(Photo);
      expect(photo, findsOneWidget);
      await tester.tap(photo);
    });
  });
}
