import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/user_model.dart';

import '../mock.dart';

void main() {
  final user = UserModel(userId: '1');

  group('UserBloc tests', () {
    UserBloc userBloc;
    MockUserRepository mockUserRepository;

    setUp(() {
      mockUserRepository = MockUserRepository();
      userBloc = UserBloc(user: user, repository: mockUserRepository);
    });

    test('test asserts', () {
      expect(() => UserBloc(user: UserModel()), throwsAssertionError);
      expect(
          () => UserBloc(repository: mockUserRepository), throwsAssertionError);
    });

    blocTest(
      'Expects InitialUser to be the initial state',
      build: () => userBloc,
      expect: [
        InitialUser(),
      ],
    );

    blocTest(
      'Expects [InitialUser, SignoutLoading, SignoutSucceded] when Logout'
      'added',
      build: () {
        when(mockUserRepository.signOut()).thenAnswer((_) => Future.value());
        return userBloc;
      },
      act: (userBloc) {
        userBloc.add(Logout());
        return;
      },
      verify: () async {
        verify(mockUserRepository.signOut()).called(1);
      },
      expect: [
        InitialUser(),
        SignoutLoading(),
        SignoutSucceded(),
      ],
    );

    blocTest(
      'Expects [InitialUser, SignoutLoading, SignoutFailed] when Logout fails',
      build: () {
        when(mockUserRepository.signOut()).thenThrow(SignOutException());
        return userBloc;
      },
      act: (userBloc) {
        userBloc.add(Logout());
        return;
      },
      verify: () async {
        verify(mockUserRepository.signOut()).called(1);
      },
      expect: [
        InitialUser(),
        SignoutLoading(),
        SignoutFailed(),
      ],
    );
  });
}
