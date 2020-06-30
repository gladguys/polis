import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../page/page_connected.dart';
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
        userBloc: context.bloc<UserBloc>(),
      ),
      page: PoliticDespesaTile(despesa, clickableImage: clickableImage),
    );
  }
}
