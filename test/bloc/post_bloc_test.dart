import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

import '../mock.dart';

void main() {
  group('PostBloc tests', () {
    PostBloc postBloc;
    MockPostRepository mockPostRepository;

    setUp(() {
      mockPostRepository = MockPostRepository();
      postBloc = PostBloc(repository: mockPostRepository);
    });

    test('asserts', () {
      expect(() => PostBloc(repository: null), throwsAssertionError);
    });

    test('''Expects InitialPostState to be the initial state''', () {
      expect(postBloc.state, equals(InitialPostState()));
    });

    blocTest(
      'mapEventToState',
      build: () async => postBloc,
      act: (postBloc) async => postBloc.add(LikePost('1')),
      expect: [],
    );
  });
}
