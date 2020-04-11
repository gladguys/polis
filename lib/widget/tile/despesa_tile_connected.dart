import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../model/models.dart';
import '../../page/page_connected.dart';
import '../../repository/concrete/repositories.dart';
import 'despesa_tile.dart';
import 'despesa_tile_complete.dart';

class DespesaTileConnected extends StatelessWidget {
  DespesaTileConnected(
    this.despesa, {
    this.clickableImage = true,
    this.isComplete = false,
  });

  final DespesaModel despesa;
  final bool clickableImage;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PostBloc>(
      bloc: PostBloc(
        post: despesa.toJson(),
        postRepository: context.repository<FirebasePostRepository>(),
      ),
      page: PageConnected<DespesaImageBloc>(
        bloc: DespesaImageBloc(
          urlLaunchService: G<UrlLauncherService>(),
        ),
        page: isComplete
            ? DespesaTileComplete(despesa, clickableImage: clickableImage)
            : DespesaTile(despesa, clickableImage: clickableImage),
      ),
    );
  }
}
