import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../domain/dto/despesa_anual_por_tipo.dart';
import '../../../domain/dto/despesa_mensal.dart';
import '../../../domain/dto/despesa_por_tipo.dart';
import '../../../domain/dto/total_despesas_anuais.dart';
import '../../../exception/exceptions.dart';
import '../../abstract/repositories.dart';
import 'firebase.dart';

class FirebasePoliticExpensesAnalysisRepository
    implements PoliticExpensesAnalysisRepository {
  FirebasePoliticExpensesAnalysisRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get totalizadorDespesasRef =>
      firestore.collection(TOTALIZADOR_DESPESAS_COLLECTION);

  @override
  Future<TotalDespesasAnuais> getYearExpensesData(
      {String politicoId, String ano}) async {
    try {
      final doc = totalizadorDespesasRef
          .document(politicoId)
          .collection(TOTAIS_ANO_SUBCOLLECTION)
          .document(ano)
          .collection(TOTAL_MES_SUBCOLLECTION);
      final querySnapshot = await doc.getDocuments();
      final documents = querySnapshot.documents;

      final despesasPorMes = List.generate(
        documents.length,
        (i) => DespesaMensal(
            mes: documents[i].documentID, valor: documents[i].data['total']),
      );

      return TotalDespesasAnuais(
        ano: ano,
        despesasPorMes: despesasPorMes,
      );
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<DespesaAnualPorTipo> getYearExpensesByType(
      {String politicoId, String ano}) async {
    return DespesaAnualPorTipo(ano: '2020', despesas: [
      DespesaPorTipo(
        tipo: 'Divulgação da Atividade Parlamentar.',
        percentual: '44,60%',
        valor: '66.094,00',
      ),
      DespesaPorTipo(
        tipo: 'Manutenção de Escritório de Apoio à Atividade Parlamentar',
        percentual: '30,37%',
        valor: '45.003,38',
      ),
      DespesaPorTipo(
        tipo: 'Combustíveis e Lubrificantes.',
        percentual: '14,75%',
        valor: '21.856,11',
      ),
      DespesaPorTipo(
        tipo: 'Outros',
        percentual: '10,29%',
        valor: '15.249,50',
      ),
    ]);
  }
}
