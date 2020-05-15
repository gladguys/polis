import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../model/models.dart';
import '../../page/page_connected.dart';
import '../../repository/concrete/repositories.dart';
import 'politic_despesa_tile.dart';

class PoliticDespesaTileConnected extends StatelessWidget {
  const PoliticDespesaTileConnected(
    this.despesa, {
    this.clickableImage = true,
  });

  final DespesaModel despesa;
  final bool clickableImage;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PostBloc>(
      bloc: PostBloc(
        post: despesa.toJson(),
        postRepository: context.repository<FirebasePostRepository>(),
        shareService: G<ShareService>(),
      ),
      page: PoliticDespesaTile(despesa, clickableImage: clickableImage),
    );
  }
}