import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/tramitacao_proposta/tramitacao_proposta_cubit.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  TramitacaoPropostaCubit tramitacaoPropostaCubit;
  MockTramitacaoPropostaRepository mockTramitacaoPropostaRepository;
  MockOrgaoService mockOrgaoService;

  group('TramitacaoPropostaBloc tests', () {
    setUp(() {
      mockTramitacaoPropostaRepository = MockTramitacaoPropostaRepository();
      mockOrgaoService = MockOrgaoService();
      tramitacaoPropostaCubit = TramitacaoPropostaCubit(
        repository: mockTramitacaoPropostaRepository,
        orgaoService: mockOrgaoService,
      );
    });

    tearDown(() {
      tramitacaoPropostaCubit?.close();
    });

    test('asserts', () {
      expect(
          () => TramitacaoPropostaCubit(
                repository: null,
                orgaoService: MockOrgaoService(),
              ),
          throwsAssertionError);

      expect(
          () => TramitacaoPropostaCubit(
                repository: mockTramitacaoPropostaRepository,
                orgaoService: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialTimelineState to be the initial state''', () {
      expect(tramitacaoPropostaCubit.state,
          equals(InitialTramitacaoPropostaState()));
    });

    blocTest(
      '''Expects [LoadingTramitacaoProposta, GetTramitacaoPropostaSuccess] success''',
      build: () {
        when(mockTramitacaoPropostaRepository.getTramitacoesProposta('1'))
            .thenAnswer(
          (_) => Future.value([TramitacaoPropostaModel()]),
        );
        return tramitacaoPropostaCubit;
      },
      act: (tramitacaoPropostaCubit) {
        tramitacaoPropostaCubit.fetchTramitacoesProposicao(
          PropostaModel(
            id: '1',
          ),
        );
        return;
      },
      verify: (tramitacaoPropostaCubit) async {
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
      build: () {
        when(mockTramitacaoPropostaRepository.getTramitacoesProposta('1'))
            .thenThrow(Exception());
        return tramitacaoPropostaCubit;
      },
      act: (tramitacaoPropostaCubit) {
        tramitacaoPropostaCubit.fetchTramitacoesProposicao(
          PropostaModel(
            id: '1',
          ),
        );
        return;
      },
      verify: (tramitacaoPropostaCubit) async {
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
