import 'package:flutter/material.dart';

import '../../../model/despesa_model.dart';

class DespesaTile extends StatelessWidget {
  DespesaTile(this.despesa);

  final DespesaModel despesa;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(despesa.nomeFornecedor),
    );
  }
}
