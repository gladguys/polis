import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';

import '../mock.dart';

void main() {
  TramitacaoPropostaBloc tramitacaoPropostaBloc;
  MockTramitacaoPropostaRepository mockTramitacaoPropostaRepository;
  MockOrgaoService mockOrgaoService;

  group('TramitacaoPropostaBloc tests', () {
    setUp(() {
      mockTramitacaoPropostaRepository = MockTramitacaoPropostaRepository();
      mockOrgaoService = MockOrgaoService();
      tramitacaoPropostaBloc = TramitacaoPropostaBloc(
        repository: mockTramitacaoPropostaRepository,
        orgaoService: mockOrgaoService,
      );
    });

    tearDown(() {
      tramitacaoPropostaBloc?.close();
    });

    test('asserts', () {
      expect(
          () => TramitacaoPropostaBloc(
                repository: null,
                orgaoService: MockOrgaoService(),
              ),
          throwsAssertionError);

      expect(
          () => TramitacaoPropostaBloc(
                repository: mockTramitacaoPropostaRepository,
                orgaoService: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialTimelineState to be the initial state''', () {
      expect(tramitacaoPropostaBloc.state,
          equals(InitialTramitacaoPropostaState()));
    });

    blocTest(
      '''Expects [LoadingTramitacaoProposta, GetTramitacaoPropostaSuccess] success''',
      build: () async {
        when(mockTramitacaoPropostaRepository.getTramitacoesProposta('1'))
            .thenAnswer(
          (_) => Future.value([TramitacaoPropostaModel()]),
        );
        return tramitacaoPropostaBloc;
      },
      act: (tramitacaoPropostaBloc) {
        tramitacaoPropostaBloc.add(
          FetchTramitacoesProposicao(
            PropostaModel(
              id: '1',
            ),
          ),
        );
        return;
      },
      verify: (tramitacaoPropostaBloc) async {
        verify(mockTramitacaoPropostaRepository.getTramitacoesProposta('1'))
            .called(1);
      },
      expect: [
        LoadingTramitacaoProposta(),
        GetTramitacaoPropostaSuccess([TramitacaoPropostaModel()]),
      ],
    );

    blocTest(
      '''Expects [LoadingTramitacaoProposta, GetTramitacaoPropostaSuccess] when failed''',
      build: () async {
        when(mockTramitacaoPropostaRepository.getTramitacoesProposta('1'))
            .thenThrow(Exception());
        return tramitacaoPropostaBloc;
      },
      act: (tramitacaoPropostaBloc) {
        tramitacaoPropostaBloc.add(
          FetchTramitacoesProposicao(
            PropostaModel(
              id: '1',
            ),
          ),
        );
        return;
      },
      verify: (tramitacaoPropostaBloc) async {
        verify(mockTramitacaoPropostaRepository.getTramitacoesProposta('1'))
            .called(1);
      },
      expect: [
        LoadingTramitacaoProposta(),
        GetTramitacaoPropostaFailed(),
      ],
    );
  });
}
