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

    test('asserts', () {
      expect(() => ChangePasswordBloc(repository: null), throwsAssertionError);
    });

    test('''Expects InitialChangePasswordState to be the initial state''', () {
      expect(changePasswordBloc.state, equals(InitialChangePasswordState()));
    });

    blocTest(
      'Expects [UserPasswordChangeSuccess] when ChangeUserPassword called',
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
      'Expects [UserWrongPasswordInformed] when current password is wrong',
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
      'Expects [UserPasswordChangeFailed] when some exception is thrown',
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
