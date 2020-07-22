import '../domain/model/models.dart';
import 'concrete/firebase/firebase.dart';

bool isDocumentDespesa(Map<String, dynamic> document) =>
    document[TIPO_ATIVIDADE_FIELD] == 'DESPESA';

String getIdFromPost(dynamic post) {
  if (post is PropostaModel) {
    return post.idPropostaPolitico;
  } else if (post is DespesaModel) {
    return post.id;
  }
  return null;
}

String getPoliticoIdFromPost(dynamic post) {
  if (post is PropostaModel) {
    return post.idPoliticoAutor;
  } else if (post is DespesaModel) {
    return post.idPolitico;
  }
  return null;
}