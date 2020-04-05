import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../model/models.dart';
import '../../page/page_connected.dart';
import '../../repository/concrete/repositories.dart';
import 'despesa_tile.dart';

class DespesaTileConnected extends StatelessWidget {
  DespesaTileConnected(this.despesa);

  final DespesaModel despesa;

  @override
  Widget build(BuildContext context) {
    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    print(despesa);
    return PageConnected<PostBloc>(
      bloc: PostBloc(
        postRepository: context.repository<FirebasePostRepository>(),
      ),
      page: DespesaTile(despesa),
    );
  }
}
