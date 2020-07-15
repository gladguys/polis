import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../domain/enum/acao_type.dart';
import '../../../domain/enum/post_type.dart';
import '../../../domain/model/acao_usuario_model.dart';
import '../../../domain/model/models.dart';
import '../../../exception/exceptions.dart';
import '../../../extension/extensions.dart';
import '../../../i18n/i18n.dart';
import '../../../service/politico_service.dart';
import '../../abstract/repositories.dart';
import 'firebase.dart';

class FirebaseActionRepository implements ActionRepository {
  FirebaseActionRepository(
      {@required this.firestore, @required this.politicoService})
      : assert(firestore != null),
        assert(politicoService != null);

  final Firestore firestore;
  final PoliticoService politicoService;

  CollectionReference get actionsRef => firestore.collection(ACOES_COLLECTION);

  @override
  Future<void> saveUserAction({UserModel user, AcaoUsuarioModel acao}) async {
    try {
      final politicoId = acao.idPolitico;
      final politico = await politicoService.getPoliticoById(politicoId);

      final nomePolitico = acao.nomePolitico;
      final actionTypeDesc =
          acao.tipo == AcaoType.like ? STARTED_LIKING : STOPPED_LIKING;
      final tipoPostDesc =
          acao.tipoPost == PostType.PROPOSICAO ? A_PROPOSAL : AN_EXPENSE;
      final de = politico.sexo == MALE ? OF_THE_POLITIC : OF_THE_POLITIC_FEMALE;
      final mensagem =
          '''$actionTypeDesc $tipoPostDesc $de $nomePolitico $IN_DAY ${acao.data.toString().formatDateBig()}''';

      await actionsRef
          .document(user.userId)
          .collection(ACOES_USUARIO_SUBCOLLECTION)
          .add(acao
              .copyWith(
                sexoPolitico: politico.sexo,
                mensagem: mensagem,
              )
              .toJson());
    } on Exception {
      throw ComunicationException();
    }
  }
}
