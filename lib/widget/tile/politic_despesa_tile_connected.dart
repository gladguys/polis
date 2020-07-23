import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
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
    return PageConnected<PostCubit>(
      bloc: PostCubit(
        post: despesa.toJson(),
        postRepository: context.repository<FirebasePostRepository>(),
        actionRepository: context.repository<FirebaseActionRepository>(),
        shareService: G<ShareService>(),
        userCubit: context.bloc<UserCubit>(),
      ),
      page: PoliticDespesaTile(despesa, clickableImage: clickableImage),
    );
  }
}
