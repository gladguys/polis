import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/enum/post_type.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/utils/general_utils.dart';

void main() {
  group('General utils tests', () {
    test('getPostType', () {
      expect(getPostType(PropostaModel()), PostType.PROPOSICAO);
      expect(getPostType(DespesaModel()), PostType.DESPESA);
    });

    test('isPostProposal', () {
      expect(isPostProposal(PropostaModel()), true);
      expect(isPostProposal(DespesaModel()), false);
    });

    test('getPostId', () {
      expect(getPostId(PropostaModel(idPropostaPolitico: '1')), '1');
      expect(getPostId(DespesaModel(id: '1')), '1');
    });

    test('getPoliticoIdFromPost', () {
      expect(getPoliticoIdFromPost(PropostaModel(idPoliticoAutor: '1')), '1');
      expect(getPoliticoIdFromPost(DespesaModel(idPolitico: '1')), '1');
    });
  });
}
