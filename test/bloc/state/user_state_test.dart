import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('UserState tests', () {
    test('states', () {
      expect(InitialUser(), InitialUser());
      expect(SignoutLoading(), SignoutLoading());
      expect(SignoutSucceded(), SignoutSucceded());
      expect(SignoutFailed(), SignoutFailed());
      expect(UpdateCurrentUserFailed(), UpdateCurrentUserFailed());
      expect(CurrentUserUpdated(UserModel()), CurrentUserUpdated(UserModel()));
    });
  });
}
