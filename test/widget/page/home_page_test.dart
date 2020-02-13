import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/user_model.dart';
import 'package:polis/page/home/home_page.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/repository/concrete/firebase/firebase_user_repository.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  group('HomePage tests', () {
    testWidgets('should build withou explodinig', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: UserBloc(
              user: UserModel(),
              repository:
                  FirebaseUserRepository(firebaseAuth: FirebaseAuth.instance),
            ),
            page: HomePage(),
          ),
        ),
      );
    });

    testWidgets('should add logout when clicked logout btn', (tester) async {
      final mockUserBloc = MockUserBloc();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: HomePage(),
          ),
        ),
      );
      final logoutBtn = find.byType(Icon);
      await tester.tap(logoutBtn);
      verify(mockUserBloc.add(Logout())).called(1);
    });

    testWidgets('should logout when SignoutSucceded state', (tester) async {
      final mockUserBloc = MockUserBloc();
      whenListen(
        mockUserBloc,
        Stream<UserState>.fromIterable([InitialUser(), SignoutSucceded()]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: HomePage(),
          ),
        ),
      );
      final logoutBtn = find.byType(Icon);
      await tester.tap(logoutBtn);
      await tester.pumpAndSettle(Duration(seconds: 10));
      expect(find.byType(SigninPage), findsOneWidget);
    });

    testWidgets('should should snackbar when logout fails', (tester) async {
      final mockUserBloc = MockUserBloc();
      whenListen(
        mockUserBloc,
        Stream<UserState>.fromIterable([InitialUser(), SignoutFailed()]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: HomePage(),
          ),
        ),
      );
      await tester.pumpAndSettle(Duration(seconds: 10));
    });
  });
}
