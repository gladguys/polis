import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/utils.dart';

void main() {
  test('isDocumentDespesa', () {
    expect(isDocumentDespesa({TIPO_ATIVIDADE_FIELD: 'DESPESA'}), true);
  });

  test('getIdFromPost', () {
    final postProposta = PropostaModel(
      id: '1',
      idPropostaPolitico: '123',
    );
    final postDespesa = DespesaModel(
      id: '321',
    );
    expect(getIdFromPost(postProposta), '123');
    expect(getIdFromPost(postDespesa), '321');
  });
}
