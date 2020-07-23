import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';

import '../mock.dart';

void main() {
  group('DocumentBloc tests', () {
    DocumentCubit documentCubit;
    MockUrlLauncherService mockUrlLauncherService;

    setUp(() {
      mockUrlLauncherService = MockUrlLauncherService();
      documentCubit = DocumentCubit(
        urlLaunchService: mockUrlLauncherService,
      );
    });

    tearDown(() {
      documentCubit?.close();
    });

    test('asserts', () {
      expect(
          () => DocumentCubit(
                urlLaunchService: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialDespesaImageState to be the initial state''', () {
      expect(documentCubit.state, equals(InitialDocumentState()));
    });

    blocTest(
      'Expects to launch the url',
      build: () {
        when(mockUrlLauncherService.launchUrl('url'))
            .thenAnswer((_) => Future.value(true));
        return documentCubit;
      },
      act: (documentCubit) async => documentCubit.openDocumentImage('url'),
      expect: [],
      verify: (despesaImageBloc) async =>
          verify(mockUrlLauncherService.launchUrl('url')).called(1),
    );

    blocTest(
      '''Expects [LoadingFavoritesPosts, FetchUserFavoritePostsFailed] when fails''',
      build: () {
        when(mockUrlLauncherService.launchUrl(any)).thenThrow(Exception());
        return documentCubit;
      },
      act: (documentCubit) async => documentCubit.openDocumentImage('url'),
      expect: [
        LaunchUrlFailed(),
      ],
      verify: (favoritePostsBloc) async =>
          verify(mockUrlLauncherService.launchUrl('url')).called(1),
    );
  });
}
