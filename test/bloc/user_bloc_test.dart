import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/models.dart';

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
      expect(() => UserBloc(user: UserModel(), repository: null),
          throwsAssertionError);
      expect(() => UserBloc(repository: mockUserRepository, user: null),
          throwsAssertionError);
    });

    test('Expects InitialUser to be the initial state', () {
      expect(userBloc.state, equals(InitialUser()));
    });

    blocTest(
      'Expects [SignoutLoading, SignoutSucceded] when Logout'
      'added',
      build: () async {
        when(mockUserRepository.signOut()).thenAnswer((_) => Future.value());
        return userBloc;
      },
      act: (userBloc) {
        userBloc.add(Logout());
        return;
      },
      verify: (userBloc) async {
        verify(mockUserRepository.signOut()).called(1);
      },
      expect: [
        SignoutLoading(),
        SignoutSucceded(),
      ],
    );

    blocTest(
      'Expects [SignoutLoading, SignoutFailed] when Logout fails',
      build: () async {
        when(mockUserRepository.signOut()).thenThrow(SignOutException());
        return userBloc;
      },
      act: (userBloc) {
        userBloc.add(Logout());
        return;
      },
      verify: (userBloc) async {
        verify(mockUserRepository.signOut()).called(1);
      },
      expect: [
        SignoutLoading(),
        SignoutFailed(),
      ],
    );
  });
}
