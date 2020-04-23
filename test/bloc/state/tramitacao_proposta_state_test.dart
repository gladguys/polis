import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('TramitacaoPropostaState tests', () {
    test('states', () {
      expect(
          InitialTramitacaoPropostaState(), InitialTramitacaoPropostaState());
      expect(
          GetTramitacaoPropostaSuccess([]), GetTramitacaoPropostaSuccess([]));
      expect(GetTramitacaoPropostaFailed(), GetTramitacaoPropostaFailed());
      expect(LoadingTramitacaoProposta(), LoadingTramitacaoProposta());
    });
  });
}
