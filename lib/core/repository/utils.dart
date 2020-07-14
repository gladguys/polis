import '../domain/model/models.dart';

bool isDocumentDespesa(Map<String, dynamic> document) =>
    document['tipoAtividade'] == 'DESPESA';

String getIdFromPost(dynamic post) {
  if (post is PropostaModel) {
    return post.idPropostaPolitico;
  } else if (post is DespesaModel) {
    return post.id;
  }
  return null;
}
