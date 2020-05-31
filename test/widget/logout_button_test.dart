import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/user_profile/widget/logout_button.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  testWidgets('should call logout from block', (tester) async {
    final mockUserBloc = MockUserBloc();
    when(mockUserBloc.user).thenReturn(
      UserModel(
        name: 'name',
        email: 'email',
        photoUrl: 'photo',
      ),
    );
    await tester.pumpWidget(
      connectedWidget(
        PageConnected<UserBloc>(
          bloc: mockUserBloc,
          page: LogoutButton(),
        ),
      ),
    );
    final logoutButton = find.byKey(logoutButtonKey);
    expect(logoutButton, findsOneWidget);
    await tester.tap(logoutButton);
    verify(mockUserBloc.add(Logout())).called(1);
  });
}
