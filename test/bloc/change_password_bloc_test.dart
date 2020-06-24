import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/exception/exceptions.dart';

import '../mock.dart';

void main() {
  group('EditProfileBloc tests', () {
    ChangePasswordBloc changePasswordBloc;
    MockChangePasswordRepository mockChangePasswordRepository;

    setUp(() {
      mockChangePasswordRepository = MockChangePasswordRepository();
      changePasswordBloc = ChangePasswordBloc(
        repository: mockChangePasswordRepository,
      );
    });

    tearDown(() {
      changePasswordBloc?.close();
    });

    test('asserts', () {
      expect(() => ChangePasswordBloc(repository: null), throwsAssertionError);
    });

    test('''Expects InitialChangePasswordState to be the initial state''', () {
      expect(changePasswordBloc.state, equals(ChangePasswordState.initial()));
    });

    blocTest(
      '''Expects [UserPasswordChanging, UserPasswordChangeSuccess] when ChangeUserPassword called''',
      build: () async {
        when(
          mockChangePasswordRepository.changeUserPassword(
            currentPassword: 'current',
            newPassword: 'newOne',
          ),
        ).thenAnswer((_) async => {});
        return changePasswordBloc;
      },
      act: (changePasswordBloc) async => changePasswordBloc.add(
        ChangeUserPassword(
          currentPassword: 'current',
          newPassword: 'newOne',
        ),
      ),
      expect: [
        UserPasswordChanging(),
        UserPasswordChangeSuccess(),
      ],
      verify: (changePasswordBloc) async {
        verify(
          mockChangePasswordRepository.changeUserPassword(
            currentPassword: 'current',
            newPassword: 'newOne',
          ),
        ).called(1);
      },
    );

    blocTest(
      '''Expects [UserPasswordChanging, UserWrongPasswordInformed] when current password is wrong''',
      build: () async {
        when(
          mockChangePasswordRepository.changeUserPassword(
            currentPassword: 'current',
            newPassword: 'newOne',
          ),
        ).thenThrow(WrongPasswordException());
        return changePasswordBloc;
      },
      act: (changePasswordBloc) async => changePasswordBloc.add(
        ChangeUserPassword(
          currentPassword: 'current',
          newPassword: 'newOne',
        ),
      ),
      expect: [
        UserPasswordChanging(),
        UserWrongPasswordInformed(),
      ],
      verify: (changePasswordBloc) async {
        verify(
          mockChangePasswordRepository.changeUserPassword(
            currentPassword: 'current',
            newPassword: 'newOne',
          ),
        ).called(1);
      },
    );

    blocTest(
      '''Expects [UserPasswordChanging, UserPasswordChangeFailed] when some exception is thrown''',
      build: () async {
        when(
          mockChangePasswordRepository.changeUserPassword(
            currentPassword: 'current',
            newPassword: 'newOne',
          ),
        ).thenThrow(Exception());
        return changePasswordBloc;
      },
      act: (changePasswordBloc) async => changePasswordBloc.add(
        ChangeUserPassword(
          currentPassword: 'current',
          newPassword: 'newOne',
        ),
      ),
      expect: [
        UserPasswordChanging(),
        UserPasswordChangeFailed(),
      ],
      verify: (changePasswordBloc) async {
        verify(mockChangePasswordRepository.changeUserPassword(
          currentPassword: 'current',
          newPassword: 'newOne',
        )).called(1);
      },
    );
  });
}
