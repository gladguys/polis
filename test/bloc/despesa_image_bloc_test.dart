import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';

import '../mock.dart';

void main() {
  group('DespesaImageBloc tests', () {
    DespesaImageBloc despesaImageBloc;
    MockUrlLauncherService mockUrlLauncherService;

    setUp(() {
      mockUrlLauncherService = MockUrlLauncherService();
      despesaImageBloc = DespesaImageBloc(
        urlLaunchService: mockUrlLauncherService,
      );
    });

    test('asserts', () {
      expect(
          () => DespesaImageBloc(
                urlLaunchService: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialDespesaImageState to be the initial state''', () {
      expect(despesaImageBloc.state, equals(InitialDespesaImageState()));
    });

    blocTest(
      'Expects to launch the url',
      build: () async {
        when(mockUrlLauncherService.launchUrl('url'))
            .thenAnswer((_) => Future.value(true));
        return despesaImageBloc;
      },
      act: (despesaImageBloc) async =>
          despesaImageBloc.add(OpenDespesaImage('url')),
      expect: [],
      verify: (despesaImageBloc) async =>
          verify(mockUrlLauncherService.launchUrl('url')).called(1),
    );

    blocTest(
      '''Expects [LoadingFavoritesPosts, FetchUserFavoritePostsFailed] when fails''',
      build: () async {
        when(mockUrlLauncherService.launchUrl(any)).thenThrow(Exception());
        return despesaImageBloc;
      },
      act: (despesaImageBloc) async =>
          despesaImageBloc.add(OpenDespesaImage('url')),
      expect: [LaunchUrlFailed()],
      verify: (favoritePostsBloc) async =>
          verify(mockUrlLauncherService.launchUrl('url')).called(1),
    );
  });
}
