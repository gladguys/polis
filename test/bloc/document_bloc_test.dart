import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';

import '../mock.dart';

void main() {
  group('DocumentBloc tests', () {
    DocumentBloc documentBloc;
    MockUrlLauncherService mockUrlLauncherService;

    setUp(() {
      mockUrlLauncherService = MockUrlLauncherService();
      documentBloc = DocumentBloc(
        urlLaunchService: mockUrlLauncherService,
      );
    });

    tearDown(() {
      documentBloc?.close();
    });

    test('asserts', () {
      expect(
          () => DocumentBloc(
                urlLaunchService: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialDespesaImageState to be the initial state''', () {
      expect(documentBloc.state, equals(InitialDocumentState()));
    });

    blocTest(
      'Expects to launch the url',
      build: () async {
        when(mockUrlLauncherService.launchUrl('url'))
            .thenAnswer((_) => Future.value(true));
        return documentBloc;
      },
      act: (despesaImageBloc) async =>
          despesaImageBloc.add(OpenDocumentImage('url')),
      expect: [],
      verify: (despesaImageBloc) async =>
          verify(mockUrlLauncherService.launchUrl('url')).called(1),
    );

    blocTest(
      '''Expects [LoadingFavoritesPosts, FetchUserFavoritePostsFailed] when fails''',
      build: () async {
        when(mockUrlLauncherService.launchUrl(any)).thenThrow(Exception());
        return documentBloc;
      },
      act: (despesaImageBloc) async =>
          despesaImageBloc.add(OpenDocumentImage('url')),
      expect: [LaunchUrlFailed()],
      verify: (favoritePostsBloc) async =>
          verify(mockUrlLauncherService.launchUrl('url')).called(1),
    );
  });
}
