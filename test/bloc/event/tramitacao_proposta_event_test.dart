import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('TramitacaoPropostaEvent tests', () {
    group('FetchTramitacoesProposicao', () {
      test('props', () {
        final ev1 = FetchTramitacoesProposicao(PropostaModel());
        final ev2 = FetchTramitacoesProposicao(PropostaModel());

        expect(ev1, ev2);
      });
    });

    test('asserts', () {
      expect(
          () => ChangeUserPassword(
                newPassword: null,
                currentPassword: 'c',
              ),
          throwsAssertionError);
      expect(
          () => ChangeUserPassword(
                newPassword: 'n',
                currentPassword: null,
              ),
          throwsAssertionError);
    });
  });
}
