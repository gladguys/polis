import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../model/models.dart';
import '../../page/page_connected.dart';
import '../../repository/concrete/repositories.dart';
import 'proposta_tile.dart';

class PropostaTileConnected extends StatelessWidget {
  PropostaTileConnected(this.proposta);

  final PropostaModel proposta;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PostBloc>(
      bloc: PostBloc(
        postRepository: context.repository<FirebasePostRepository>(),
      ),
      page: PropostaTile(proposta),
    );
  }
}
